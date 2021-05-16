import 'package:flutter/material.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

const iconPath = 'assets/icons/';
const imagePath = 'assets/pixel_perfect/';

class CommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PixelPerfect(
      //assetPath: '${imagePath}Screenshot_1620879287-393x830.png',
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 120.0,
              floating: true,
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                  icon: Icon(Icons.search, color: Colors.black),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.create, color: Colors.black),
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
                  'Community',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  margin: const EdgeInsets.only(top: defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(defaultPadding * 2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(backgroundColor: Colors.grey[300]),
                            SizedBox(width: defaultPadding),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ska Lee',
                                  style: Theme.of(context).textTheme.subtitle2,
                                ),
                                Text(
                                  '${59 + index} min',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                            Spacer(),
                            Text(
                              'Category',
                              style: Theme.of(context).textTheme.overline,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding * 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Title Text\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed\n #$index',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            SizedBox(height: defaultPadding),
                            Text(
                              'we test Text field with 3lines.\ndo eiusmod tempor incididunt ut labore et dolore magna?\n#$index',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            // constraints: BoxConstraints.tight(Size(22, 22)),
                            // padding: EdgeInsets.zero,
                            color: Colors.grey,
                            disabledColor: Colors.black,
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {},
                          ),
                          Text(
                            '좋아요',
                            style: Theme.of(context).textTheme.caption,
                          ),
                          IconButton(
                            color: Colors.grey,
                            disabledColor: Colors.black,
                            icon: Icon(Icons.mode_comment_outlined, size: 22.6),
                            onPressed: () {},
                          ),
                          Text(
                            '댓글',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                childCount: 1000,
              ),
            )
          ],
        ),
      ),
    );
  }
}
