import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_learn/app/home/account/my_posts_page.dart';
import 'package:flutter_learn/app/home/account/settings_page.dart';
import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/avatar.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';

import 'liked_posts_page.dart';
import 'menu_list_item.dart';

class AccountPage extends StatefulHookWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String _displayName = '';

  Future<bool?> displayNameUpdateDialog(BuildContext context, AppUser appUser) {
    return showAlertDialog(
      context: context,
      title: LocaleKeys.my_profile.tr(),
      child: TextField(
        maxLength: 8,
        controller: TextEditingController(
            text: _displayName = appUser.displayName ?? ''),
        decoration: InputDecoration(hintText: LocaleKeys.writeNameYouWant.tr()),
        onChanged: (displayName) => _displayName = displayName,
      ),
      cancelActionText: LocaleKeys.cancel.tr(),
      defaultActionText: LocaleKeys.ok.tr(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final appUser = useProvider(appUserStreamProvider).data?.value;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: ElevatedButton(
              onPressed: () => appUser != null
                  ? SettingsPage.show(context)
                  : SignInPage.show(context),
              child: appUser != null
                  ? Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                    )
                  : Text(
                      LocaleKeys.signIn.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(color: Colors.white),
                    ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(_size.height * 0.27),
          child: _buildUserInfo(appUser, context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              MenuListItem(
                onTap: () => SettingsPage.show(context),
                title: LocaleKeys.settingApp.tr(),
                icon: Icons.settings_outlined,
              ),
              MenuListItem(
                onTap: () => MyPostsPage.show(context, initialIndex: 0),
                title: LocaleKeys.myPosts.tr(),
                icon: Icons.note_alt_outlined,
              ),
              MenuListItem(
                onTap: () => MyPostsPage.show(context, initialIndex: 1),
                title: LocaleKeys.myComments.tr(),
                icon: Icons.reply_all,
              ),
              MenuListItem(
                onTap: () => LikedPostsPage.show(context, initialIndex: 0),
                title: LocaleKeys.myLikedPosts.tr(),
                icon: Icons.favorite_outline,
              ),
              MenuListItem(
                onTap: () => LikedPostsPage.show(context, initialIndex: 1),
                title: LocaleKeys.myReadPosts.tr(),
                icon: Icons.remove_red_eye_outlined,
              ),
              // TextButton(
              //   onPressed: () {
              //   },
              //   child: Text('테스트 버튼'),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfo(AppUser? appUser, BuildContext context) {
    return Column(
      children: [
        Avatar(
          photoUrl: appUser?.photoURL,
          displayName: appUser?.displayName,
          radius: 50,
          borderColor: Colors.black54,
          borderWidth: 1.0,
        ),
        const SizedBox(height: defaultPadding),
        TextButton(
          onPressed: () => appUser == null
              ? SignInPage.show(context)
              : displayNameUpdateDialog(context, appUser).then(
                  (value) {
                    if (value == true) {
                      final database = context.read(databaseProvider);
                      database.updateAppUser(
                        appUser.copyWith(displayName: _displayName),
                      );
                    }
                  },
                ),
          child: Text(
            appUser == null
                ? LocaleKeys.requiredSignIn.tr()
                : appUser.displayName ?? LocaleKeys.makeAUsername.tr(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}
