import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/app/top_level_providers.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/avatar.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/constants/keys.dart';
import 'package:flutter_learn/constants/strings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';

class AccountPage extends StatelessWidget {
  Future<void> _signOut(BuildContext context, FirebaseAuth firebaseAuth) async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      unawaited(showExceptionAlertDialog(
        context: context,
        title: Strings.logoutFailed,
        exception: e,
      ));
    }
  }

  Future<void> _confirmSignOut(
      BuildContext context, FirebaseAuth firebaseAuth) async {
    final bool didRequestSignOut = await showAlertDialog(
          context: context,
          title: Strings.logout,
          content: Strings.logoutAreYouSure,
          cancelActionText: Strings.cancel,
          defaultActionText: Strings.logout,
        ) ??
        false;
    if (didRequestSignOut == true) {
      await _signOut(context, firebaseAuth);
    }
  }

  @override
  Widget build(BuildContext context) {
    final firebaseAuth = context.read(firebaseAuthProvider);
    final user = firebaseAuth.currentUser;
    print('user: $user');
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            key: user != null ? const Key(Keys.logout) : const Key(Keys.login),
            onPressed: () => user != null
                ? _confirmSignOut(context, firebaseAuth)
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInPage(),
                    )),
            child: Text(
              user != null ? Strings.logout : Strings.login,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(150.0),
          child: _buildUserInfo(user),
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
          user?.displayName ?? 'Need to Login',
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}
