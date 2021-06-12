import 'package:flutter/material.dart';
import 'package:flutter_learn/app/home/community/posts_page.dart';
import 'package:flutter_learn/app/home/desktop/widgets/storage_details.dart';

import 'package:flutter_learn/constants/constants.dart';

class CommunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            // const Expanded(
            //   // default flex = 1
            //   // and it takes 1/6 part of the screen
            //   child: SideMenu(),
            // ),

            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: PostsPage(),
            ),
            const SizedBox(width: defaultPadding),
            const Expanded(
              flex: 2,
              child: StorageDetails(),
            ),
          ],
        ),
      ),
    );
  }
}
