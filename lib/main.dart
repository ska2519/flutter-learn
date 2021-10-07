import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/app/home/home_page.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/auth_base.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/translations/codegen_loader.g.dart';
import 'package:flutter_learn/utils/format.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kakao_flutter_sdk/common.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print(
      'fcm_Handling a background message ${message.notification} / ${message.data}');
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoContext.clientId = '0116cd9761718d85103dd847d64eb906';
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await EasyLocalization.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

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
  const MyApp({Key? key}) : super(key: key);

  static final analytics = FirebaseAnalytics();
  static final observer = FirebaseAnalyticsObserver(analytics: analytics);

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
        iconTheme: IconThemeData(
          color: flutterPrimaryColor,
          size: 20,
        ),
        primaryIconTheme: IconThemeData(color: flutterPrimaryColor, size: 20),
        fontFamily: 'SFProDisplay',
        appBarTheme: AppBarTheme(
          centerTitle: false,
          elevation: 0.0,
          color: Colors.white,
          titleSpacing: 0,
          actionsIconTheme: IconThemeData(color: flutterPrimaryColor, size: 20),
          iconTheme: IconThemeData(color: flutterPrimaryColor, size: 20),
          textTheme: TextTheme(
              headline6: TextStyle(color: flutterPrimaryColor, fontSize: 18)),
        ),
        tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: flutterPrimaryColor,
        ),
        chipTheme: ChipThemeData(
          brightness: Brightness.light,
          padding: const EdgeInsets.all(4),
          backgroundColor: Colors.white,
          selectedColor: Colors.white,
          secondarySelectedColor: Colors.white,
          disabledColor: Colors.white,
          labelStyle: TextStyle(),
          secondaryLabelStyle: TextStyle(),
        ),
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: flutterAccentColor),
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
