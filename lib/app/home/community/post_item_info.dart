import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/empty_content.dart';
import 'package:flutter_learn/app/widgets/shimmer_widget.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/models/post_liked.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedantic/pedantic.dart';

import 'post_detail_page.dart';
import 'post_user_info.dart';

final postLikedStreamProvider =
    StreamProvider.autoDispose.family<List<PostLiked>, String>((ref, postId) {
  final database = ref.watch(databaseProvider);
  return database.postLikedStream(postId);
});

class PostItemInfo extends HookWidget {
  const PostItemInfo({
    required this.post,
    this.selectableText = false,
  });
  final Post post;
  final bool selectableText;

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
            postId: post.id,
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
      final nowPost = await database.getPost(post.id);
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

  void tapEmptyComment(BuildContext context, String postId) =>
      PostDetailPage.show(context, postId: postId, autoFocus: true);

  @override
  Widget build(BuildContext context) {
    final appUser = useProvider(appUserStreamProvider).data?.value;
    final postLikedAsyncValue = useProvider(postLikedStreamProvider(post.id));
    final routeName = ModalRoute.of(context)!.settings.name;
    final isLoading = useProvider(isLoadingProvider);

    if (isLoading.state) {
      return _buildShimmer(context);
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  post.private ? LocaleKeys.noticePrivatePost.tr() : post.title,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                const SizedBox(height: defaultPadding),
                if (selectableText)
                  SelectableText(
                    post.private
                        ? LocaleKeys.noticePrivatePost.tr()
                        : post.content,
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                else
                  Text(
                    post.private
                        ? LocaleKeys.noticePrivatePost.tr()
                        : post.content,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    maxLines: 4,
                  ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: defaultPadding * 7,
                child: postLikedAsyncValue.when(
                  loading: () => Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                        size: 19,
                      ),
                      const SizedBox(width: 3),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          LocaleKeys.like.tr(),
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                    ],
                  ),
                  error: (_, __) => EmptyContent(
                    title: LocaleKeys.somethingWentWrong.tr(),
                    message: LocaleKeys.cantLoadDataRightNow.tr(),
                  ),
                  data: (postLiked) {
                    final userLiked = postLiked
                        .any((element) => element.userId == appUser?.id);
                    return InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () => appUser == null
                          ? SignInPage.show(context)
                          : _likePost(context, userLiked, appUser),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: defaultPadding),
                        child: Row(
                          children: [
                            Icon(
                              userLiked
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color:
                                  userLiked ? firebaseOrangeColor : Colors.grey,
                              size: 19,
                            ),
                            const SizedBox(width: 3),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3),
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
                    );
                  },
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: routeName != AppRoutes.postDetailPage
                    ? post.commentCount == 0
                        ? () => tapEmptyComment(context, post.id)
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
                        padding: const EdgeInsets.only(bottom: 3),
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
              Spacer()
            ],
          )
        ],
      );
    }
  }

  Widget _buildShimmer(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Row(
        children: [
          ShimmerWidget.circular(width: 28, height: 28),
          SizedBox(width: defaultPadding),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShimmerWidget.rectangular(width: 80, height: 10),
              SizedBox(height: 4),
              ShimmerWidget.rectangular(width: 50, height: 8),
            ],
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: defaultPadding),
          ShimmerWidget.rectangular(width: size.width / 2, height: 12),
          SizedBox(height: defaultPadding),
          ShimmerWidget.rectangular(width: size.width * 0.88, height: 11),
          SizedBox(height: 4),
          ShimmerWidget.rectangular(width: size.width * 0.88, height: 11),
        ],
      ),
    );
  }
}
