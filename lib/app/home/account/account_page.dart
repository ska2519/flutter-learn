import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedantic/pedantic.dart';

import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/avatar.dart';
import 'package:flutter_learn/app/widgets/empty_content.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/constants/strings.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';

class AccountPage extends StatefulHookWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String _displayName = '';

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
          child: Text(Strings.logoutAreYouSure),
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
    final size = MediaQuery.of(context).size;
    final appUserStream = useProvider(appUserStreamProvider);
    return appUserStream.when(
      data: (appUser) {
        print('AccountPage appUser.displayName: ${appUser?.displayName}');
        return Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: TextButton(
                  onPressed: () => appUser != null
                      ? _confirmSignOut(context)
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInPage(),
                          ),
                        ),
                  child: Text(
                    appUser != null ? Strings.logout : Strings.login,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(size.height * 0.23),
              child: _buildUserInfo(appUser, context),
            ),
          ),
        );
      },
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

  Widget _buildUserInfo(AppUser? appUser, BuildContext context) {
    return Column(
      children: [
        Avatar(
          photoUrl: appUser?.photoURL,
          radius: 50,
          borderColor: Colors.black54,
          borderWidth: 1.0,
        ),
        const SizedBox(height: defaultPadding),
        TextButton(
          onPressed: appUser == null
              ? null
              : () => showAlertDialog(
                    context: context,
                    child: TextField(
                      maxLength: 8,
                      controller: TextEditingController(
                          text: _displayName = appUser.displayName ?? ''),
                      decoration: InputDecoration(hintText: '원하는 닉네임을 적어주세요'),
                      onChanged: (displayName) => _displayName = displayName,
                    ),
                    cancelActionText: Strings.cancel,
                    defaultActionText: Strings.ok,
                  ).then(
                    (isOk) {
                      if (isOk is bool) {
                        final database = context.read(databaseProvider);
                        database.updateAppUser(
                          appUser: appUser.copyWith(displayName: _displayName),
                        );
                      }
                    },
                  ),
          child: Text(
            appUser == null
                ? '로그인이 필요합니다'
                : appUser.displayName ?? '닉네임을 만들어주세요',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}
