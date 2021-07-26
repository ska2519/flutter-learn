import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/app/widgets/alert_dialogs/show_exception_alert_dialog.dart';
import 'package:flutter_learn/app/widgets/avatar.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/models/comment.dart';
import 'package:flutter_learn/models/comment_liked.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pedantic/pedantic.dart';

import '../../../utils/format.dart';

final commentLikedListStreamProvider = StreamProvider.autoDispose
    .family<List<CommentLiked>, Comment>((ref, comment) {
  final database = ref.watch(databaseProvider);
  return database.commentLikedStream(comment);
});

class CommentListItem extends HookWidget {
  const CommentListItem({
    required this.comment,
    this.menuIconTap,
    this.replyIconTap,
    this.myComments,
    this.selectableText = false,
  });
  final Comment comment;
  final VoidCallback? menuIconTap;
  final VoidCallback? replyIconTap;
  final bool? myComments;
  final bool selectableText;

  Future<void> _likeComment(
      BuildContext context, bool commentLiked, AppUser appUser) async {
    final database = context.read<FirestoreDatabase>(databaseProvider);
    final commentLikedModel = CommentLiked(
      userId: appUser.id,
      userDisplayName: appUser.displayName,
      commentId: comment.id,
      commentUserId: comment.userId,
      postId: comment.postId,
      postUserId: comment.postUserId,
      commentText: comment.text,
    );
    try {
      if (!commentLiked) {
        await database.setCommentLiked(commentLikedModel);
      } else {
        await database.deleteCommentLiked(commentLikedModel);
      }
    } catch (e) {
      unawaited(showExceptionAlertDialog(
        context: context,
        title: LocaleKeys.operationFailed.tr(),
        exception: e,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final database = useProvider(databaseProvider);
    final appUser = useProvider(appUserStreamProvider).data?.value;
    final commentLikedListAsyncValue =
        useProvider(commentLikedListStreamProvider(comment));
    return FutureBuilder<AppUser?>(
      // key: Key('comment-${comment.id}'),
      future: database.getAppUser(comment.userId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          late final commentUser = snapshot.data;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: comment.level * defaultPadding * 2),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Avatar(
                  photoUrl:
                      commentUser!.deletedUser ? null : commentUser.photoURL,
                  displayName:
                      commentUser.deletedUser ? null : commentUser.displayName,
                  radius: 14,
                ),
              ),
              const SizedBox(width: defaultPadding),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${commentUser.deletedUser ? LocaleKeys.deletedUser.tr() : commentUser.displayName}  •  ${duration(comment.timestamp!)}',
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.black54),
                    ),
                    const SizedBox(height: 3),
                    if (selectableText)
                      SelectableText(
                        comment.private
                            ? LocaleKeys.noticePrivateComment.tr()
                            : comment.text,
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: Colors.black87),
                      )
                    else
                      Text(
                        comment.private
                            ? LocaleKeys.noticePrivateComment.tr()
                            : comment.text,
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: Colors.black87),
                      ),
                    Row(
                      children: [
                        Text(
                          comment.likedCount > 0
                              ? '좋아요 ${comment.likedCount.toString()}개'
                              : '',
                          style: TextStyle(
                              fontSize: 10, color: firebaseOrangeColor),
                        ),
                        if (comment.likedCount > 0)
                          const SizedBox(width: defaultPadding)
                        else
                          const SizedBox(),
                        if (myComments == true)
                          const SizedBox()
                        else
                          Row(
                            children: [
                              InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: comment.userId == appUser?.id
                                    ? menuIconTap
                                    : null,
                                child: Padding(
                                  padding: const EdgeInsets.all(defaultPadding),
                                  child: Icon(
                                    Icons.more_horiz,
                                    color: comment.userId == appUser?.id
                                        ? flutterPrimaryColor
                                        : Colors.grey[400],
                                    size: 17,
                                  ),
                                ),
                              ),
                              const SizedBox(width: defaultPadding),
                              // 1레벨 댓글만 가능
                              if (comment.level > 0)
                                const SizedBox()
                              else
                                InkWell(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: replyIconTap,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.all(defaultPadding),
                                    child: Icon(
                                      Icons.reply,
                                      color: flutterPrimaryColor,
                                      size: 17,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                      ],
                    )
                  ],
                ),
              ),
              commentLikedListAsyncValue.when(
                  loading: () => const SizedBox(),
                  error: (error, stackTrace) => const SizedBox(),
                  data: (cmtLikedList) {
                    final commentLiked = cmtLikedList
                        .any((element) => element.userId == appUser?.id);
                    return InkWell(
                      onTap: () => appUser == null
                          ? SignInPage.show(context)
                          : _likeComment(context, commentLiked, appUser),
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Icon(
                          commentLiked ? Icons.favorite : Icons.favorite_border,
                          color:
                              commentLiked ? firebaseOrangeColor : Colors.grey,
                          size: 15,
                        ),
                      ),
                    );
                  })
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
