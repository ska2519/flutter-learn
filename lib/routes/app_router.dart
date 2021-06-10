import 'package:flutter/material.dart';
import 'package:flutter_learn/app/home/account/account_page.dart';
import 'package:flutter_learn/app/home/community/edit_post_page.dart';
import 'package:flutter_learn/app/home/community/post_detail_page.dart';
import 'package:flutter_learn/app/home/desktop/community_screen.dart';
import 'package:flutter_learn/app/home/desktop/youtube_screen.dart';
import 'package:flutter_learn/app/home/home_page.dart';
import 'package:flutter_learn/app/sign_in/email/email_password_sign_in_page.dart';
import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/services/auth_base.dart';

class AppRoutes {
  static const emailPasswordSignInPage = '/email-password-sign-in-page';
  static const signInPage = '/sign-in-page';
  static const editPostPage = '/edit-post-page';
  static const postDetailPage = '/post-detail-page';
  static const appPage = '/app-page';
  static const communityScreen = '/community-screen';
  static const youtubeScreen = '/youtube-screen';
  static const accountScreen = '/account-screen';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(
      RouteSettings settings, AuthBase auth) {
    // ignore: unused_local_variable
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.emailPasswordSignInPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => EmailPasswordSignInPage.withAuthBase(
            auth,
            onSignedIn: args! as void Function(),
          ),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.signInPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => SignInPage(),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.editPostPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => EditPostPage(post: args as Post?),
          settings: settings,
          fullscreenDialog: true,
        );
      case AppRoutes.postDetailPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => PostDetailPage(post: args! as Post),
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
      case AppRoutes.accountScreen:
        return MaterialPageRoute<dynamic>(
          builder: (_) => AccountPage(),
          settings: settings,
        );
      default:
        return null;
    }
  }
}
