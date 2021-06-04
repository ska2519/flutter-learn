import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_learn/app/home/home_page.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = context.read(authServiceProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // onGenerateTitle: (BuildContext context) =>
      //     DemoLocalizations.of(context).title,
      title: 'Flutter Learn',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.lightBlue,
        appBarTheme: AppBarTheme(
          // textTheme:
          //     TextTheme(headline6: TextStyle(fontWeight: FontWeight.bold)),
          //titleTextStyle: TextStyle(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white),
        ),
        fontFamily: 'NotoSansKR',
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('ko', 'KR'),
      ],
      home: HomePage(),
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings, auth),
    );
  }
}
