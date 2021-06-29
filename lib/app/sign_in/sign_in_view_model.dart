import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/services/auth_base.dart';

class SignInViewModel with ChangeNotifier {
  SignInViewModel({required this.auth});
  final AuthBase auth;
  bool isLoading = false;
  dynamic error;

  Future<void> _signIn(Future<AppUser?> Function() signInMethod) async {
    try {
      error = null;
      isLoading = true;
      notifyListeners();
      await signInMethod();
    } catch (e) {
      error = e;
      rethrow;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Future<void> signInAnonymously() async {
  //   await _signIn(auth.signInAnonymously);
  // }

  Future<void> signInWithGoogle() async {
    await _signIn(auth.signInWithGoogle);
  }

  Future<void> signInWithApple() async {
    await _signIn(auth.signInWithApple);
  }
}
