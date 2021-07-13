import 'package:flutter/material.dart';
import 'package:flutter_learn/app/home/account/account_page.dart';
import 'package:flutter_learn/app/home/account/liked_posts_page.dart';
import 'package:flutter_learn/app/home/account/my_posts_page.dart';
import 'package:flutter_learn/app/home/account/settings_page.dart';
import 'package:flutter_learn/app/home/community/edit_post_page.dart';
import 'package:flutter_learn/app/home/community/post_detail_page.dart';
import 'package:flutter_learn/app/home/community/posts_page.dart';
import 'package:flutter_learn/app/home/community/search_page.dart';
import 'package:flutter_learn/app/home/desktop/community_screen.dart';
import 'package:flutter_learn/app/home/desktop/youtube_screen.dart';
import 'package:flutter_learn/app/home/home_page.dart';
import 'package:flutter_learn/app/home/youtube/youtube_play_page.dart';
import 'package:flutter_learn/app/sign_in/email/email_password_sign_in_page.dart';
import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/main.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/models/youtube_playlist_items.dart';
import 'package:flutter_learn/services/auth_base.dart';

class AppRoutes {
  static const homePage = '/';
  static const emailPasswordSignInPage = '/email-password-sign-in-page';
  static const signInPage = '/sign-in-page';
  static const editPostPage = '/edit-post-page';
  static const postDetailPage = '/post-detail-page';
  static const communityScreen = '/community-screen';
  static const youtubeScreen = '/youtube-screen';
  static const accountScreen = '/account-screen';
  static const postsPage = '/posts-page';
  static const settingsPage = '/settings-page';
  static const myPostsPage = '/my-posts-page';
  static const myLikedPostsPage = '/my-liked-posts-page';
  static const searchPage = 'search-page';
  static const youTubePlayPage = 'you-tube-play-page';
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
        );
      case AppRoutes.signInPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => SignInPage(),
          settings: settings,
        );
      case AppRoutes.settingsPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => SettingsPage(),
          settings: settings,
          maintainState: false,
        );
      case AppRoutes.myPostsPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => MyPostsPage(initialIndex: args! as int),
          settings: settings,
          maintainState: false,
        );
      case AppRoutes.myLikedPostsPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => LikedPostsPage(initialIndex: args! as int),
          settings: settings,
          maintainState: false,
        );
      case AppRoutes.editPostPage:
        final mapArgs = args as Map<String, dynamic>?;
        final post = mapArgs!['post'] as Post?;
        final autoFocus = mapArgs['autoFocus'] as bool?;
        return MaterialPageRoute<dynamic>(
          builder: (_) => EditPostPage(
            post: post,
            autoFocus: autoFocus,
          ),
          settings: settings,
          //fullscreenDialog: true, // iOS 아래서 나옴
          maintainState: false,
        );
      case AppRoutes.postDetailPage:
        final mapArgs = args as Map<String, dynamic>?;
        final postId = mapArgs!['postId'] as String;
        final key = mapArgs['key'] as Key?;
        final autoFocus = mapArgs['autoFocus'] as bool?;
        return MaterialPageRoute<dynamic>(
          builder: (_) => PostDetailPage(
            postId: postId,
            autoFocus: autoFocus,
            key: key,
          ),
          settings: settings,
          // maintainState: false,
        );
      case AppRoutes.homePage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => HomePage(
            analytics: MyApp.analytics,
            observer: MyApp.observer,
          ),
          //maintainState false = pop으로 돌아가면 위젯 rebuild
          // maintainState: false,
          settings: settings,
        );
      case AppRoutes.postsPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => PostsPage(),
          settings: settings,
          maintainState: false,
          // fullscreenDialog: true,
        );
      case AppRoutes.searchPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => SearchPage(),
          settings: settings,
          maintainState: false,
          fullscreenDialog: true,
        );
      case AppRoutes.youTubePlayPage:
        final mapArgs = args as Map<String, dynamic>?;
        final item = mapArgs!['item'] as Item;
        final tag = mapArgs['tag'] as String;
        return MaterialPageRoute<dynamic>(
          builder: (_) => YouTubePlayPage(
            item: item,
            tag: tag,
          ),
          settings: settings,
          maintainState: false,
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
