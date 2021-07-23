import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/widgets/empty_content.dart';
import 'package:flutter_learn/models/comment.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'comment_list_item.dart';

final childCommentsStreamProvider =
    StreamProvider.autoDispose.family<List<Comment>, Comment>((ref, comment) {
  final database = ref.watch(databaseProvider);
  ref.maintainState = true;
  return database.childCommentsStream(comment);
});
typedef CommentCallback = void Function(Comment childComment);

class ChildCommentListItem extends HookWidget {
  const ChildCommentListItem({
    required this.topLevelComment,
    required this.menuIconTap,
    required this.replyIconTap,
    Key? key,
  }) : super(key: key);
  final Comment topLevelComment;
  final CommentCallback menuIconTap;
  final CommentCallback replyIconTap;

  @override
  Widget build(BuildContext context) {
    final childCommentsAsyncValue =
        useProvider(childCommentsStreamProvider(topLevelComment));
    return childCommentsAsyncValue.when(
      loading: () => const SizedBox(),
      error: (_, __) => EmptyContent(
        title: LocaleKeys.somethingWentWrong.tr(),
        message: LocaleKeys.cantLoadDataRightNow.tr(),
      ),
      data: (childComments) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: childComments.length,
        itemBuilder: (context, i) => CommentListItem(
          comment: childComments[i],
          menuIconTap: () => menuIconTap(childComments[i]),
          replyIconTap: () => replyIconTap(childComments[i]),
        ),
      ),
    );
  }
}
