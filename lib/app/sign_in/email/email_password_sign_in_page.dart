import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_learn/app/sign_in/email/email_password_sign_in_model.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/buttons/form_submit_button.dart';
import 'package:flutter_learn/services/auth_base.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';

class EmailPasswordSignInPage extends StatefulWidget {
  const EmailPasswordSignInPage(
      {Key? key, required this.model, this.onSignedIn})
      : super(key: key);

  factory EmailPasswordSignInPage.withAuthBase(
    AuthBase auth, {
    VoidCallback? onSignedIn,
  }) {
    return EmailPasswordSignInPage(
      model: EmailPasswordSignInModel(auth: auth),
      onSignedIn: onSignedIn,
    );
  }

  final EmailPasswordSignInModel model;
  final VoidCallback? onSignedIn;

  @override
  _EmailPasswordSignInPageState createState() =>
      _EmailPasswordSignInPageState();
}

class _EmailPasswordSignInPageState extends State<EmailPasswordSignInPage> {
  final _node = FocusScopeNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  EmailPasswordSignInModel get model => widget.model;

  @override
  void initState() {
    super.initState();
    // Temporary workaround to update state until a replacement for ChangeNotifierProvider is found
    model.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    model.dispose();
    _node.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showSignInError(EmailPasswordSignInModel model, dynamic exception) {
    showExceptionAlertDialog(
      context: context,
      title: model.errorAlertTitle,
      exception: exception,
    );
  }

  Future<void> _submit() async {
    try {
      final bool success = await model.submit();
      if (success) {
        if (model.formType == EmailPasswordSignInFormType.forgotPassword) {
          await showAlertDialog(
            context: context,
            title: LocaleKeys.resetLinkSentTitle.tr(),
            child: Text(LocaleKeys.resetLinkSentMessage.tr()),
            defaultActionText: LocaleKeys.ok.tr(),
          );
        } else {
          if (widget.onSignedIn != null) {
            widget.onSignedIn?.call();
            Navigator.pop(context);
          }
        }
      }
    } catch (e) {
      _showSignInError(model, e);
    }
  }

  void _emailEditingComplete() {
    if (model.canSubmitEmail) {
      _node.nextFocus();
    }
  }

  void _passwordEditingComplete() {
    if (!model.canSubmitEmail) {
      _node.previousFocus();
      return;
    }
    _submit();
  }

  void _updateFormType(EmailPasswordSignInFormType formType) {
    model.updateFormType(formType);
    _emailController.clear();
    _passwordController.clear();
  }

  Widget _buildEmailField() {
    return TextFormField(
      key: const Key('email'),
      controller: _emailController,
      decoration: InputDecoration(
        labelText: LocaleKeys.email.tr(),
        hintText: LocaleKeys.emailHint.tr(),
        errorText: model.emailErrorText,
        enabled: !model.isLoading,
      ),
      autocorrect: false,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      keyboardAppearance: Brightness.light,
      onEditingComplete: _emailEditingComplete,
      inputFormatters: <TextInputFormatter>[
        model.emailInputFormatter,
      ],
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      key: const Key('password'),
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: model.passwordLabelText,
        errorText: model.passwordErrorText,
        enabled: !model.isLoading,
      ),
      obscureText: true,
      autocorrect: false,
      textInputAction: TextInputAction.done,
      keyboardAppearance: Brightness.light,
      onEditingComplete: _passwordEditingComplete,
    );
  }

  Widget _buildContent() {
    return FocusScope(
      node: _node,
      child: Form(
        onChanged: () => model.updateWith(
            email: _emailController.text, password: _passwordController.text),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 8.0),
            _buildEmailField(),
            if (model.formType !=
                EmailPasswordSignInFormType.forgotPassword) ...<Widget>[
              const SizedBox(height: 8.0),
              _buildPasswordField(),
            ],
            const SizedBox(height: 8.0),
            FormSubmitButton(
              key: const Key('primary-button'),
              text: model.primaryButtonText,
              loading: model.isLoading,
              onPressed: model.isLoading ? null : _submit,
            ),
            const SizedBox(height: 8.0),
            TextButton(
              key: const Key('secondary-button'),
              onPressed: model.isLoading
                  ? null
                  : () => _updateFormType(model.secondaryActionFormType),
              child: Text(model.secondaryButtonText),
            ),
            if (model.formType == EmailPasswordSignInFormType.signIn)
              TextButton(
                key: const Key('tertiary-button'),
                onPressed: model.isLoading
                    ? null
                    : () => _updateFormType(
                        EmailPasswordSignInFormType.forgotPassword),
                child: Text(LocaleKeys.forgotPasswordQuestion.tr()),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        title: Text(model.title),
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Center(
          child: LayoutBuilder(builder: (context, constraints) {
            return Container(
              width: min(constraints.maxWidth, 600),
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _buildContent(),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
