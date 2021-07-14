import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/utils/format.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'package:flutter_learn/app/home/youtube/youtube_play_page.dart';
import 'package:flutter_learn/app/widgets/empty_content.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/tag.dart';
import 'package:flutter_learn/models/youtube_playlist_items.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/services/youtube_service.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';

final youTubeTagsProvider = FutureProvider<List<Tag?>>((ref) async {
  final database = ref.read(databaseProvider);
  final totalTags = await database.getTags();
  late final List<Tag> youTubeTags = [];
  totalTags
      .map((tag) => tag.youTube == true && tag.playlistId != null
          ? youTubeTags.add(tag)
          : null)
      .toList();
  youTubeTags.sort((a, b) => b.level.compareTo(a.level));
  return youTubeTags;
});

final isLoadingProvider = StateProvider<bool>((ref) => false);
enum playListLoadFilter { changeTag, loadMore }
final loadFilterProvider = StateProvider((ref) => playListLoadFilter.changeTag);

final playlistProvider = StateProvider<PlaylistItems?>((ref) => null);

final playlistLoadProvider =
    FutureProvider.family<PlaylistItems?, Tag>((ref, tag) async {
  final youTubeService = ref.read(youTubeServiceProvider);
  final playlist = ref.read(playlistProvider).state;
  final youTubeControllers = ref.read(youTubeControllersProvider).state;
  final filter = ref.watch(loadFilterProvider);

  switch (filter.state) {
    case playListLoadFilter.changeTag:
      final playlist =
          await youTubeService.fetchPlaylistItems(playListId: tag.playlistId!);

      final youTubeControllers =
          playlist.items.map((item) => youtubePlayerController(item)).toList();

      ref.read(playlistProvider).state = playlist;
      ref.read(youTubeControllersProvider).state = youTubeControllers;
      return playlist;

    case playListLoadFilter.loadMore:
      final morePlaylist = await youTubeService.fetchPlaylistItems(
        playListId: tag.playlistId!,
        pageToken: playlist?.nextPageToken,
      );

      ref.read(playlistProvider).state = morePlaylist.copyWith(
        items: playlist!.items..addAll(morePlaylist.items),
        prevPageToken: morePlaylist.prevPageToken,
        nextPageToken: morePlaylist.nextPageToken,
      );
      ref.read(youTubeControllersProvider).state = youTubeControllers
        ..addAll(morePlaylist.items
            .map((item) => youtubePlayerController(item))
            .toList());

      ref.read(isLoadingProvider).state = false;
      return ref.read(playlistProvider).state!;
  }
});

final youTubeControllersProvider =
    StateProvider<List<YoutubePlayerController>>((ref) => []);

class PlaylistPage extends StatefulHookWidget {
  const PlaylistPage({Key? key}) : super(key: key);

  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  int selectedIndex = 0;
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tagsAsyncValue = useProvider(youTubeTagsProvider);
    final isLoading = useProvider(isLoadingProvider).state;
    return tagsAsyncValue.when(
      loading: () => const Center(child: CupertinoActivityIndicator()),
      error: (_, __) => EmptyContent(
        title: LocaleKeys.somethingWentWrong.tr(),
        message: LocaleKeys.cantLoadDataRightNow.tr(),
      ),
      data: (List<Tag?> tags) {
        context.read(playlistLoadProvider(tags[selectedIndex]!));

        final playlists = useProvider(playlistProvider).state;
        final youTubeControllers =
            useProvider(youTubeControllersProvider).state;

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (!isLoading &&
                (scrollInfo.metrics.pixels - 400 ==
                    scrollInfo.metrics.maxScrollExtent - 400) &&
                playlists!.pageInfo.totalResults != playlists.items.length) {
              if (mounted) {
                context.read(isLoadingProvider).state = true;
                context.read(loadFilterProvider).state =
                    playListLoadFilter.loadMore;
              }
            }
            return false;
          },
          child: SafeArea(
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  expandedHeight: 90 + defaultPadding * 2,
                  collapsedHeight: 60,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    titlePadding: EdgeInsetsDirectional.only(
                      start: defaultPadding,
                      bottom: defaultPadding * 6,
                    ),
                    title: Text(
                      LocaleKeys.youTube.tr(),
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: flutterPrimaryColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.1,
                          ),
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(-10),
                    child: Container(
                      padding: const EdgeInsets.all(defaultPadding),
                      height: 50,
                      color: Colors.white,
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(width: defaultPadding * 1.2),
                        scrollDirection: Axis.horizontal,
                        itemCount: tags.length,
                        itemBuilder: (context, i) {
                          final tag = tags[i]!;
                          return tag.playlistId!.isEmpty
                              ? const SizedBox()
                              : FilterChip(
                                  label: Text(
                                    tag.name,
                                    style: TextStyle(
                                      color: tag.color != null
                                          ? Color(int.parse(tag.color!))
                                          : Colors.black,
                                      fontWeight: selectedIndex == i
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                  onSelected: (bool selected) async {
                                    if (selectedIndex == i) return;
                                    selectedIndex = i;

                                    final scrollPosition = scrollController
                                        .position.pixels
                                        .toInt();

                                    scrollController.animateTo(0,
                                        duration: Duration(
                                            microseconds: scrollPosition),
                                        curve: Curves.easeOut);
                                    if (mounted) {
                                      context.read(loadFilterProvider).state =
                                          playListLoadFilter.changeTag;
                                      context.read(playlistLoadProvider(
                                          tags[selectedIndex]!));
                                    }
                                  },
                                  selected: selectedIndex == i ? true : false,
                                  avatar: Image.asset(
                                    tag.image != null
                                        ? 'assets/icons/${tag.image}'
                                        : 'assets/icons/dino_icon_180.png',
                                  ),
                                  shape: StadiumBorder(
                                    side: BorderSide(
                                      color: tag.color != null
                                          ? Color(int.parse(tag.color!))
                                          : Colors.black,
                                    ),
                                  ),
                                  backgroundColor: Colors.transparent,
                                  selectedColor: Colors.transparent,
                                  checkmarkColor: tag.color != null
                                      ? Color(int.parse(tag.color!))
                                      : Colors.black,
                                );
                        },
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                    child: const SizedBox(height: defaultPadding)),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) {
                      final item = playlists!.items[i];
                      return Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: GestureDetector(
                          onTap: () => YouTubePlayPage.show(context,
                              item: item, tag: tags[selectedIndex]!.name),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(defaultPadding),
                                child: thumbnail(item.snippet.thumbnails),
                              ),
                              SizedBox(height: defaultPadding),
                              Text(item.snippet.title),
                              SizedBox(height: defaultPadding / 2),
                              Text(
                                item.snippet.videoOwnerChannelTitle,
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: youTubeControllers.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  CachedNetworkImage thumbnail(Thumbnails thumbnails) => CachedNetworkImage(
        imageUrl: getVideoThumbnail(thumbnails),
        fit: BoxFit.cover,
        height: 200,
      );
}

YoutubePlayerController youtubePlayerController(Item item) =>
    YoutubePlayerController(
      initialVideoId: item.contentDetails.videoId,
      params: YoutubePlayerParams(
        startAt: Duration(seconds: 30),
        showFullscreenButton: true,
        captionLanguage: 'kr',
      ),
    );
