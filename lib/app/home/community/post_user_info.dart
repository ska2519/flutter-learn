import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_learn/app/widgets/avatar.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';

import 'format.dart';

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
                photoUrl: postUser!.deletedUser ? null : postUser.photoURL,
                displayName: postUser.deletedUser ? 'D' : postUser.displayName,
                radius: 14,
              ),
              const SizedBox(width: defaultPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    postUser.deletedUser
                        ? LocaleKeys.deletedUser.tr()
                        : postUser.displayName!,
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