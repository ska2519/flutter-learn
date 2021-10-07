import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:flutter_learn/services/auth_base.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final signModelProvider = ChangeNotifierProvider<SignViewModel>(
    (ref) => SignViewModel(auth: ref.watch(authServiceProvider)));

class SignViewModel with ChangeNotifier {
  SignViewModel({required this.auth});
  final AuthBase auth;
  bool isLoading = false;
  dynamic error;

  Future<void> _sign(Future Function() signMethod) async {
    try {
      error = null;
      isLoading = true;
      notifyListeners();
      await signMethod();
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
    await _sign(auth.signInWithGoogle);
  }

  Future<void> signInWithApple() async {
    await _sign(auth.signInWithApple);
  }

  Future<void> signInWithNaver() async {
    await _sign(auth.signInWithNaver);
  }

  Future<void> signInWithKakao() async {
    await _sign(auth.signInWithKakao);
  }

  Future<void> signOut() async {
    await _sign(auth.signOut);
  }
}
