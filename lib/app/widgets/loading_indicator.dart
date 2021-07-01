import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pedantic/pedantic.dart';

/// 룸 리스트에서 입찰하기 or 결제하기 클릭 시 동작하는 다이얼로그
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
