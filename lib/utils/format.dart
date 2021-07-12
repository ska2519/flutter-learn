import 'package:duration/duration.dart';
import 'package:duration/locale.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';

late String locale;
void getLocale(BuildContext context) => locale = context.locale.toString();

String duration(DateTime timestamp) {
  final now = DateTime.now();
  final duration = Duration(seconds: now.difference(timestamp).inSeconds);
  return '${printDuration(
    duration,
    locale: DurationLocale.fromLanguageCode(locale)!,
    tersity: duration > Duration(days: 1)
        ? DurationTersity.day
        : duration > Duration(hours: 1)
            ? DurationTersity.hour
            : duration > Duration(minutes: 1)
                ? DurationTersity.minute
                : DurationTersity.second,
  )} ${LocaleKeys.ago.tr()}';
}

String numberWithComma(int param) {
  return NumberFormat('###,###,###,###').format(param).replaceAll(' ', '');
}

String stringWithComma(String param) {
  return NumberFormat('###,###,###,###')
      .format(int.parse(param))
      .replaceAll(' ', '');
}