import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/app/widgets/avatar.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'format.dart';

class PostListItem extends HookWidget {
  const PostListItem({
    required this.post,
  });

  final Post post;

  Future<void> _likePost(BuildContext context, Post post) async {
    final appUserAsyncValue = context.read(appUserStreamProvider);
    final appUser = appUserAsyncValue.data?.value;
    if (appUser == null) {
      SignInPage.show(context);
    } else {
      post.likePost(appUser);
      _updatePost(context, post);
    }
  }

  Future<void> _updatePost(BuildContext context, Post post) async {
    final database = context.read<FirestoreDatabase>(databaseProvider);
    await database.updatePost(post);
  }

  @override
  Widget build(BuildContext context) {
    final appUserAsyncValue = useProvider(appUserStreamProvider);
    final appUser = appUserAsyncValue.data?.value;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.title, style: Theme.of(context).textTheme.subtitle2),
              SizedBox(height: defaultPadding),
              Text(
                post.content,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
        Row(
          children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () => _likePost(context, post),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: SizedBox(
                  width: defaultPadding * 7,
                  child: Row(
                    children: [
                      Icon(
                        post.likedUsers.contains(appUser?.id)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: post.likedUsers.contains(appUser?.id)
                            ? Colors.red
                            : Colors.grey,
                        size: 19,
                      ),
                      SizedBox(width: 3),
                      Text(
                        post.likedUsers.isNotEmpty
                            ? post.likedUsers.length.toString()
                            : LocaleKeys.like.tr(),
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              constraints: BoxConstraints.tight(Size(25, 16)),
              iconSize: 18.3,
              color: Colors.grey,
              icon: Icon(Icons.mode_comment_outlined),
              onPressed: null,
            ),
            SizedBox(width: 2),
            Text(
              post.commentCount > 0
                  ? post.commentCount.toString()
                  : LocaleKeys.comment.tr(),
              style: Theme.of(context).textTheme.caption,
            ),
          ],
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
              SizedBox(width: defaultPadding),
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
        return SizedBox();
      },
    );
  }
}
