import 'package:flutter/material.dart';
import 'package:flutter_learn/app/home/community/community_page.dart';
import 'package:flutter_learn/app/home/desktop/widgets/side_menu.dart';
import 'package:flutter_learn/app/home/desktop/widgets/storage_details.dart';
import 'package:flutter_learn/app/home/youtube/youtube_page.dart';
import 'package:flutter_learn/constants/constants.dart';

class YouTubeScreen extends StatelessWidget {
  const YouTubeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          // It takes 5/6 part of the screen
          flex: 5,
          child: YouTubePage(),
        ),
        const SizedBox(width: defaultPadding),
        const Expanded(
          flex: 2,
          child: StorageDetails(),
        ),
      ],
    );
  }
}
