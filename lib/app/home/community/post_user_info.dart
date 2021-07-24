import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/widgets/avatar.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:flutter_learn/utils/format.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final isLoadingProvider = StateProvider<bool>((ref) => true);

class PostUserInfo extends HookWidget {
  const PostUserInfo({required this.post});
  final Post post;

  @override
  Widget build(BuildContext context) {
    final database = useProvider(databaseProvider);
    final isLoading = useProvider(isLoadingProvider);
    useMemoized(() => WidgetsBinding.instance!
        .addPostFrameCallback((_) => isLoading.state = false));

    return FutureBuilder<AppUser?>(
      future: database.getAppUser(post.userId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          late final postUser = snapshot.data;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Avatar(
                photoUrl: postUser!.deletedUser ? null : postUser.photoURL,
                displayName: postUser.deletedUser ? null : postUser.displayName,
                radius: 14,
              ),
              const SizedBox(width: defaultPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    postUser.deletedUser
                        ? LocaleKeys.deletedUser.tr()
                        : postUser.displayName,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.black87),
                  ),
                  Text(
                    duration(post.timestamp!),
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
              SizedBox(width: defaultPadding),
              Expanded(
                child: Text(
                  post.tags.isEmpty ? '' : post.tags.toString(),
                  textAlign: TextAlign.right,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: firebaseOrangeColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
