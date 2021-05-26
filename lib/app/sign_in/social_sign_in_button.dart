import 'package:flutter/material.dart';
import 'package:flutter_learn/app/widgets/buttons/custom_elevated_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialSignInButton extends CustomElevatedButton {
  SocialSignInButton({
    required String svgAssetName,
    required String text,
    required TextStyle textStyle,
    required Color color,
    required VoidCallback? onPressed,
    Color? textColor,
    double borderRadius = 6,
    Color borderColor = Colors.transparent,
    double height = 50,
  }) : super(
          borderRadius: borderRadius,
          borderColor: borderColor,
          height: height,
          textColor: textColor,
          color: color,
          onPressed: onPressed,
          textStyle: textStyle,
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
              SizedBox(width: 20),
            ],
          ),
        );
}
