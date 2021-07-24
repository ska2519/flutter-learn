import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/home/community/comment_list_item.dart';
import 'package:flutter_learn/app/home/community/post_detail_page.dart';
import 'package:flutter_learn/app/home/community/post_list_item.dart';
import 'package:flutter_learn/app/widgets/list_items_builder.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/comment.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userPostsStreamProvider = StreamProvider.autoDispose<List<Post>>((ref) {
  final database = ref.watch(databaseProvider);
  return ref.watch(appUserStreamProvider).when(
        data: (appUser) => database.userPostsStream(appUser!.id),
        loading: () => Stream<List<Post>>.empty(),
        error: (error, stackTrace) => Stream<List<Post>>.empty(),
      );
});
final userCommentsStreamProvider =
    StreamProvider.autoDispose<List<Comment>>((ref) {
  final database = ref.watch(databaseProvider);
  return ref.watch(appUserStreamProvider).when(
        data: (appUser) => database.userCommentsStream(appUser!.id),
        loading: () => Stream<List<Comment>>.empty(),
        error: (error, stackTrace) => Stream<List<Comment>>.empty(),
      );
});

class MyPostsPage extends HookWidget {
  const MyPostsPage({required this.initialIndex, Key? key}) : super(key: key);
  final int initialIndex;

  static Future<void> show(BuildContext context,
      {required int initialIndex}) async {
    await Navigator.of(context, rootNavigator: true)
        .pushNamed(AppRoutes.myPostsPage, arguments: initialIndex);
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
            _buildUserPosts(context),
            _buildUserComments(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUserPosts(BuildContext context) {
    final userPostsAsyncValue = useProvider(userPostsStreamProvider);
    return ListItemsBuilder<Post>(
      data: userPostsAsyncValue,
      itemBuilder: (context, item) => PostListItem(
        postId: item.id,
        onTap: () => PostDetailPage.show(context, postId: item.id),
      ),
    );
  }

  Widget _buildUserComments(BuildContext context) {
    final userCommentsAsyncValue = useProvider(userCommentsStreamProvider);
    return ListItemsBuilder<Comment>(
      data: userCommentsAsyncValue,
      itemBuilder: (context, item) => GestureDetector(
        onTap: () => PostDetailPage.show(context, postId: item.postId),
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: CommentListItem(comment: item, myComments: true),
        ),
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
              Icon(Icons.note_alt_outlined),
              const SizedBox(width: defaultPadding),
              Text(LocaleKeys.myPosts.tr()),
            ],
          ),
        ),
        Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.reply_all),
              const SizedBox(width: defaultPadding),
              Text(LocaleKeys.myComments.tr()),
            ],
          ),
        ),
      ],
    );
  }
}
