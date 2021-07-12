import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_learn/app/home/home_page.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/auth_base.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/translations/codegen_loader.g.dart';

import 'constants/constants.dart';
import 'utils/format.dart';

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
    final AuthBase auth = context.read(authServiceProvider);
    getLocale(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '플러터 런 - Flutter Learn',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: flutterPrimaryColor,
        accentColor: flutterAccentColor,
        iconTheme: IconThemeData(color: flutterPrimaryColor, size: 20),
        primaryIconTheme: IconThemeData(color: flutterPrimaryColor, size: 20),
        textTheme: GoogleFonts.latoTextTheme(),
        fontFamily: 'roboto',
        appBarTheme: AppBarTheme(
          elevation: 1.0,
          centerTitle: false,
          backgroundColor: Colors.white,
          titleSpacing: 0,
          actionsIconTheme: IconThemeData(color: flutterPrimaryColor, size: 20),
          iconTheme: IconThemeData(color: flutterPrimaryColor, size: 20),
          textTheme: TextTheme(
            headline6: TextStyle(color: flutterPrimaryColor, fontSize: 18),
          ),
        ),
        tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: flutterPrimaryColor,
        ),
        chipTheme: ChipThemeData(
          brightness: Brightness.light,
          padding: const EdgeInsets.all(4),
          backgroundColor: Colors.transparent,
          selectedColor: Colors.transparent,
          secondarySelectedColor: Colors.transparent,
          disabledColor: Colors.transparent,
          labelStyle: TextStyle(),
          secondaryLabelStyle: TextStyle(),
        ),
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
