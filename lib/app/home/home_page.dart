import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/home/account/account_page.dart';
import 'package:flutter_learn/app/home/community/community_page.dart';
import 'package:flutter_learn/app/home/desktop/community_screen.dart';
import 'package:flutter_learn/app/home/desktop/widgets/side_menu.dart';
import 'package:flutter_learn/app/home/youtube/youtube_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_learn/app/home/tab_item.dart';
import 'package:flutter_learn/constants/keys.dart';
import 'package:flutter_learn/constants/responsive.dart';
import 'package:flutter_learn/controllers/menu_controller.dart';

// final homePageProvider = Provider((ref) => HomePage());
// final navigatorKeyProvider = Provider<Key>((ref) {
//   return ref.read(homePageProvider).navigatorKey;
// });

class HomePage extends StatefulHookWidget {
  // final _navigatorKey = const Key(Keys.bottomNavigationBar);
  // Key get navigatorKey => _navigatorKey;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _screens = [
    CommunityPage(),
    YouTubePage(),
    AccountPage(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read(menuControllerProvider).scaffoldKey,
      drawer: Responsive.isDesktop(context) ? const SideMenu() : null,
      body: Responsive.isDesktop(context)
          ? CommunityScreen()
          : IndexedStack(
              index: _selectedIndex,
              children: _screens,
            ),
      bottomNavigationBar: Responsive.isDesktop(context)
          ? const SizedBox()
          : BottomNavigationBar(
              currentIndex: _selectedIndex,
              key: const Key(Keys.bottomNavigationBar),
              items: [
                _buildItem(TabItem.community),
                _buildItem(TabItem.youTube),
                _buildItem(TabItem.more),
              ],
              onTap: (index) => setState(() => _selectedIndex = index),
            ),
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    final itemData = TabItemData.allTabs[tabItem]!;
    return BottomNavigationBarItem(
        icon: Icon(itemData.icon), label: itemData.label);
  }
}
