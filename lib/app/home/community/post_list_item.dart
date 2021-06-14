import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/app/widgets/avatar.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';

import 'format.dart';

class PostListItem extends StatefulHookWidget {
  const PostListItem({
    this.post,
    this.onTap,
    Key? key,
    this.postUserInfo = true,
  }) : super(key: key);
  final Post? post;
  final VoidCallback? onTap;
  final bool? postUserInfo;

  @override
  _PostListItemState createState() => _PostListItemState();
}

class _PostListItemState extends State<PostListItem> {
  late Post post;

  @override
  void initState() {
    super.initState();
    if (widget.post != null) {
      post = widget.post!;
    }
  }

  Future<void> _likePost(BuildContext context, Post post) async {
    final appUserStream = context.read(appUserStreamProvider);
    final appUser = appUserStream.data?.value;
    if (appUser == null) {
      SignInPage.show(context);
    } else {
      post.likePost(appUser);
      updatePost(post);
    }
  }

  Future<void> updatePost(Post post) async {
    final database = context.read<FirestoreDatabase>(databaseProvider);
    await database.setPost(post);
  }

  @override
  Widget build(BuildContext context) {
    final appUserStream = useProvider(appUserStreamProvider);
    final appUser = appUserStream.data?.value;
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding * 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.postUserInfo == true)
              PostUserInfo(post: post)
            else
              const SizedBox(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(height: defaultPadding),
                  SelectableText(
                    post.content,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  padding: EdgeInsets.all(0),
                  alignment: Alignment.centerLeft,
                  constraints: BoxConstraints.tight(Size(25, 17)),
                  iconSize: 19,
                  color: post.usersLiked.contains(appUser?.id)
                      ? Colors.red
                      : Colors.grey,
                  disabledColor: Colors.black,
                  icon: Icon(
                    post.usersLiked.contains(appUser?.id)
                        ? Icons.favorite
                        : Icons.favorite_border,
                  ),
                  onPressed: () => _likePost(context, post),
                ),
                Text(
                  post.usersLiked.isNotEmpty
                      ? post.usersLiked.length.toString()
                      : '좋아요',
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(width: defaultPadding * 2),
                IconButton(
                  padding: EdgeInsets.all(0),
                  alignment: Alignment.centerLeft,
                  constraints: BoxConstraints.tight(Size(25, 15.5)),
                  iconSize: 18,
                  color: Colors.grey,
                  disabledColor: Colors.black,
                  icon: Icon(Icons.mode_comment_outlined),
                  onPressed: () {},
                ),
                Text(
                  post.commentCount > 0 ? post.commentCount.toString() : '댓글',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            )
          ],
        ),
      ),
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
                    Format.duration(post.timestamp!.last),
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
