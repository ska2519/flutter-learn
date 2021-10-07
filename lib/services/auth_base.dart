import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_learn/models/app_user.dart';

mixin AuthBase {
  Future<User?> get currentUser;
  Future<AppUser?> get currentAppUser;
  Future<AppUser?> userFromFirebase(User? user);
  Stream<User?> get authStateChanges;
  Stream<User?> get iDTokenChanges;
  Stream<User?> get userChanges;
  Future<User?> signInAnonymously();
  Future<AppUser?> signInWithEmailAndPassword(String email, String password);
  Future<AppUser?> createUserWithEmailAndPassword(
      String email, String password);
  Future<void> sendPasswordResetEmail(String email);
  Future<AppUser?> signInWithEmailAndLink(
      {required String email, required String link});
  bool isSignInWithEmailLink(String link);
  Future<void> sendSignInWithEmailLink({
    required String email,
    required String url,
    required bool handleCodeInApp,
    required String iOSBundleId,
    required String androidPackageName,
    required bool androidInstallApp,
    required String androidMinimumVersion,
  });
  Future<AppUser?> signInWithGoogle();
  Future<AppUser?> signInWithApple();
  Future<AppUser?> signInWithNaver();
  Future<AppUser?> signInWithKakao();
  Future<void> signOut();
  Future<AppUser?> createUser(User user);
  Future<AppUser?> fetchUser(User user);
  Future<void> deleteUser(AppUser appUser);
  void dispose();
}
