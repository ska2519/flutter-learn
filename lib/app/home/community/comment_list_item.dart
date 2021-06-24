import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/app/widgets/avatar.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/models/comment.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'format.dart';

class CommentListItem extends HookWidget {
  const CommentListItem({
    required this.commentKey,
    required this.comment,
    required this.menuIconTap,
    required this.replyIconTap,
  });
  final Key commentKey;
  final Comment comment;
  final VoidCallback menuIconTap;
  final VoidCallback replyIconTap;

  Future<void> _likeComment(BuildContext context, Comment comment) async {
    final appUser = context.read(appUserProvider);
    if (appUser.id == null) {
      SignInPage.show(context);
    } else {
      comment.likeComment(appUser);
      _updateComment(context, comment);
    }
  }

  Future<void> _updateComment(BuildContext context, Comment comment) async {
    final database = context.read<FirestoreDatabase>(databaseProvider);
    await database.updateComment(comment);
  }

  @override
  Widget build(BuildContext context) {
    final database = useProvider(databaseProvider);
    final appUser = useProvider(appUserProvider);
    return FutureBuilder<AppUser?>(
      key: commentKey,
      future: database.getAppUser(comment.userId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          late final commentUser = snapshot.data;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: comment.level! * defaultPadding * 2),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Avatar(
                  photoUrl: commentUser!.photoURL,
                  displayName: commentUser.displayName,
                  radius: 14,
                ),
              ),
              const SizedBox(width: defaultPadding),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${commentUser.displayName!} • ${Format.duration(comment.timestamp!)}',
                      style: Theme.of(context)
                          .textTheme
                          .overline!
                          .copyWith(color: Colors.black54),
                    ),
                    SelectableText(
                      comment.text,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.black87),
                    ),
                    Row(
                      children: [
                        Text(
                          comment.likedUsers.isNotEmpty
                              ? '좋아요 ${comment.likedUsers.length.toString()}개'
                              : '',
                          style: Theme.of(context)
                              .textTheme
                              .overline!
                              .copyWith(color: Colors.black54),
                        ),
                        if (comment.likedUsers.isNotEmpty)
                          const SizedBox(width: defaultPadding)
                        else
                          const SizedBox(),
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap:
                              comment.userId == appUser.id ? menuIconTap : null,
                          child: Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Icon(
                              Icons.more_horiz,
                              color: comment.userId == appUser.id
                                  ? flutterPrimaryColor
                                  : Colors.grey[400],
                              size: 17,
                            ),
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                        // 1레벨 댓글만 가능
                        if (comment.level! > 0)
                          const SizedBox()
                        else
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: replyIconTap,
                            child: Padding(
                              padding: const EdgeInsets.all(defaultPadding),
                              child: Icon(
                                Icons.reply,
                                color: flutterPrimaryColor,
                                size: 17,
                              ),
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () => _likeComment(context, comment),
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(
                    comment.likedUsers.contains(appUser.id)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: comment.likedUsers.contains(appUser.id)
                        ? Colors.red
                        : Colors.grey,
                    size: 15,
                  ),
                ),
              )
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
