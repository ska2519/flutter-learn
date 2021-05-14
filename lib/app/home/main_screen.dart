import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/home/components/side_menu.dart';
import 'package:flutter_learn/app/home/dashboard/components/community.dart';
import 'package:flutter_learn/app/home/dashboard/components/recent_files.dart';
import 'package:flutter_learn/app/home/dashboard/components/storage_details.dart';
import 'package:flutter_learn/app/home/dashboard/dashboard_screen.dart';
import 'package:flutter_learn/app/home/tab_item.dart';
import 'package:flutter_learn/constants/keys.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_learn/constants/responsive.dart';
import 'package:flutter_learn/controllers/menu_controller.dart';

class NavScreen extends StatefulHookWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
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
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // We want this side menu only for large screen
                  const Expanded(
                    // default flex = 1
                    // and it takes 1/6 part of the screen
                    child: SideMenu(),
                  ),
                  Expanded(
                    // It takes 5/6 part of the screen
                    flex: 5,
                    child: DashboardScreen(),
                  ),
                ],
              )
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
