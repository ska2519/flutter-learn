import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/home/community/edit_post_page.dart';
import 'package:flutter_learn/app/home/community/post_detail_page.dart';
import 'package:flutter_learn/app/widgets/empty_content.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'post_list_item.dart';

const iconPath = 'assets/icons/';
const imagePath = 'assets/pixel_perfect/';
//assetPath: '${imagePath}Screenshot_1620879287-393x830.png',

final postsStreamProvider = StreamProvider.autoDispose<List<Post>>((ref) {
  final database = ref.watch(databaseProvider);
  return database.postsStream();
});

class PostsPage extends HookWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('rebuild Screen');
    final AsyncValue<List<Post>> postsAsyncValue =
        useProvider(postsStreamProvider);
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
              onPressed: () => EditPostPage.show(context),
            )
          ],
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: false,
            titlePadding: EdgeInsetsDirectional.only(
              start: defaultPadding,
              bottom: defaultPadding,
            ),
            title: Text(
              '😎 ${AppLocalizations.of(context)?.community}',
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
        postsAsyncValue.when(
          data: (items) => items.isNotEmpty
              ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final post = items[index];
                      return PostListItem(
                        post: post,
                        onTap: () => PostDetailPage.show(context, post: post),
                      );
                    },
                    childCount: items.length,
                  ),
                )
              : SliverToBoxAdapter(child: const EmptyContent()),
          loading: () => SliverToBoxAdapter(
              child: const Center(child: CircularProgressIndicator())),
          error: (_, __) => SliverToBoxAdapter(
            child: const EmptyContent(
              title: 'Something went wrong',
              message: "Can't load items right now",
            ),
          ),
        ),
      ],
    );
  }
}
