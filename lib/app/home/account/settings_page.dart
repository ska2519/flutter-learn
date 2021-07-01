import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/app/sign_in/sign_view_model.dart';
import 'package:flutter_learn/app/widgets/loading_indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedantic/pedantic.dart';

import 'package:flutter_learn/app/widgets/alert_dialogs/show_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';

import 'menu_list_item.dart';
import 'package_info_page.dart';

class SettingsPage extends HookWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true)
        .pushNamed(AppRoutes.settingsPage);
  }

  Future<void> _signOut(BuildContext context, SignViewModel signModel) async {
    try {
      signModel.signOut();
    } catch (e) {
      unawaited(showExceptionAlertDialog(
        context: context,
        title: LocaleKeys.signOutFailed.tr(),
        exception: e,
      ));
    }
  }

  Future<void> _confirmSignOut(
      BuildContext context, SignViewModel signModel) async {
    final bool didRequestSignOut = await showAlertDialog(
          context: context,
          title: LocaleKeys.signOut.tr(),
          child: Text(LocaleKeys.signOutAreYouSure.tr()),
          cancelActionText: LocaleKeys.cancel.tr(),
          defaultActionText: LocaleKeys.signOut.tr(),
        ) ??
        false;
    if (didRequestSignOut == true) {
      await _signOut(context, signModel);
    }
  }

  Future<void> _deleteAccount(BuildContext context, AppUser appUser) async {
    final auth = context.read(authServiceProvider);
    final dialogKey = GlobalKey<State>();
    loadingIndicator(context, dialogKey);
    await auth.deleteUser(appUser);
    await auth.signOut();
    Navigator.of(dialogKey.currentContext!, rootNavigator: true).pop();
  }

  Future<void> _confirmDeleteAccount(
      BuildContext context, AppUser appUser) async {
    final bool didRequestSignOut = await showAlertDialog(
          context: context,
          title: LocaleKeys.deleteAccount.tr(),
          child: Text(LocaleKeys.deleteAccountAreYouSure.tr()),
          cancelActionText: LocaleKeys.cancel.tr(),
          defaultActionText: LocaleKeys.deleteAccount.tr(),
        ) ??
        false;
    if (didRequestSignOut == true) {
      await _deleteAccount(context, appUser);
    }
  }

  @override
  Widget build(BuildContext context) {
    final appUser = useProvider(appUserStreamProvider).data?.value;
    final signModel = useProvider(signModelProvider);
    useEffect(() {
      if (appUser == null) {
        WidgetsBinding.instance!
            .addPostFrameCallback((_) => Navigator.pop(context));
      }
    });
    return ProviderListener<SignViewModel>(
      provider: signModelProvider,
      onChange: (context, model) async {
        if (model.error != null) {
          await showExceptionAlertDialog(
            context: context,
            title: LocaleKeys.signOutFailed.tr(),
            exception: model.error,
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            '설정',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: signModel.isLoading
            ? Center(child: const CupertinoActivityIndicator())
            : ListView(
                children: [
                  MenuListItem(
                    onTap: () => _confirmSignOut(context, signModel),
                    title: LocaleKeys.signOut.tr(),
                    icon: Icons.logout_outlined,
                  ),
                  MenuListItem(
                    onTap: () => _confirmDeleteAccount(context, appUser!),
                    title: LocaleKeys.deleteAccount.tr(),
                    icon: Icons.delete_forever_outlined,
                  ),
                  MenuListItem(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PackageInfoPage(),
                        )),
                    title: LocaleKeys.appInfo.tr(),
                    icon: Icons.settings_outlined,
                  ),
                ],
              ),
      ),
    );
  }
}
