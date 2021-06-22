import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedantic/pedantic.dart';

import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/avatar.dart';
import 'package:flutter_learn/app/widgets/empty_content.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/models/post_liked.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';

import 'format.dart';
import 'post_detail_page.dart';

final postLikedStreamProvider =
    StreamProvider.autoDispose.family<List<PostLiked>, String>((ref, postId) {
  final database = ref.watch(databaseProvider);
  return database.postLikedStream(postId);
});

class PostListItem extends HookWidget {
  const PostListItem({required this.post});
  final Post post;

  Future<void> _likePost(
      BuildContext context, bool userLiked, AppUser? appUser) async {
    if (appUser == null) {
      SignInPage.show(context);
    } else {
      _setPostLiked(context, userLiked, appUser);
    }
  }

  Future<void> _setPostLiked(
      BuildContext context, bool userLiked, AppUser appUser) async {
    final database = context.read<FirestoreDatabase>(databaseProvider);
    try {
      if (userLiked == false) {
        await database.setPostLiked(
          PostLiked(
            postId: post.id!,
            userId: appUser.id!,
            timestamp: DateTime.now(),
          ),
        );
        await _addLikedCount(context);
      } else {
        await _deleteLikedCount(context, appUser);
      }
    } catch (e) {
      unawaited(showExceptionAlertDialog(
        context: context,
        title: LocaleKeys.operationFailed.tr(),
        exception: e,
      ));
    }
  }

  Future<void> _addLikedCount(BuildContext context) async {
    try {
      final database = context.read(databaseProvider);
      final nowPost = await database.getPost(post.id!);
      if (nowPost != null) {
        await database
            .updatePost(nowPost.copyWith(likedCount: nowPost.likedCount + 1));
      }
    } catch (e) {
      unawaited(showExceptionAlertDialog(
        context: context,
        title: LocaleKeys.operationFailed.tr(),
        exception: e,
      ));
    }
  }

  Future<void> _deleteLikedCount(BuildContext context, AppUser appUser) async {
    try {
      final database = context.read(databaseProvider);
      await database.transactionDelPostLiked(
          appUser.id!, post.copyWith(likedCount: post.likedCount - 1));
    } catch (e) {
      unawaited(showExceptionAlertDialog(
        context: context,
        title: LocaleKeys.operationFailed.tr(),
        exception: e,
      ));
    }
  }

  void tapEmptyComment(BuildContext context, String postId) {
    PostDetailPage.show(context, postId: postId, autoFocus: true);
  }

  @override
  Widget build(BuildContext context) {
    final appUserAsyncValue = useProvider(appUserStreamProvider);
    final postLikedAsyncValue = useProvider(postLikedStreamProvider(post.id!));
    final routeName = ModalRoute.of(context)!.settings.name;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.title, style: Theme.of(context).textTheme.subtitle2),
              const SizedBox(height: defaultPadding),
              Text(
                post.content,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
        appUserAsyncValue.when(
          loading: () => Center(child: const CupertinoActivityIndicator()),
          error: (_, __) => const EmptyContent(
            title: 'Something went wrong',
            message: "Can't load items right now",
          ),
          data: (appUser) => Row(
            children: [
              postLikedAsyncValue.when(
                loading: () =>
                    Center(child: const CupertinoActivityIndicator()),
                error: (_, __) => const EmptyContent(
                  title: 'Something went wrong',
                  message: "Can't load items right now",
                ),
                data: (postLiked) {
                  final userLiked =
                      postLiked.any((element) => element.userId == appUser?.id);
                  return InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () => _likePost(context, userLiked, appUser),
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: SizedBox(
                        width: defaultPadding * 7,
                        child: Row(
                          children: [
                            Icon(
                              userLiked
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: userLiked ? Colors.red : Colors.grey,
                              size: 19,
                            ),
                            const SizedBox(width: 3),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                postLiked.isNotEmpty
                                    ? postLiked.length.toString()
                                    : LocaleKeys.like.tr(),
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: routeName != AppRoutes.postDetailPage
                    ? post.commentCount == 0
                        ? () => tapEmptyComment(context, post.id!)
                        : null
                    : null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  child: Row(
                    children: [
                      Icon(
                        Icons.mode_comment_outlined,
                        color: Colors.grey,
                        size: 18.3,
                      ),
                      const SizedBox(width: 5),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          post.commentCount > 0
                              ? post.commentCount.toString()
                              : LocaleKeys.comment.tr(),
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class PostUserInfo extends HookWidget {
  const PostUserInfo({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    final database = useProvider(databaseProvider);
    return FutureBuilder<AppUser?>(
      future: database.getAppUser(post.userId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          late final postUser = snapshot.data;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Avatar(
                photoUrl: postUser?.photoURL,
                displayName: postUser?.displayName,
                radius: 14,
              ),
              const SizedBox(width: defaultPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    postUser!.displayName!,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.black87),
                  ),
                  Text(
                    Format.duration(post.timestamp!),
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
              Spacer(),
              Text(
                LocaleKeys.tag.tr(),
                style: Theme.of(context).textTheme.overline,
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
