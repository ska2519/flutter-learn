import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_learn/constants/responsive.dart';
import 'package:flutter_learn/controllers/menu_controller.dart';
import 'package:flutter_learn/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_learn/screens/main/components/side_menu.dart';

class MainScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read(menuControllerProvider).scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: DashboardScreen(),
              //CommunityScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
