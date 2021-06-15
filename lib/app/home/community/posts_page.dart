import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/home/community/edit_post_page.dart';
import 'package:flutter_learn/app/home/community/post_detail_page.dart';
import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/app/widgets/empty_content.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
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
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true)
        .pushNamed(AppRoutes.postsPage);
  }

  @override
  Widget build(BuildContext context) {
    log('rebuild Screen');
    final appUserStream = useProvider(appUserStreamProvider);
    final appUser = appUserStream.data?.value;
    final AsyncValue<List<Post>> postsAsyncValue =
        useProvider(postsStreamProvider);

    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
              onPressed: () => appUser == null
                  ? SignInPage.show(context)
                  : EditPostPage.show(context),
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
        CupertinoSliverRefreshControl(
          onRefresh: () async => context.refresh(postsStreamProvider),
        ),
        postsAsyncValue.when(
          data: (items) => items.isNotEmpty
              ? SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final post = items[index];
                      return
                          //Text(post.title);
                          //     PostListItem(
                          //   post: post,
                          //   onTap: () => PostDetailPage.show(context, post: post),
                          // );
                          InkWell(
                        onTap: () => PostDetailPage.show(context, post: post),
                        child: Padding(
                          padding: const EdgeInsets.all(defaultPadding * 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              PostUserInfo(post: post),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: defaultPadding),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      post.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: defaultPadding),
                                    Text(
                                      post.content,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    padding: EdgeInsets.all(0),
                                    alignment: Alignment.centerLeft,
                                    constraints:
                                        BoxConstraints.tight(Size(25, 17)),
                                    iconSize: 19,
                                    color: post.likedUsers.contains(appUser?.id)
                                        ? Colors.red
                                        : Colors.grey,
                                    disabledColor: Colors.black,
                                    icon: Icon(
                                      post.likedUsers.contains(appUser?.id)
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                    ),
                                    onPressed: () => _likePost(context, post),
                                  ),
                                  Text(
                                    post.likedUsers.isNotEmpty
                                        ? post.likedUsers.length.toString()
                                        : '좋아요',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  SizedBox(width: defaultPadding * 2),
                                  IconButton(
                                    padding: EdgeInsets.all(0),
                                    alignment: Alignment.centerLeft,
                                    constraints:
                                        BoxConstraints.tight(Size(25, 15.5)),
                                    iconSize: 18,
                                    color: Colors.grey,
                                    disabledColor: Colors.black,
                                    icon: Icon(Icons.mode_comment_outlined),
                                    onPressed: () => PostDetailPage.show(
                                        context,
                                        post: post),
                                  ),
                                  Text(
                                    post.commentCount > 0
                                        ? post.commentCount.toString()
                                        : '댓글',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: items.length,
                  ),
                )
              : SliverToBoxAdapter(child: const EmptyContent()),
          loading: () => SliverToBoxAdapter(
              // child: const Center(child: CupertinoActivityIndicator()),
              ),
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

  Future<void> _likePost(BuildContext context, Post post) async {
    final appUserStream = context.read(appUserStreamProvider);
    final appUser = appUserStream.data?.value;
    if (appUser == null) {
      SignInPage.show(context);
    } else {
      post.likePost(appUser);
      updatePost(context, post);
    }
  }

  Future<void> updatePost(BuildContext context, Post post) async {
    final database = context.read<FirestoreDatabase>(databaseProvider);
    await database.setPost(post);
  }
}
