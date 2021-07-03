import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_learn/app/home/community/edit_post_page.dart';
import 'package:flutter_learn/app/home/community/post_detail_page.dart';
import 'package:flutter_learn/app/home/community/post_item_info.dart';
import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/app/widgets/empty_content.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';

import 'post_item_info.dart';
import 'post_user_info.dart';

const iconPath = 'assets/icons/';
const imagePath = 'assets/pixel_perfect/';
//assetPath: '${imagePath}Screenshot_1620879287-393x830.png',

final postsStreamProvider = StreamProvider.autoDispose<List<Post?>>((ref) {
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
    final appUser = useProvider(appUserStreamProvider).data?.value;
    final postsAsyncValue = useProvider(postsStreamProvider);
    print('PostsPage build');
    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: [
        PostsPageSliverAppBar(appUser: appUser),
        CupertinoSliverRefreshControl(
          onRefresh: () async => context.refresh(postsStreamProvider),
        ),
        postsAsyncValue.when(
          loading: () => SliverToBoxAdapter(
              child: const Center(child: CircularProgressIndicator())),

          //     SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (context, index) => Padding(
          //       padding: const EdgeInsets.all(defaultPadding),
          //       child: _buildShimmer(context),
          //     ),
          //     childCount: 5,
          //   ),
          // ),
          error: (_, __) => SliverToBoxAdapter(
            child: EmptyContent(
              title: LocaleKeys.somethingWentWrong.tr(),
              message: LocaleKeys.cantLoadDataRightNow.tr(),
            ),
          ),
          data: (items) => items.isEmpty
              ? SliverToBoxAdapter(child: const EmptyContent())
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final post = items[index];
                      return InkWell(
                        onTap: () =>
                            PostDetailPage.show(context, postId: post!.id),
                        child: Padding(
                          padding: const EdgeInsets.all(defaultPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              PostUserInfo(post: post!),
                              PostItemInfo(post: post),
                              const SizedBox(height: defaultPadding),
                              const Divider(height: 0.5)
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: items.length,
                  ),
                ),
        ),
      ],
    );
  }
}

class PostsPageSliverAppBar extends StatelessWidget {
  const PostsPageSliverAppBar({
    Key? key,
    required this.appUser,
  }) : super(key: key);

  final AppUser? appUser;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 120.0,
      floating: true,
      actions: [
        // IconButton(
        //   icon: Icon(Icons.search),
        //   onPressed: () {},
        // ),
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
          '😎   ${LocaleKeys.community.tr()}',
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
