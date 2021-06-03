import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/home/community/post_page.dart';
import 'package:flutter_learn/app/widgets/empty_content.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pixel_perfect/pixel_perfect.dart';

const iconPath = 'assets/icons/';
const imagePath = 'assets/pixel_perfect/';

final postsStreamProvider = StreamProvider.autoDispose<List<Post>>((ref) {
  final database = ref.watch(databaseProvider);
  return database.postsStream();
});

class CommunityPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Post>> postsAsyncValue =
        useProvider(postsStreamProvider);
    return PixelPerfect(
      //assetPath: '${imagePath}Screenshot_1620879287-393x830.png',
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 120.0,
            floating: true,
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.create),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostPage(),
                      ));
                },
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: EdgeInsetsDirectional.only(
                start: defaultPadding,
                bottom: defaultPadding,
              ),
              title: Text(
                '\u{1f60e} Community',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          postsAsyncValue.when(
            data: (items) => items.isNotEmpty
                ? SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final post = items[index];
                        return Container(
                          margin: const EdgeInsets.only(top: defaultPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.all(defaultPadding * 2),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: Colors.grey[300]),
                                    SizedBox(width: defaultPadding),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          post.author,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2,
                                        ),
                                        Text(
                                          '${DateTime.now().difference(DateTime.parse(post.postId)).inMinutes} min',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Text(
                                      'Category',
                                      style:
                                          Theme.of(context).textTheme.overline,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: defaultPadding * 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      post.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                    SizedBox(height: defaultPadding),
                                    Text(
                                      post.content,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    // constraints: BoxConstraints.tight(Size(22, 22)),
                                    // padding: EdgeInsets.zero,
                                    color: Colors.grey,
                                    disabledColor: Colors.black,
                                    icon: Icon(Icons.favorite_border),
                                    onPressed: () {},
                                  ),
                                  Text(
                                    '좋아요',
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  IconButton(
                                    color: Colors.grey,
                                    disabledColor: Colors.black,
                                    icon: Icon(Icons.mode_comment_outlined,
                                        size: 22.6),
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
                      },
                      childCount: items.length,
                    ),
                  )
                : SliverToBoxAdapter(child: const EmptyContent()),
            loading: () => SliverToBoxAdapter(
                child: const Center(child: CircularProgressIndicator())),
            error: (_, __) => SliverToBoxAdapter(
              child: const EmptyContent(
                title: 'Something went wrong',
                message: "Can't load items right now",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
