import 'package:flutter/material.dart';
import 'package:flutter_learn/app/widgets/buttons/custom_elevated_button.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInButton extends CustomElevatedButton {
  SignInButton({
    String? svgAsset,
    String? imageAsset,
    required String text,
    TextStyle textStyle = const TextStyle(fontWeight: FontWeight.w500),
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: defaultPadding * 2,
                  child: svgAsset != null
                      ? SvgPicture.asset(svgAsset)
                      : Image.asset(imageAsset!),
                ),
                Text(text),
                SizedBox(width: defaultPadding * 2)
              ],
            ),
          ),
        );
}
