import 'package:flutter/material.dart';
import 'package:flutter_learn/app/home/desktop/community_screen.dart';
import 'package:flutter_learn/app/home/desktop/youtube_screen.dart';
import 'package:flutter_learn/app/home/home_page.dart';
import 'package:flutter_learn/app/sign_in/email/email_password_sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppRoutes {
  static const emailPasswordSignInPage = '/email-password-sign-in-page';
  static const appPage = '/app-page';
  static const communityScreen = '/community-screen';
  static const youtubeScreen = '/youtube-screen';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(
      RouteSettings settings, FirebaseAuth firebaseAuth) {
    // ignore: unused_local_variable
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.emailPasswordSignInPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => EmailPasswordSignInPage.withFirebaseAuth(
            firebaseAuth,
            onSignedIn: args as void Function(),
          ),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.appPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => HomePage(),
          //maintainState false = pop으로 돌아가면 위젯 rebuild
          maintainState: false,
          settings: settings,
        );
      case AppRoutes.communityScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => CommunityScreen(),
          settings: settings,
        );
      case AppRoutes.youtubeScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => YouTubeScreen(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
