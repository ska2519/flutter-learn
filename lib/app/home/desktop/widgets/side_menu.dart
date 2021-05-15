import 'package:flutter/material.dart';
import 'package:flutter_learn/app/home/desktop/widgets/recent_files.dart';
import 'package:flutter_learn/constants/strings.dart';

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
              title: Strings.community,
              icon: Icons.list_alt,
              onTap: () {},
            ),
            DrawerListTile(
              title: Strings.youTube,
              icon: Icons.subscriptions_outlined,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RecentFiles()));
              },
            ),
            DrawerListTile(
              title: Strings.more,
              icon: Icons.more_horiz,
              onTap: () {},
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
          SizedBox(height: 3),
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
