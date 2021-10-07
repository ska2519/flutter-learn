import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/home/community/post_filter.dart';
import 'package:flutter_learn/app/home/community/post_filter_item.dart';
import 'package:flutter_learn/app/home/community/posts_page.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommunityScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final sortPosts = useProvider(sortPostsProvider);

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
              flex: 7,
              child: PostsPage(),
            ),
            const SizedBox(width: defaultPadding),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    Text(
                      LocaleKeys.postRanking.tr(),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    const SizedBox(height: defaultPadding * 2),
                    PostFilter(),
                    const SizedBox(height: defaultPadding * 2),
                    sortPosts.when(
                        loading: () =>
                            Center(child: const CupertinoActivityIndicator()),
                        error: (error, stackTrace) => const SizedBox(),
                        data: (sortPosts) => ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  sortPosts.length < 20 ? sortPosts.length : 20,
                              itemBuilder: (context, i) {
                                final sortPost = sortPosts[i]!;
                                if (sortPosts.isEmpty) return const SizedBox();
                                return PostFilterItem(post: sortPost, i: i);
                              },
                            )),
                  ],
                ),
              ),
              // child: StorageDetails(),
            ),
          ],
        ),
      ),
    );
  }
}
