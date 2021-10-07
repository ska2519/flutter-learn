import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/sign_in/sign_in_button.dart';
import 'package:flutter_learn/app/sign_in/sign_view_model.dart';
import 'package:flutter_learn/app/sign_in/social_sign_in_button.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/fcm_service.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPage extends HookWidget {
  const SignInPage({Key? key}) : super(key: key);

  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true)
        .pushNamed(AppRoutes.signInPage);
  }

  @override
  Widget build(BuildContext context) {
    final signModel = useProvider(signModelProvider);
    final database = useProvider(databaseProvider);
    final auth = useProvider(authServiceProvider);

    return ProviderListener<SignViewModel>(
      provider: signModelProvider,
      onChange: (context, model) async {
        if (model.error != null) {
          await showExceptionAlertDialog(
            context: context,
            title: LocaleKeys.signInFailed.tr(),
            exception: model.error,
          );
        }
        if (model.isLoading == false) {
          auth.currentUser.then((user) async {
            final appUser = await database.getAppUser(user?.uid);
            if (appUser != null) {
              final fcmService = context.read(fcmServiceProvider);
              fcmService.saveTokenToDatabase(await fcmService.getToken);
              Navigator.pop(context);
            }
          });
        }
      },
      child: SignInPageContents(
        viewModel: signModel,
        title: LocaleKeys.signInPageTitle.tr(),
      ),
    );
  }
}

class SignInPageContents extends StatelessWidget {
  const SignInPageContents({required this.viewModel, required this.title});
  final SignViewModel viewModel;
  final String title;

  Future<void> _showEmailPasswordSignInPage(BuildContext context) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      AppRoutes.emailPasswordSignInPage,
      arguments: () => navigator.pop(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_size.height * 0.15),
        child: AppBar(
          elevation: 0.0,
          flexibleSpace: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    letterSpacing: 1.5,
                    wordSpacing: 2,
                  ),
            ),
          ),
        ),
      ),
      body: _buildSignIn(context),
    );
  }

  Widget _buildHeader() {
    if (viewModel.isLoading) {
      return const Center(child: CupertinoActivityIndicator());
    }
    return SvgPicture.asset('assets/images/Group Chat-rafiki.svg');
  }

  Widget _buildSignIn(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Center(
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          width: min(constraints.maxWidth, 600),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: _size.height * 0.3,
                child: _buildHeader(),
              ),
              const SizedBox(height: 33),
              SignInButton(
                imageAsset: 'assets/icons/btnG_아이콘사각.png',
                text: LocaleKeys.signInWithEmail.tr(),
                onPressed: viewModel.isLoading
                    ? null
                    : () => _showEmailPasswordSignInPage(context),
              ),
              const SizedBox(height: defaultPadding),
              if (!kIsWeb)
                SocialSignInButton(
                  svgAssetName: 'assets/icons/btn_apple_white.svg',
                  text: LocaleKeys.signInWithApple.tr(),
                  textStyle: TextStyle(fontWeight: FontWeight.w500),
                  onPressed:
                      viewModel.isLoading ? null : viewModel.signInWithApple,
                ),
              if (!kIsWeb) const SizedBox(height: defaultPadding),
              SocialSignInButton(
                svgAssetName: 'assets/icons/google_logo.svg',
                text: LocaleKeys.signInWithGoogle.tr(),
                textStyle: TextStyle(fontWeight: FontWeight.w500),
                onPressed:
                    viewModel.isLoading ? null : viewModel.signInWithGoogle,
              ),
              const SizedBox(height: defaultPadding),
              SignInButton(
                imageAsset: 'assets/icons/btnG_아이콘사각.png',
                text: '네이버 로그인',
                color: naverGreenColor,
                textColor: Colors.white,
                onPressed:
                    viewModel.isLoading ? null : viewModel.signInWithNaver,
              ),
              const SizedBox(height: defaultPadding),
              SignInButton(
                imageAsset: 'assets/icons/kakao_symbol.png',
                color: kakaoYellowColor,
                text: '카카오 로그인',
                onPressed:
                    viewModel.isLoading ? null : viewModel.signInWithKakao,
              ),
            ],
          ),
        );
      }),
    );
  }
}
