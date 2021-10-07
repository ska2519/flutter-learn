import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/home/account/chat_list_page.dart';
import 'package:flutter_learn/app/home/account/my_posts_page.dart';
import 'package:flutter_learn/app/home/account/settings_page.dart';
import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/avatar.dart';
import 'package:flutter_learn/app/widgets/loading_indicator.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firebase_storage.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'liked_posts_page.dart';
import 'menu_list_item.dart';

class AccountPage extends StatefulHookWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String _displayName = '';
  File? profileImageFile;

  Future<bool?> _updateDisplayNameDialog(
      BuildContext context, AppUser appUser) {
    return showAlertDialog(
      context: context,
      title: LocaleKeys.my_profile.tr(),
      child: TextField(
        maxLength: 8,
        controller:
            TextEditingController(text: _displayName = appUser.displayName),
        decoration: InputDecoration(hintText: LocaleKeys.writeNameYouWant.tr()),
        onChanged: (String displayName) => _displayName = displayName,
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
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: ElevatedButton(
              onPressed: () => appUser != null
                  ? SettingsPage.show(context)
                  : SignInPage.show(context),
              child: appUser != null
                  ? Icon(Icons.settings_outlined)
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
    final database = context.read(databaseProvider);
    final appUser = useProvider(appUserStreamProvider).data?.value;
    return Column(
      children: [
        GestureDetector(
          onTap: () => appUser == null
              ? SignInPage.show(context)
              : _updateProfileImageDialog(appUser),
          child: Avatar(
            photoUrl: appUser?.photoURL,
            displayName: appUser?.displayName,
            radius: 50,
            borderColor: Colors.black54,
            borderWidth: 1.0,
          ),
        ),
        const SizedBox(height: defaultPadding),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => appUser == null
                  ? SignInPage.show(context)
                  : _updateDisplayNameDialog(context, appUser).then(
                      (value) {
                        if (value == true) {
                          database.updateAppUser(
                            appUser.copyWith(displayName: _displayName),
                          );
                        }
                      },
                    ),
              child: Text(
                appUser == null
                    ? LocaleKeys.requiredSignIn.tr()
                    : appUser.displayName,
              ),
            ),
            IconButton(
                onPressed: () => ChatListPage.show(context),
                icon: Icon(Icons.chat_bubble_outline_outlined, size: 20))
          ],
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }

  Future? _updateProfileImageDialog(AppUser appUser) async {
    return showAlertDialog(
      context: context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
              onPressed: () => updateProfileImage(appUser),
              child: Text(LocaleKeys.changeProfileImage.tr())),
          ElevatedButton(
              onPressed: () => setDefaultProfileImage(appUser),
              child: Text(LocaleKeys.defaultProfileImage.tr())),
        ],
      ),
      cancelActionText: LocaleKeys.cancel.tr(),
    );
  }

  Future<void> setDefaultProfileImage(AppUser appUser) async {
    final database = context.read(databaseProvider);
    await database.updateAppUser(appUser.copyWith(photoURL: null));
    Navigator.pop(context);
  }

  Future<void> updateProfileImage(AppUser appUser) async {
    final ImagePicker _picker = ImagePicker();
    try {
      final pickedFile = await _picker.getImage(
        source: ImageSource.gallery,
        maxWidth: 1024,
        maxHeight: 1024,
      );
      if (pickedFile != null) {
        final dialogKey = GlobalKey<State>();
        loadingIndicator(context, dialogKey);
        final storage = context.read(storageProvider);
        final database = context.read(databaseProvider);
        await storage.uploadProfileImage(
            userId: appUser.id, filePath: pickedFile.path);
        final newPhotoURL =
            await storage.profileDownloadURL(userId: appUser.id);
        await database.updateAppUser(appUser.copyWith(photoURL: newPhotoURL));
        Navigator.of(dialogKey.currentContext!, rootNavigator: true).pop();
        Navigator.pop(context);
      }
    } catch (error) {
      print('error: $error');
    }
  }
}
