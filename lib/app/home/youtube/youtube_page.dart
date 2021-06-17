import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';

const iconPath = 'assets/icons/';
const imagePath = 'assets/pixel_perfect/';

//assetPath: '${imagePath}Screenshot_1620879287-393x830.png',
class YouTubePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 120.0,
          floating: true,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.create),
              onPressed: () {},
            )
          ],
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            titlePadding: EdgeInsetsDirectional.only(
              start: defaultPadding,
              bottom: defaultPadding,
            ),
            title: Text(
              '\u{1f4Fa} ${LocaleKeys.youTube.tr()}',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Container(
              margin: const EdgeInsets.only(top: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [],
              ),
            ),
            childCount: 100,
          ),
        )
      ],
    );
  }
}
