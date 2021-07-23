import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/home/community/post_item_info.dart';
import 'package:flutter_learn/app/home/community/post_user_info.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostListItem extends HookWidget {
  const PostListItem({
    required this.postId,
    this.onTap,
  });
  final String postId;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final database = context.read(databaseProvider);
    return GestureDetector(
      onTap: onTap,
      child: FutureBuilder(
        future: database.getPost(postId),
        builder: (context, snapshot) => !snapshot.hasData
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PostUserInfo(post: snapshot.data! as Post),
                    PostItemInfo(post: snapshot.data! as Post),
                  ],
                ),
              ),
      ),
    );
  }
}
