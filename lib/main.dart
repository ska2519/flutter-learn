import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/screens/dashboard/components/community.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';

import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/controllers/menu_controller.dart';
import 'package:flutter_learn/screens/main/main_screen.dart';

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
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgTestColor,
        textTheme: GoogleFonts.notoSansTextTheme(),
        //     .apply(bodyColor: Colors.black),
        canvasColor: secondaryColor,
      ),
      home: CommunityScreen(),
      // MultiProvider(
      //   providers: [
      //     ChangeNotifierProvider(
      //       create: (context) => MenuController(),
      //     ),
      //   ],

      //MainScreen(),
    );
  }
}
