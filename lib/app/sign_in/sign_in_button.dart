import 'package:flutter/material.dart';
import 'package:flutter_learn/app/widgets/buttons/custom_elevated_button.dart';

class SignInButton extends CustomElevatedButton {
  SignInButton({
    required String text,
    required TextStyle textStyle,
    Color? color = Colors.white,
    required VoidCallback? onPressed,
    Color textColor = Colors.black87,
    double borderRadius = 6,
    Color borderColor = Colors.transparent,
    double height = 50.0,
  }) : super(
          textStyle: textStyle,
          color: color,
          onPressed: onPressed,
          textColor: textColor,
          borderRadius: borderRadius,
          borderColor: borderColor,
          height: height,
          child: Text(text),
        );
}
