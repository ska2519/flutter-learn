import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

    return InkWell(
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.postUserInfo == true)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
              child: PostUserInfo(post: post),
            )
          else
            Padding(padding: const EdgeInsets.only(top: defaultPadding)),
          Padding(
            padding: const EdgeInsets.fromLTRB(defaultPadding * 2,
                defaultPadding, defaultPadding * 2, defaultPadding),
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
                Text(
                  post.content,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                iconSize: 19,
                visualDensity: VisualDensity.compact,
                color: post.usersLiked.contains(appUserStream.data?.value?.id)
                    ? Colors.red
                    : Colors.grey,
                disabledColor: Colors.black,
                icon: Icon(
                  post.usersLiked.contains(appUserStream.data?.value?.id)
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
              IconButton(
                iconSize: 18.7,
                visualDensity: VisualDensity.compact,
                color: Colors.grey,
                disabledColor: Colors.black,
                icon: Icon(Icons.mode_comment_outlined),
                onPressed: () {},
              ),
              Text(
                '댓글',
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class PostUserInfo extends StatelessWidget {
  const PostUserInfo({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(backgroundColor: Colors.grey[300]),
        SizedBox(width: defaultPadding),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.displayName,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(
              // '${DateTime.now().difference(DateTime.parse(post.id)).inMinutes} min',
              '1min',
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
}
