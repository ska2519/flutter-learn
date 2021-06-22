import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/widgets/empty_content.dart';
import 'package:flutter_learn/models/comment.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'comment_list_item.dart';

final childCommentsStreamProvider =
    StreamProvider.autoDispose.family<List<Comment>, Comment>((ref, comment) {
  final database = ref.watch(databaseProvider);
  return database.childCommentsStream(comment);
});
typedef Callback = Future<void> Function(Comment childComment);

class ChildCommentListItem extends HookWidget {
  const ChildCommentListItem({
    required this.comment,
    required this.menuIconTap,
    required this.replyIconTap,
    required this.callBack,
    Key? key,
  }) : super(key: key);
  final Comment comment;
  final VoidCallback menuIconTap;
  final VoidCallback replyIconTap;
  final Callback callBack;

  @override
  Widget build(BuildContext context) {
    final childCommentsAsyncValue =
        useProvider(childCommentsStreamProvider(comment));
    return childCommentsAsyncValue.when(
      loading: () => Center(child: const CupertinoActivityIndicator()),
      error: (_, __) => const EmptyContent(
        title: 'Something went wrong',
        message: "Can't load items right now",
      ),
      data: (childComments) {
        print('childComments: $childComments');
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: childComments.length,
          itemBuilder: (context, i) {
            return FutureBuilder(
              future: callBack(childComments[i]),
              builder: (context, snapshot) => CommentListItem(
                comment: childComments[i],
                menuIconTap: menuIconTap,
                replyIconTap: replyIconTap,
              ),
            );
          },
        );
      },
    );
  }
}
