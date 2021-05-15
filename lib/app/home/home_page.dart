import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/home/community/community_page.dart';
import 'package:flutter_learn/app/home/desktop/widgets/recent_files.dart';
import 'package:flutter_learn/app/home/desktop/widgets/storage_details.dart';
import 'package:flutter_learn/app/home/desktop/widgets/side_menu.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_learn/app/home/desktop/desktop_screen.dart';
import 'package:flutter_learn/app/home/tab_item.dart';
import 'package:flutter_learn/constants/keys.dart';
import 'package:flutter_learn/constants/responsive.dart';
import 'package:flutter_learn/controllers/menu_controller.dart';

class HomePage extends StatefulHookWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _screens = [
    CommunityPage(),
    RecentFiles(),
    StorageDetails(),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read(menuControllerProvider).scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Responsive.isDesktop(context)
            ? DesktopScreen()
            : IndexedStack(
                index: _selectedIndex,
                children: _screens,
              ),
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
