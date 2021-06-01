import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/top_level_providers.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_learn/app/sign_in/sign_in_button.dart';
import 'package:flutter_learn/app/sign_in/sign_in_view_model.dart';
import 'package:flutter_learn/app/sign_in/social_sign_in_button.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/constants/keys.dart';
import 'package:flutter_learn/constants/strings.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final signInModelProvider = ChangeNotifierProvider<SignInViewModel>(
    (ref) => SignInViewModel(auth: ref.watch(authServiceProvider)));

class SignInPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final signInModel = useProvider(signInModelProvider);
    final authStateChanges = useProvider(authStateChangesProvider);
    authStateChanges.whenData((user) {
      if (user != null) {
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
        title: '로그인 페이지',
      ),
    );
  }
}

class SignInPageContents extends StatelessWidget {
  const SignInPageContents(
      {Key? key, required this.viewModel, this.title = 'Sign-in Demo'})
      : super(key: key);
  final SignInViewModel viewModel;
  final String title;

  static const Key emailPasswordButtonKey = Key(Keys.emailPassword);
  static const Key anonymousButtonKey = Key(Keys.anonymous);

  Future<void> _showEmailPasswordSignInPage(BuildContext context) async {
    final navigator = Navigator.of(context);
    await navigator.pushNamed(
      AppRoutes.emailPasswordSignInPage,
      arguments: () => navigator.pop(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(title),
      ),
      body: _buildSignIn(context),
    );
  }

  Widget _buildHeader() {
    if (viewModel.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return const Text(
      Strings.signIn,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: primaryColor,
        fontSize: 33,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildSignIn(BuildContext context) {
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
                height: 50,
                child: _buildHeader(),
              ),
              const SizedBox(height: 33),
              SignInButton(
                key: emailPasswordButtonKey,
                text: Strings.signInWithEmailPassword,
                onPressed: viewModel.isLoading
                    ? null
                    : () => _showEmailPasswordSignInPage(context),
                color: Colors.white,
              ),
              const SizedBox(height: defaultPadding),

              // SignInButton(
              //   key: anonymousButtonKey,
              //   text: Strings.goAnonymous,
              //   color: Theme.of(context).primaryColor,
              //   textColor: Colors.white,
              //   onPressed:
              //       viewModel.isLoading ? null : viewModel.signInAnonymously,
              // ),
              SocialSignInButton(
                svgAssetName: 'assets/icons/google_logo.svg',
                textStyle: TextStyle(fontWeight: FontWeight.w500),
                textColor: Colors.black87,
                text: 'Sign in with Google',
                color: Colors.white,
                onPressed:
                    viewModel.isLoading ? null : viewModel.signInWithGoogle,
              ),
              const SizedBox(height: defaultPadding),
              // if (!kIsWeb && Platform.isIOS)
              SocialSignInButton(
                svgAssetName: 'assets/icons/btn_apple_white.svg',
                textStyle: TextStyle(fontWeight: FontWeight.w500),
                text: 'Sign in with Apple',
                textColor: Colors.black87,
                color: Colors.white,
                onPressed:
                    viewModel.isLoading ? null : viewModel.signInWithApple,
              )
            ],
          ),
        );
      }),
    );
  }
}
