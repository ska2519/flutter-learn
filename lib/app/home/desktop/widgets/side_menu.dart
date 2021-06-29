import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        // it enables scrolling
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/flutter-text-logo.png"),
            ),
            DrawerListTile(
              title: LocaleKeys.community.tr(),
              icon: Icons.list_alt,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.communityScreen);
              },
            ),
            DrawerListTile(
              title: LocaleKeys.youTube.tr(),
              icon: Icons.subscriptions_outlined,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.youtubeScreen);
              },
            ),
            DrawerListTile(
              title: LocaleKeys.more.tr(),
              icon: Icons.more_horiz,
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.accountScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0.0,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 3),
          Icon(icon, color: Colors.black),
        ],
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.subtitle2,
      ),
    );
  }
}
