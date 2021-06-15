import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_learn/app/sign_in/sign_in_button.dart';
import 'package:flutter_learn/app/sign_in/sign_in_view_model.dart';
import 'package:flutter_learn/app/sign_in/social_sign_in_button.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/constants/strings.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';

final signInModelProvider = ChangeNotifierProvider<SignInViewModel>(
    (ref) => SignInViewModel(auth: ref.watch(authServiceProvider)));

class SignInPage extends HookWidget {
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true)
        .pushNamed(AppRoutes.signInPage);
  }

  @override
  Widget build(BuildContext context) {
    final signInModel = useProvider(signInModelProvider);
    final appUserAsyncValue = useProvider(appUserStreamProvider);
    appUserAsyncValue.whenData((appUser) {
      if (appUser != null) {
        print('SignInPage appUser: $appUser');
        WidgetsBinding.instance!
            .addPostFrameCallback((_) => Navigator.pop(context));
      }
    });
    return ProviderListener<SignInViewModel>(
      provider: signInModelProvider,
      onChange: (context, model) async {
        if (model.error != null) {
          await showExceptionAlertDialog(
            context: context,
            title: Strings.signInFailed,
            exception: model.error,
          );
        }
      },
      child: SignInPageContents(
        viewModel: signInModel,
        title: Strings.signInPageTitle,
      ),
    );
  }
}

class SignInPageContents extends StatelessWidget {
  const SignInPageContents({required this.viewModel, required this.title});
  final SignInViewModel viewModel;
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.2),
        child: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: flutterPrimaryColor),
          elevation: 0.0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(33),
            child: Align(
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
      ),
      body: _buildSignIn(context),
    );
  }

  Widget _buildHeader() {
    if (viewModel.isLoading) {
      return const Center(
        child: CupertinoActivityIndicator(),
      );
    }
    return SvgPicture.asset(
      'assets/images/Group Chat-rafiki.svg',
      fit: BoxFit.fitHeight,
    );
  }

  Widget _buildSignIn(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          width: min(constraints.maxWidth, 600),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 33),
              SizedBox(
                height: size.height * 0.3,
                child: _buildHeader(),
              ),
              const SizedBox(height: 33),
              SignInButton(
                text: Strings.signInWithEmailPassword,
                textStyle: TextStyle(fontWeight: FontWeight.w500),
                color: Colors.white,
                onPressed: viewModel.isLoading
                    ? null
                    : () => _showEmailPasswordSignInPage(context),
              ),
              const SizedBox(height: defaultPadding),
              if (!kIsWeb)
                SocialSignInButton(
                  svgAssetName: 'assets/icons/btn_apple_white.svg',
                  text: 'Sign in with Apple',
                  textStyle: TextStyle(fontWeight: FontWeight.w500),
                  color: Colors.white,
                  onPressed:
                      viewModel.isLoading ? null : viewModel.signInWithApple,
                ),
              if (!kIsWeb) const SizedBox(height: defaultPadding),
              SocialSignInButton(
                svgAssetName: 'assets/icons/google_logo.svg',
                text: 'Sign in with Google',
                textStyle: TextStyle(fontWeight: FontWeight.w500),
                color: Colors.white,
                onPressed:
                    viewModel.isLoading ? null : viewModel.signInWithGoogle,
              ),
              const SizedBox(height: defaultPadding),
            ],
          ),
        );
      }),
    );
  }
}
