import 'package:flutter/material.dart';
import 'package:flutter_learn/app/widgets/buttons/custom_elevated_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialSignInButton extends CustomElevatedButton {
  SocialSignInButton({
    required String svgAssetName,
    required String text,
    required TextStyle textStyle,
    Color? color = Colors.white,
    required VoidCallback? onPressed,
    Color? textColor = Colors.black87,
    double borderRadius = 6,
    Color borderColor = Colors.transparent,
    double height = 50,
  }) : super(
          textStyle: textStyle,
          color: color,
          onPressed: onPressed,
          textColor: textColor,
          borderRadius: borderRadius,
          borderColor: borderColor,
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 20,
                  child: SvgPicture.asset(svgAssetName),
                ),
              ),
              Text(text),
              const SizedBox(width: 20),
            ],
          ),
        );
}
