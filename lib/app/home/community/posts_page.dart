import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/widgets/tag_avatar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/app/widgets/empty_content.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/models/tag.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';

import 'edit_post_page.dart';
import 'post_detail_page.dart';
import 'post_filter.dart';
import 'post_filter_item.dart';
import 'post_item_info.dart';
import 'post_user_info.dart';
import 'search_page.dart';

enum sortType { likedCount, commentCount, readCount }
final postsFilter = StateProvider<sortType>((_) => sortType.likedCount);
final postsFilterDays = StateProvider<int>((_) => 1);

final sortPostsProvider = FutureProvider<List<Post?>>((ref) {
  final database = ref.read(databaseProvider);
  final filter = ref.watch(postsFilter);
  final filterDays = ref.watch(postsFilterDays);
  final filterDurationDay =
      DateTime.now().subtract(Duration(days: filterDays.state));
  final dateFormatted =
      DateFormat("yyyy-MM-ddTHH:mm:ss").format(filterDurationDay);
  return database.getPosts(startDay: dateFormatted, filter: filter);
});

final selectedTagsProvider = StateProvider<Set<Tag>>((ref) => {});

final tagsProvider = FutureProvider<List<Tag>>((ref) async {
  final database = ref.read(databaseProvider);
  final List<Tag> postsTags = [];
  final totalTags = await database.getTags();
  totalTags
      .map((tag) => tag.postCount > 0 ? postsTags.add(tag) : null)
      .toList();
  postsTags.sort((a, b) => b.level.compareTo(a.level));
  postsTags.sort((a, b) => b.postCount.compareTo(a.postCount));
  return postsTags;
});

final postsStreamProvider =
    StreamProvider.family.autoDispose<List<Post?>, List<Tag?>?>((ref, tags) {
  final database = ref.read(databaseProvider);
  final selectedTags = ref.watch(selectedTagsProvider).state;
  final Set<String> stringTags = {};

  for (final tag in selectedTags) {
    stringTags.add(tag.name);
  }
  return database.postsStream(tags: stringTags);
});

class PostsPage extends HookWidget {
  const PostsPage();

  static Future<void> show(BuildContext context) async =>
      Navigator.of(context, rootNavigator: true).pushNamed(AppRoutes.postsPage);

  @override
  Widget build(BuildContext context) {
    final selectedIndexList = useState(<int>[]);
    final tagsAsyncValue = useProvider(tagsProvider);

    print('PostsPage build');
    return tagsAsyncValue.when(
      loading: () => const Center(child: CupertinoActivityIndicator()),
      error: (_, __) => EmptyContent(
        title: LocaleKeys.somethingWentWrong.tr(),
        message: LocaleKeys.cantLoadDataRightNow.tr(),
      ),
      data: (tags) {
        final appUser = useProvider(appUserStreamProvider).data?.value;
        final sortPosts = useProvider(sortPostsProvider);
        final postsAsyncValue = useProvider(postsStreamProvider(null));
        return SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              PostsPageSliverAppBar(
                appUser: appUser,
                tags: tags,
                selectedIndexList: selectedIndexList,
              ),
              CupertinoSliverRefreshControl(
                onRefresh: () async =>
                    context.refresh(postsStreamProvider(tags)),
              ),
              SliverToBoxAdapter(child: PostFilter()),
              SliverToBoxAdapter(child: Divider()),
              sortPosts.when(
                loading: () => SliverToBoxAdapter(
                    child: Center(child: const CupertinoActivityIndicator())),
                error: (error, stackTrace) =>
                    SliverToBoxAdapter(child: const SizedBox()),
                data: (sortPosts) => _buildFilterPostLists(sortPosts),
              ),
              postsAsyncValue.when(
                loading: () => SliverToBoxAdapter(child: const SizedBox()),
                error: (_, __) => SliverToBoxAdapter(
                  child: EmptyContent(
                    title: LocaleKeys.somethingWentWrong.tr(),
                    message: LocaleKeys.cantLoadDataRightNow.tr(),
                  ),
                ),
                data: (items) {
                  return items.isEmpty
                      ? SliverToBoxAdapter(child: const EmptyContent())
                      : _buildPostList(items);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPostList(List<Post?> items) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final post = items[index];
          return InkWell(
            onTap: () => PostDetailPage.show(context, postId: post!.id),
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  PostUserInfo(post: post!),
                  PostItemInfo(post: post),
                  const SizedBox(height: defaultPadding),
                  const Divider(height: 0.5)
                ],
              ),
            ),
          );
        },
        childCount: items.length,
      ),
    );
  }

  Widget _buildFilterPostLists(List<Post?> sortPosts) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, i) {
          final sortPost = sortPosts[i]!;
          if (sortPosts.isEmpty) return const SizedBox();
          return PostFilterItem(post: sortPost, i: i);
        },
        childCount: sortPosts.length < 5 ? sortPosts.length : 5,
      ),
    );
  }
}

class PostsPageSliverAppBar extends StatelessWidget {
  const PostsPageSliverAppBar({
    Key? key,
    required this.appUser,
    required this.tags,
    required this.selectedIndexList,
  }) : super(key: key);

  final AppUser? appUser;
  final List<Tag> tags;
  final ValueNotifier<List<int>> selectedIndexList;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      expandedHeight: 90 + (defaultPadding * 5),
      collapsedHeight: 60,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () => SearchPage.show(context),
        ),
        IconButton(
          icon: Icon(Icons.create),
          onPressed: () => appUser == null
              ? SignInPage.show(context)
              : EditPostPage.show(context, autoFocus: true),
        )
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: EdgeInsetsDirectional.only(
          start: defaultPadding,
          bottom: defaultPadding * 6,
        ),
        title: Text(
          LocaleKeys.community.tr(),
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: flutterPrimaryColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(-10), //-10
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          height: 50,
          child: Row(
            children: [
              if (selectedIndexList.value.isEmpty)
                const SizedBox()
              else
                Padding(
                  padding: const EdgeInsets.only(right: defaultPadding),
                  child: InkWell(
                    onTap: () => _resetFilter(context),
                    child: Icon(Icons.highlight_off_outlined),
                  ),
                ),
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: defaultPadding * 1.2),
                  scrollDirection: Axis.horizontal,
                  itemCount: tags.length,
                  itemBuilder: (context, i) {
                    final tag = tags[i];
                    return _buildTagFilterChip(context, tag, i);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTagFilterChip(BuildContext context, Tag tag, int i) {
    return FilterChip(
      label: Text('${tag.name} ${tag.postCount != 0 ? tag.postCount : ''}',
          style: TextStyle(
            color:
                tag.color != null ? Color(int.parse(tag.color!)) : Colors.black,
            fontWeight: selectedIndexList.value.contains(i)
                ? FontWeight.bold
                : FontWeight.normal,
          )),
      onSelected: (bool selected) => _selectFilter(context, i),
      // ignore: avoid_bool_literals_in_conditional_expressions
      selected: selectedIndexList.value.contains(i) ? true : false,
      avatar: TagAvatar(tag),
    );
  }

  void _selectFilter(BuildContext context, int i) {
    selectedIndexList.value.contains(i)
        ? selectedIndexList.value.remove(i)
        : selectedIndexList.value.add(i);

    final selectedTags = <Tag>{};
    for (final selectedIndex in selectedIndexList.value) {
      selectedTags.add(tags[selectedIndex]);
    }
    context.read(selectedTagsProvider).state = selectedTags;
  }

  void _resetFilter(BuildContext context) {
    selectedIndexList.value = [];
    context.read(selectedTagsProvider).state = {};
  }
}
