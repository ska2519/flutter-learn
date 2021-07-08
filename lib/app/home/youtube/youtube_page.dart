import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/widgets/empty_content.dart';
import 'package:flutter_learn/models/tag.dart';
import 'package:flutter_learn/models/youtube_playlist_items.dart';
import 'package:flutter_learn/services/firestore_database.dart';
import 'package:flutter_learn/services/youtube_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';

const iconPath = 'assets/icons/';
const imagePath = 'assets/pixel_perfect/';

final youTubeTagsProvider = FutureProvider<List<Tag?>>((ref) async {
  final database = ref.read(databaseProvider);
  late final List<Tag?> youTubeTags = [];
  final totalTags = await database.getTags();

  totalTags
      .map((tag) => tag!.youTube == true ? youTubeTags.add(tag) : null)
      .toList();
  youTubeTags.sort((a, b) => b!.level.compareTo(a!.level));

  return youTubeTags;
});
final isLoadingProvider = StateProvider<bool>((ref) => false);
enum playListLoadFilter { changeTag, loadMore }
final loadFilterProvider = StateProvider((ref) => playListLoadFilter.changeTag);

final playlistProvider = StateProvider<PlaylistItems>((ref) => PlaylistItems());

final playlistLoadProvider =
    FutureProvider.family<PlaylistItems, Tag>((ref, tag) async {
  final youTubeService = ref.read(youTubeServiceProvider);
  final playlist = ref.read(playlistProvider).state;
  final youTubeControllers = ref.read(youTubeControllersProvider).state;
  final filter = ref.watch(loadFilterProvider);

  switch (filter.state) {
    case playListLoadFilter.changeTag:
      print('changeTag!!');
      final playlist = await youTubeService.fetchPlaylistItemsList(
          playListId: tag.playlistId!);
      print('playlist: $playlist');
      final youTubeControllers =
          playlist.items!.map((item) => youtubePlayerController(item)).toList();

      ref.read(playlistProvider).state = playlist;
      ref.read(youTubeControllersProvider).state = youTubeControllers;
      return playlist;

    case playListLoadFilter.loadMore:
      final morePlaylist = await youTubeService.fetchPlaylistItemsList(
        playListId: tag.playlistId!,
        pageToken: playlist.nextPageToken,
      );

      ref.read(playlistProvider).state = morePlaylist.copyWith(
        items: playlist.items!..addAll(morePlaylist.items!),
        prevPageToken: morePlaylist.prevPageToken,
        nextPageToken: morePlaylist.nextPageToken,
      );
      print(
          'playlistProvider ${ref.read(playlistProvider).state.pageInfo!.totalResults}');
      ref.read(youTubeControllersProvider).state = youTubeControllers
        ..addAll(morePlaylist.items!
            .map((item) => youtubePlayerController(item))
            .toList());
      print(
          'ref.read(youTubeControllersProvider).state: ${ref.read(youTubeControllersProvider).state.length}');
      ref.read(isLoadingProvider).state = false;
      return ref.read(playlistProvider).state;
  }
});

final youTubeControllersProvider =
    StateProvider<List<YoutubePlayerController>>((ref) => []);

class YouTubePage extends StatefulHookWidget {
  const YouTubePage({Key? key}) : super(key: key);

  @override
  _YouTubePageState createState() => _YouTubePageState();
}

class _YouTubePageState extends State<YouTubePage> {
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
                (scrollInfo.metrics.pixels - 150 ==
                    scrollInfo.metrics.maxScrollExtent - 150) &&
                playlists.pageInfo!.totalResults != playlists.items!.length) {
              context.read(isLoadingProvider).state = true;
              context.read(loadFilterProvider).state =
                  playListLoadFilter.loadMore;
              print(
                  'playlistItemsList.pageInfo!.totalResults: ${playlists.pageInfo!.totalResults}');
              print(
                  'playlistItemsList.items!.length: ${playlists.items!.length}');
            }
            return false;
          },
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 90 + (defaultPadding * 6),
                floating: true,
                backgroundColor: Colors.white,
                elevation: 1.0,
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  titlePadding: EdgeInsetsDirectional.only(
                    start: defaultPadding,
                    bottom: defaultPadding * 6,
                  ),
                  title: Text(
                    '\u{1f4Fa} ${LocaleKeys.youTube.tr()}',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Color(0xFF282828),
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.1,
                        ),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(50),
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
                        return FilterChip(
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

                            print(scrollController.position.pixels);
                            if (mounted) {
                              scrollController.animateTo(0,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeOut);

                              context.read(loadFilterProvider).state =
                                  playListLoadFilter.changeTag;
                              context.read(
                                  playlistLoadProvider(tags[selectedIndex]!));
                            }
                          },
                          selected: selectedIndex == i ? true : false,
                          avatar: Image.asset(tag.image != null
                              ? 'assets/icons/${tag.image}'
                              : 'assets/icons/dino_icon.png'),
                          shape: StadiumBorder(
                            side: BorderSide(
                                color: tag.color != null
                                    ? Color(int.parse(tag.color!))
                                    : Colors.black),
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
              SliverToBoxAdapter(child: SizedBox(height: defaultPadding)),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(defaultPadding),
                          child: youTubePlayer(i),
                        ),
                        SizedBox(height: defaultPadding),
                        Text(playlists.items![i].snippet.title),
                        SizedBox(height: defaultPadding / 2),
                        Text(
                          playlists.items![i].snippet.videoOwnerChannelTitle,
                          style:
                              Theme.of(context).textTheme.caption!.copyWith(),
                        )
                      ],
                    ),
                  ),
                  childCount: youTubeControllers.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  YoutubePlayer youTubePlayer(int i) {
    final youTubeControllers = context.read(youTubeControllersProvider).state;
    final playlistItemsList = context.read(playlistProvider).state;
    return YoutubePlayer(
      key: ObjectKey(youTubeControllers[i]),
      controller: youTubeControllers[i],
      actionsPadding:
          EdgeInsets.symmetric(horizontal: defaultPadding * 2, vertical: 3),
      bottomActions: [
        CurrentPosition(),
        const SizedBox(width: defaultPadding),
        ProgressBar(isExpanded: true),
        const SizedBox(width: defaultPadding),
        RemainingDuration(),
        FullScreenButton(),
        PlaybackSpeedButton(),
      ],
      onEnded: (data) => youTubeControllers[i].pause(),
      topActions: [
        Expanded(
          child: Text(
            playlistItemsList.items![i].snippet.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

YoutubePlayerController youtubePlayerController(Item item) {
  return YoutubePlayerController(
    initialVideoId: item.contentDetails.videoId,
    flags: YoutubePlayerFlags(
      autoPlay: false,
      captionLanguage: 'kr',
      controlsVisibleAtStart: true,
      forceHD: true,
    ),
  );
}
