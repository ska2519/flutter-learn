import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/app/home/home_page.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
      title: 'Flutter Learn',
      theme: ThemeData.light().copyWith(
        primaryIconTheme: IconThemeData(color: Colors.black),
        //scaffoldBackgroundColor: bgTestColor,
        textTheme: GoogleFonts.notoSansTextTheme(),
        //iconTheme: IconThemeData(color: Colors.black)
        //canvasColor: secondaryColor,
      ),
      home: HomePage(),
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings, auth),
    );
  }
}
