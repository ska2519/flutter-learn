import 'package:flutter/material.dart';
import 'package:flutter_learn/app/widgets/buttons/custom_elevated_button.dart';

class FormSubmitButton extends CustomElevatedButton {
  FormSubmitButton({
    Key? key,
    required String text,
    bool loading = false,
    Color? color,
    VoidCallback? onPressed,
  }) : super(
          key: key,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          height: 44.0,
          color: color,
          textColor: Colors.black87,
          loading: loading,
          onPressed: onPressed,
        );
}
