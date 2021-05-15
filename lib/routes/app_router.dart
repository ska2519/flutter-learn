import 'package:flutter/material.dart';
import 'package:flutter_learn/app/home/home_page.dart';

class AppRoutes {
  static const appPage = '/app-page';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final args = settings.arguments;
    switch (settings.name) {
      case AppRoutes.appPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => HomePage(),
          //maintainState false = pop으로 돌아가면 위젯 rebuild
          maintainState: false,
          settings: settings,
          fullscreenDialog: true,
        );
      default:
        return null;
    }
  }
}
