import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_learn/constants/keys.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';

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

  static Map<TabItem, TabItemData> allTabs = {
    TabItem.community: TabItemData(
      key: Keys.communityTab,
      label: LocaleKeys.community.tr(),
      icon: Icons.list_alt,
    ),
    TabItem.youTube: TabItemData(
      key: Keys.youTubeTab,
      label: LocaleKeys.youTube.tr(),
      icon: Icons.subscriptions_outlined,
    ),
    TabItem.more: TabItemData(
      key: Keys.moreTab,
      label: LocaleKeys.more.tr(),
      icon: Icons.more_horiz,
    ),
  };
}
