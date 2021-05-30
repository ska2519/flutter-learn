import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/app/top_level_providers.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/avatar.dart';
import 'package:flutter_learn/app/widgets/empty_content.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/constants/keys.dart';
import 'package:flutter_learn/constants/strings.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedantic/pedantic.dart';

class AccountPage extends HookWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = context.read(authServiceProvider);
      await auth.signOut();
    } catch (e) {
      unawaited(showExceptionAlertDialog(
        context: context,
        title: Strings.logoutFailed,
        exception: e,
      ));
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final bool didRequestSignOut = await showAlertDialog(
          context: context,
          title: Strings.logout,
          content: Strings.logoutAreYouSure,
          cancelActionText: Strings.cancel,
          defaultActionText: Strings.logout,
        ) ??
        false;
    if (didRequestSignOut == true) {
      await _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authStateChanges = useProvider(authStateChangesProvider);
    return authStateChanges.when(
      data: (user) => Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: TextButton(
                key: user != null
                    ? const Key(Keys.logout)
                    : const Key(Keys.login),
                onPressed: () => user != null
                    ? _confirmSignOut(context)
                    : Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInPage(),
                        ),
                      ),
                child: Text(
                  user != null ? Strings.logout : Strings.login,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(150.0),
            child: _buildUserInfo(user),
          ),
        ),
      ),
      loading: () => const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (_, __) => const Scaffold(
        body: EmptyContent(
          title: 'Something went wrong',
          message: "Can't load data right now.",
        ),
      ),
    );
  }

  Widget _buildUserInfo(User? user) {
    return Column(
      children: [
        Avatar(
          photoUrl: user?.photoURL,
          radius: 50,
          borderColor: Colors.black54,
          borderWidth: 1.0,
        ),
        const SizedBox(height: defaultPadding),
        Text(
          user == null ? '로그인이 필요합니다' : user.displayName ?? '닉네임을 만들어주세요',
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}
