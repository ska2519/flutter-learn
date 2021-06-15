import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.child,
    this.color,
    this.textColor,
    this.height = 50.0,
    this.borderRadius = 6,
    this.loading = false,
    this.onPressed,
    this.borderColor = Colors.transparent,
    this.textStyle,
  }) : super(key: key);
  final Widget child;
  final Color? color;
  final Color? textColor;
  final double height;
  final double borderRadius;
  final bool loading;
  final VoidCallback? onPressed;
  final Color borderColor;
  final TextStyle? textStyle;

  Widget buildSpinner(BuildContext context) {
    final ThemeData data = Theme.of(context);
    return Theme(
      data: data.copyWith(accentColor: Colors.white70),
      child: const SizedBox(
        width: 28,
        height: 28,
        child: CupertinoActivityIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: textColor,
          textStyle: textStyle,
          primary: color,
          minimumSize: const Size(88, 36),
          padding: const EdgeInsets.symmetric(horizontal: 9),
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
        ),
        onPressed: onPressed,
        child: loading ? buildSpinner(context) : child,
      ),
    );
  }
}
