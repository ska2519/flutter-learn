import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_learn/app/home/community/edit_post_page.dart';
import 'package:flutter_learn/app/home/community/post_detail_page.dart';
import 'package:flutter_learn/app/home/community/post_item_info.dart';
import 'package:flutter_learn/app/home/community/search_page.dart';
import 'package:flutter_learn/app/sign_in/sign_in_page.dart';
import 'package:flutter_learn/app/widgets/empty_content.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/app_user.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/models/tag.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/firebase_auth_service.dart';
import 'package:flutter_learn/services/firebase_storage.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';

import 'post_item_info.dart';
import 'post_user_info.dart';

// const iconPath = 'assets/icons/';
// const imagePath = 'assets/pixel_perfect/';
//assetPath: '${imagePath}Screenshot_1620879287-393x830.png',
final selectedTagsProvider = StateProvider<Set<Tag>>((ref) => {});
final tagsProvider = FutureProvider<List<Tag>>((ref) async {
  final database = ref.read(databaseProvider);
  final storage = ref.read(storageProvider);
  late final List<Tag> postsTags = [];
  print('start totalTags');
  final totalTags = await database.getTags();
  print('get totalTags: $totalTags');
  totalTags
      .map(
        (tag) => tag.postCount > 0 ? postsTags.add(tag) : null,
      )
      .toList();
  postsTags.sort((a, b) => b.level.compareTo(a.level));
  postsTags.sort((a, b) => b.postCount.compareTo(a.postCount));

  // for (var i = 0; i < postsTags.length; i++) {
  //   if (postsTags[i].imageUrl == null || postsTags[i].imageUrl == '') {
  //     postsTags[i] = postsTags[i].copyWith(
  //       imageUrl: postsTags[i].image != null
  //           ? await storage.tagDownloadURL(tagIcon: postsTags[i].image)
  //           : null,
  //     );
  //     await database.updateTag(postsTags[i]);
  //   }
  // }
  return postsTags;
});
final postsStreamProvider =
    StreamProvider.family.autoDispose<List<Post?>, List<Tag?>?>((ref, tags) {
  final database = ref.watch(databaseProvider);
  final selectedTags = ref.watch(selectedTagsProvider).state;
  final Set<String> stringTags = {};

  for (final tag in selectedTags) {
    stringTags.add(tag.name);
  }
  return database.postsStream(tags: stringTags);
});

class PostsPage extends HookWidget {
  const PostsPage();
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true)
        .pushNamed(AppRoutes.postsPage);
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(<int>[]);
    final appUser = useProvider(appUserStreamProvider).data?.value;
    final tagsAsyncValue = useProvider(tagsProvider);

    print('PostsPage build');
    return tagsAsyncValue.when(
      // loading: () => const SizedBox(),
      loading: () => const Center(child: CupertinoActivityIndicator()),
      error: (_, __) => EmptyContent(
        title: LocaleKeys.somethingWentWrong.tr(),
        message: LocaleKeys.cantLoadDataRightNow.tr(),
      ),
      data: (tags) {
        final postsAsyncValue = useProvider(postsStreamProvider(null));
        return SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              PostsPageSliverAppBar(
                appUser: appUser,
                tags: tags,
                selectedIndexList: selectedIndex,
              ),
              CupertinoSliverRefreshControl(
                onRefresh: () async =>
                    context.refresh(postsStreamProvider(tags)),
              ),
              postsAsyncValue.when(
                loading: () => SliverToBoxAdapter(child: const SizedBox()),
                error: (_, __) => SliverToBoxAdapter(
                  child: EmptyContent(
                    title: LocaleKeys.somethingWentWrong.tr(),
                    message: LocaleKeys.cantLoadDataRightNow.tr(),
                  ),
                ),
                data: (items) => items.isEmpty
                    ? SliverToBoxAdapter(child: const EmptyContent())
                    : SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final post = items[index];
                            return InkWell(
                              onTap: () => PostDetailPage.show(context,
                                  postId: post!.id),
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
                      ),
              ),
            ],
          ),
        );
      },
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
                letterSpacing: 0.3,
              ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(-10),
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          height: 50,
          color: Colors.white,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: defaultPadding),
                child: InkWell(
                  onTap: _resetFilter,
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
      avatar: newMethod(tag),
      // ? tag.imageUrl != null
      //         ? CachedNetworkImage(imageUrl: tag.imageUrl!)
      //         : Image.asset('assets/icons/dino_icon_180.png'),
      shape: StadiumBorder(
        side: BorderSide(
          color:
              tag.color != null ? Color(int.parse(tag.color!)) : Colors.black,
        ),
      ),
      backgroundColor: Colors.transparent,
      selectedColor: Colors.transparent,
      checkmarkColor:
          tag.color != null ? Color(int.parse(tag.color!)) : Colors.black,
    );
  }

  Widget newMethod(Tag tag) {
    if (tag.image != null) {
      final path = 'assets/icons/${tag.image}';
      rootBundle.load(path).then((value) => print(value));
      return Image.asset(path);
    } else {
      return tag.imageUrl != null
          ? CachedNetworkImage(imageUrl: tag.imageUrl!)
          : Image.asset('assets/icons/dino_icon_180.png');
    }
  }

  void _selectFilter(BuildContext context, int i) {
    if (selectedIndexList.value.contains(i)) {
      selectedIndexList.value.remove(i);
    } else {
      selectedIndexList.value.add(i);
    }
    final selectedTags = <Tag>{};
    for (final selectedIndex in selectedIndexList.value) {
      selectedTags.add(tags[selectedIndex]);
    }
    context.read(selectedTagsProvider).state = selectedTags;
  }

  void _resetFilter() => selectedIndexList.value = [];
}
