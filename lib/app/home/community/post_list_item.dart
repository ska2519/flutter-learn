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

import 'format.dart';
import 'post_detail_page.dart';

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
    await database.setPost(post);
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
              Text(
                post.title,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
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
            SizedBox(
              width: defaultPadding * 7,
              child: InkWell(
                onTap: () => _likePost(context, post),
                child: Row(
                  children: [
                    Icon(
                      post.likedUsers.contains(appUser?.id)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: post.likedUsers.contains(appUser?.id)
                          ? Colors.red
                          : Colors.grey,
                      size: 18,
                    ),
                    SizedBox(width: 5),
                    Text(
                      post.likedUsers.isNotEmpty
                          ? post.likedUsers.length.toString()
                          : '좋아요',
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: defaultPadding),
            IconButton(
              padding: EdgeInsets.all(0),
              alignment: Alignment.centerLeft,
              constraints: BoxConstraints.tight(Size(25, 15.5)),
              iconSize: 18,
              color: Colors.grey,
              disabledColor: Colors.black,
              icon: Icon(Icons.mode_comment_outlined),
              onPressed: () => PostDetailPage.show(context, post: post),
            ),
            Text(
              post.commentCount > 0 ? post.commentCount.toString() : '댓글',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Avatar(
                photoUrl: postUser?.photoURL,
                displayName: postUser?.displayName,
                radius: 19,
              ),
              SizedBox(width: defaultPadding),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    postUser!.displayName!,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    Format.duration(post.timestamp!),
                    style: Theme.of(context).textTheme.caption,
                  ),
                ],
              ),
              Spacer(),
              Text(
                'Category',
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
