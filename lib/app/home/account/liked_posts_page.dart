import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/home/community/post_detail_page.dart';
import 'package:flutter_learn/app/home/community/post_list_item.dart';
import 'package:flutter_learn/app/widgets/list_items_builder.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/post_liked.dart';
import 'package:flutter_learn/models/read_post.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userLikedPostsStreamProvider =
    StreamProvider.autoDispose<List<PostLiked>>((ref) {
  final database = ref.watch(databaseProvider);
  return ref.watch(appUserStreamProvider).when(
        data: (appUser) => database.userLikedPostsStream(appUser!.id),
        loading: () => Stream<List<PostLiked>>.empty(),
        error: (error, stackTrace) => Stream<List<PostLiked>>.empty(),
      );
});
final readPostsStreamProvider =
    StreamProvider.autoDispose<List<ReadPost>>((ref) {
  final database = ref.watch(databaseProvider);
  return ref.watch(appUserStreamProvider).when(
        data: (appUser) => database.userReadPostsStream(appUser!.id),
        loading: () => Stream<List<ReadPost>>.empty(),
        error: (error, stackTrace) => Stream<List<ReadPost>>.empty(),
      );
});

class LikedPostsPage extends HookWidget {
  const LikedPostsPage({required this.initialIndex, Key? key})
      : super(key: key);
  final int initialIndex;

  static Future<void> show(BuildContext context,
      {required int initialIndex}) async {
    await Navigator.of(context, rootNavigator: true)
        .pushNamed(AppRoutes.myLikedPostsPage, arguments: initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    final tabIndex = useMemoized(() => initialIndex);
    return DefaultTabController(
      length: 2,
      initialIndex: tabIndex,
      child: Scaffold(
        appBar: AppBar(bottom: _buildTabBar()),
        body: TabBarView(
          children: [
            _buildLikedPosts(context),
            _buildReadPosts(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLikedPosts(BuildContext context) {
    final userLikedPostsAsyncValue = useProvider(userLikedPostsStreamProvider);
    return ListItemsBuilder<PostLiked>(
      data: userLikedPostsAsyncValue,
      itemBuilder: (context, item) => PostListItem(
        postId: item.postId,
        onTap: () => PostDetailPage.show(context, postId: item.postId),
      ),
    );
  }

  Widget _buildReadPosts(BuildContext context) {
    final readPostsAsyncValue = useProvider(readPostsStreamProvider);
    return ListItemsBuilder<ReadPost>(
      data: readPostsAsyncValue,
      itemBuilder: (context, item) => PostListItem(
        postId: item.postId,
        onTap: () => PostDetailPage.show(context, postId: item.postId),
      ),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      tabs: [
        Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.favorite_outline),
              SizedBox(width: defaultPadding),
              Text(LocaleKeys.myLikedPosts.tr()),
            ],
          ),
        ),
        Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.bookmarks_outlined),
              SizedBox(width: defaultPadding),
              Text(LocaleKeys.myReadPosts.tr()),
            ],
          ),
        ),
      ],
    );
  }
}
