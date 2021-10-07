import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:cloud_functions/cloud_functions.dart';
import 'package:crypto/crypto.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/exceptions/firestore_api_exception.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:kakao_flutter_sdk/common.dart';
import 'package:kakao_flutter_sdk/user.dart' as kakao;
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'auth_base.dart';
import 'firestore_database.dart';

final authServiceProvider =
    Provider<AuthBase>((ref) => FirebaseAuthService(ref.read));

final userStreamProvider = StreamProvider.autoDispose<User?>(
    (ref) => ref.watch(authServiceProvider).userChanges);

final authStateChangesProvider = StreamProvider.autoDispose<User?>(
    (ref) => ref.watch(authServiceProvider).authStateChanges);

final appUserStreamProvider = StreamProvider.autoDispose<AppUser?>((ref) {
  final userAsyncValue = ref.watch(userStreamProvider);
  final database = ref.read(databaseProvider);
  return userAsyncValue.when(
    data: (user) => user?.isAnonymous == true
        ? Stream<AppUser?>.empty()
        : database.appUserStream(user),
    loading: () => Stream<AppUser?>.empty(),
    error: (_, __) => Stream<AppUser?>.empty(),
  );
});

class FirebaseAuthService with AuthBase {
  FirebaseAuthService(this._read);
  final Reader _read;
  final _firebaseAuth = FirebaseAuth.instance;

  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      // 'profile',
      'email',
      //'openid',
    ],
  );

  @override
  Future<User?> get currentUser async => _firebaseAuth.currentUser;

  @override
  Future<AppUser?> get currentAppUser async =>
      userFromFirebase(await currentUser);

  @override
  Future<AppUser?> userFromFirebase(User? user) async =>
      user == null || user.isAnonymous ? null : await fetchUser(user);

  @override
  Stream<User?> get authStateChanges => _firebaseAuth
      .authStateChanges()
      .asyncMap((User? user) async => user ?? await signInAnonymously());

  @override
  Stream<User?> get iDTokenChanges => _firebaseAuth
      .idTokenChanges()
      .asyncMap((User? user) async => user ?? await signInAnonymously());

  @override
  Stream<User?> get userChanges =>
      _firebaseAuth.userChanges().asyncMap((User? user) async => user);

  @override
  Future<AppUser?> createUser(User user) async {
    try {
      final database = _read(databaseProvider);
      print('createUser: $user');
      await database.setAppUser(user);
      return await database.getAppUser(user.uid);
    } catch (error) {
      throw FirestoreApiException(
        message: LocaleKeys.failedToCreateNewUser.tr(),
        devDetails: '$error',
      );
    }
  }

  @override
  Future<AppUser?> fetchUser(User user) async {
    final database = _read(databaseProvider);
    print('fetchUser: $user');
    if (user.uid.isNotEmpty) {
      print('user.uid: ${user.uid}');
      AppUser? appUser = await database.getAppUser(user.uid);
      return appUser ??= await createUser(user);
    } else {
      throw FirestoreApiException(
        message: LocaleKeys.uidPassedEmpty.tr(),
      );
    }
  }

  @override
  Future<void> deleteUser(AppUser appUser) async {
    try {
      final database = _read(databaseProvider);
      await database.updateAppUser(appUser.copyWith(deletedUser: true));
      await _firebaseAuth.currentUser!.delete();
      print('deleteUser: $appUser');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print(
            'The user must reauthenticate before this operation can be executed.');
      }
    }
  }

  @override
  Future<AppUser?> signInWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userFromFirebase(userCredential.user);
  }

  @override
  Future<AppUser?> createUserWithEmailAndPassword(
      String email, String password) async {
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userFromFirebase(userCredential.user);
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<AppUser?> signInWithEmailAndLink(
      {required String email, required String link}) async {
    final userCredential =
        await _firebaseAuth.signInWithEmailLink(email: email, emailLink: link);
    return userFromFirebase(userCredential.user);
  }

  @override
  bool isSignInWithEmailLink(String link) {
    return _firebaseAuth.isSignInWithEmailLink(link);
  }

  @override
  Future<void> sendSignInWithEmailLink({
    required String email,
    required String url,
    required bool handleCodeInApp,
    required String iOSBundleId,
    required String androidPackageName,
    required bool androidInstallApp,
    required String androidMinimumVersion,
  }) async {
    return _firebaseAuth.sendSignInLinkToEmail(
      email: email,
      actionCodeSettings: ActionCodeSettings(
        url: url,
        handleCodeInApp: handleCodeInApp,
        iOSBundleId: iOSBundleId,
        androidPackageName: androidPackageName,
        androidInstallApp: androidInstallApp,
        androidMinimumVersion: androidMinimumVersion,
      ),
    );
  }

  @override
  Future<AppUser?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;

      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        // Create a new credential.
        final googleCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        // Sign in to Firebase with the Google [UserCredential].
        final googleUserCredential =
            await _firebaseAuth.signInWithCredential(googleCredential);
        return userFromFirebase(googleUserCredential.user);
      } else {
        throw PlatformException(
            code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
            message: LocaleKeys.missingGoogleAuthToken.tr());
      }
    } else {
      throw PlatformException(
          code: 'ERROR_ABORTED_BY_USER',
          message: LocaleKeys.signInAbortedByUser.tr());
    }
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Future<AppUser?> signInWithApple() async {
    const redirectURL =
        'https://checker-wry-diascia.glitch.me/callbacks/sign_in_with_apple';
    const clientID = 'dev.flutterlearn.flutterlearn';
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request credential for the currently signed in Apple account.
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      webAuthenticationOptions: WebAuthenticationOptions(
        clientId: clientID,
        redirectUri: Uri.parse(redirectURL),
      ),
      nonce: nonce,
    );

    // Create an `OAuthCredential` from the credential returned by Apple.
    final oauthCredential = OAuthProvider('apple.com').credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
      rawNonce: rawNonce,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    final authResult =
        await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    final firebaseUser = authResult.user;
    final String? displayName =
        firebaseUser?.displayName ?? firebaseUser?.providerData[0].displayName;
    final String? photoURL =
        firebaseUser?.photoURL ?? firebaseUser?.providerData[0].photoURL;
    await firebaseUser?.updateDisplayName(displayName);
    await firebaseUser?.updatePhotoURL(photoURL);
    return userFromFirebase(firebaseUser);
  }

  @override
  Future<AppUser?> signInWithNaver() async {
    final NaverLoginResult res = await FlutterNaverLogin.logIn();
    switch (res.status) {
      case NaverLoginStatus.loggedIn:
        final accessToken = await FlutterNaverLogin.currentAccessToken;
        final functions = FirebaseFunctions.instance;
        final HttpsCallableResult<Map<String, dynamic>> httpCallResult =
            await functions
                .httpsCallable('customTokenFromNaver')
                .call({'accessToken': accessToken.accessToken});
        final customToken = httpCallResult.data['token'].toString();
        final naverUserCredential =
            await _firebaseAuth.signInWithCustomToken(customToken);
        final naverFirebaseUser = naverUserCredential.user;
        return userFromFirebase(naverFirebaseUser);
      case NaverLoginStatus.cancelledByUser:
        break;
      case NaverLoginStatus.error:
        throw PlatformException(
            code: 'NAVER LOGIN_ERR', message: '네이버 로그인 오류 다시 시도해주세요.');
    }
  }

  @override
  Future<AppUser?> signInWithKakao() async {
    try {
      final installed = await isKakaoTalkInstalled();
      final authCode = installed
          ? await AuthCodeClient.instance.requestWithTalk()
          : await AuthCodeClient.instance.request();
      final token = await AuthApi.instance.issueAccessToken(authCode);
      final functions = FirebaseFunctions.instance;
      final HttpsCallableResult<Map<String, dynamic>> httpCallResult =
          await functions
              .httpsCallable('customTokenFromKakao')
              .call({'accessToken': token.accessToken});
      final customToken = httpCallResult.data['token'].toString();
      final userCredential =
          await _firebaseAuth.signInWithCustomToken(customToken);
      final firebaseUser = userCredential.user;
      return userFromFirebase(firebaseUser);
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> signOut() async {
    googleSignIn.signOut();
    FlutterNaverLogin.logOut();
    kakao.UserApi.instance.logout();
    return _firebaseAuth.signOut();
  }

  @override
  Future<User?> signInAnonymously() async {
    final UserCredential userCredential =
        await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  @override
  void dispose() {}
}
