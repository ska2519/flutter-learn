import 'package:intl/intl.dart';

class DemoLocalizations {
  DemoLocalizations(this.localeName);

  // static Future<DemoLocalizations> load(Locale locale) {
  //   final String name =
  //       locale.countryCode == null || locale.countryCode!.isEmpty
  //           ? locale.languageCode
  //           : locale.toString();
  //   final String localeName = Intl.canonicalizedLocale(name);

  //   return initializeMessages(localeName).then((_) {
  //     return DemoLocalizations(localeName);
  //   });
  // }

  // static DemoLocalizations of(BuildContext context) {
  //   return Localizations.of<DemoLocalizations>(context, DemoLocalizations)!;
  // }

  final String localeName;

  String get title {
    return Intl.message(
      'Hello World',
      name: 'title',
      desc: 'Title for the Demo application',
      locale: localeName,
    );
  }
}
