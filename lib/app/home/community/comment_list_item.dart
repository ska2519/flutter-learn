import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    required this.comment,
    required this.menuIconTap,
    required this.replyIconTap,
    Key? key,
  }) : super(key: key);
  final Comment comment;
  final VoidCallback menuIconTap;
  final VoidCallback replyIconTap;

  @override
  Widget build(BuildContext context) {
    final database = useProvider(databaseProvider);
    final appUser = useProvider(appUserProvider);
    return FutureBuilder<AppUser?>(
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
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
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
