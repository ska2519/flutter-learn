import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_learn/models/app_user.dart';

abstract class AuthBase {
  Future<AppUser?> currentUser();
  Future<AppUser?> signInAnonymously();
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
  Future<void> signOut();
  Future<AppUser?> createUser(User user);
  Future<AppUser?> fetchUser(User user);
  Future<AppUser?> userFromFirebase(User? user);
  void dispose();
}
