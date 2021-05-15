import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/app/home/home_page.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Learn',
      theme: ThemeData.light().copyWith(
        //scaffoldBackgroundColor: bgTestColor,
        textTheme: GoogleFonts.notoSansTextTheme(),
        //canvasColor: secondaryColor,
      ),
      home: HomePage(),
    );
  }
}
