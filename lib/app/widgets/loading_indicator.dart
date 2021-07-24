import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';

void loadingIndicator(BuildContext context, GlobalKey dialogKey) {
  return unawaited(showDialog(
    context: context,
    barrierColor: Colors.black26,
    builder: (context) => WillPopScope(
      key: dialogKey,
      onWillPop: () async => false,
      child: const Center(child: CupertinoActivityIndicator()),
    ),
  ));
}
