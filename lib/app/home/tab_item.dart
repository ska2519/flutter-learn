import 'package:flutter/material.dart';
import 'package:flutter_learn/constants/keys.dart';

import 'package:flutter_learn/constants/strings.dart';

enum TabItem { community, youTube, more }

class TabItemData {
  const TabItemData({
    required this.key,
    required this.label,
    required this.icon,
  });

  final String key;
  final String label;
  final IconData icon;

  static const Map<TabItem, TabItemData> allTabs = {
    TabItem.community: TabItemData(
      key: Keys.communityTab,
      label: Strings.community,
      icon: Icons.list_alt,
    ),
    TabItem.youTube: TabItemData(
      key: Keys.youTubeTab,
      label: Strings.youTube,
      icon: Icons.subscriptions_outlined,
    ),
    TabItem.more: TabItemData(
      key: Keys.moreTab,
      label: Strings.more,
      icon: Icons.more_horiz,
    ),
  };
}
