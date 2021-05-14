import 'package:flutter/material.dart';
import 'package:flutter_learn/app/home/dashboard/components/community.dart';
import 'package:flutter_learn/app/home/tab_item.dart';
import 'package:flutter_learn/constants/keys.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TabItem _currentTab = TabItem.community;

  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.community: GlobalKey<NavigatorState>(),
    TabItem.youTube: GlobalKey<NavigatorState>(),
    TabItem.more: GlobalKey<NavigatorState>(),
  };

  List<Widget> get widgets {
    return [
      CommunityPage(),
      // TabItem.youTube: (_) => EntriesPage(),
      // TabItem.more: (_) => AccountPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        key: navigatorKeys[widgets],
        children: widgets,
      ),
      bottomNavigationBar: BottomNavigationBar(
        key: const Key(Keys.bottomNavigationBar),
        items: [
          _buildItem(TabItem.community),
          _buildItem(TabItem.youTube),
          _buildItem(TabItem.more),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    final itemData = TabItemData.allTabs[tabItem]!;
    return BottomNavigationBarItem(
        icon: Icon(itemData.icon), label: itemData.label);
  }
}
