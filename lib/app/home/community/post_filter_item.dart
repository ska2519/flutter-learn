import 'package:flutter/material.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/post.dart';
import 'post_detail_page.dart';

class PostFilterItem extends StatelessWidget {
  const PostFilterItem({required this.post, this.i = 0});
  final Post post;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => PostDetailPage.show(context, postId: post.id),
            child: Row(
              children: [
                Text(' ${i + 1}. '),
                Expanded(
                  child: Text(
                    post.title,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }
}
