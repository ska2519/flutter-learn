import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_learn/app/home/home_page.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/translations/codegen_loader.g.dart';

import 'app/home/community/format.dart';
import 'constants/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(
    child: EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ko')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  static late FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    final auth = context.read(authServiceProvider);
    Format.getLocale(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '플러터 런 - Flutter Learn',
      theme:
          // FlexColorScheme.light(scheme: FlexScheme.mandyRed).toTheme,
          // The Mandy red, dark theme.
          // darkTheme: FlexColorScheme.dark(scheme: FlexScheme.mandyRed).toTheme,
          // Use dark or light theme based on system setting.
          // themeMode: ThemeMode.system,
          ThemeData(
        brightness: Brightness.light,
        primaryColor: flutterPrimaryColor,
        accentColor: flutterAccentColor,
        appBarTheme: AppBarTheme(
          // textTheme:
          //     TextTheme(headline6: TextStyle(fontWeight: FontWeight.bold)),
          // titleTextStyle: TextStyle(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: TextTheme(),
        fontFamily: 'NotoSansKR',
      ),
      navigatorObservers: <NavigatorObserver>[observer],
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomePage(analytics: analytics, observer: observer),
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings, auth),
    );
  }
}
