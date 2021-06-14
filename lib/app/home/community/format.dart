import 'package:duration/duration.dart';
import 'package:duration/locale.dart';

class Format {
  static String duration(DateTime timestamp) {
    final now = DateTime.now();
    final duration = Duration(seconds: now.difference(timestamp).inSeconds);
    return '${printDuration(
      duration,
      locale: DurationLocale.fromLanguageCode('ko')!,
      tersity: duration > Duration(days: 1)
          ? DurationTersity.day
          : duration > Duration(hours: 1)
              ? DurationTersity.hour
              : duration > Duration(minutes: 1)
                  ? DurationTersity.minute
                  : DurationTersity.second,
    )} 전';
  }
}
