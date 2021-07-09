import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/home/community/format.dart';
import 'package:flutter_learn/app/widgets/avatar.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/youtube_channel.dart' as ch;
import 'package:flutter_learn/models/youtube_playlist_items.dart';
import 'package:flutter_learn/models/youtube_video.dart' as uv;
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/youtube_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

final channelProvider =
    FutureProvider.family<ch.Channel, Item>((ref, item) async {
  final youTubeService = ref.read(youTubeServiceProvider);
  return youTubeService.fetchYouTubeChannel(
      channelId: item.snippet.videoOwnerChannelId);
});
final youTubeVideoProvider =
    FutureProvider.family<uv.YouTubeVideo, Item>((ref, item) async {
  final youTubeService = ref.read(youTubeServiceProvider);
  return youTubeService.fetchYouTubeVideo(videoId: item.contentDetails.videoId);
});

class YouTubePlayPage extends HookWidget {
  const YouTubePlayPage({required this.item});
  final Item item;

  static Future<void> show(BuildContext context, {required Item item}) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      AppRoutes.youTubePlayPage,
      arguments: item,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _youTubeController = useState(YoutubePlayerController(
      initialVideoId: item.contentDetails.videoId,
      flags: YoutubePlayerFlags(
        captionLanguage: 'kr',
        controlsVisibleAtStart: true,
        forceHD: true,
      ),
    ));

    final channelAsyncValue = useProvider(channelProvider(item));
    final youTubeVideoAsyncValue = useProvider(youTubeVideoProvider(item));
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              YoutubePlayer(
                key: ObjectKey(_youTubeController.value),
                controller: _youTubeController.value,
                showVideoProgressIndicator: true,
                actionsPadding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 2, vertical: 3),
                bottomActions: [
                  CurrentPosition(),
                  const SizedBox(width: defaultPadding),
                  ProgressBar(isExpanded: true),
                  const SizedBox(width: defaultPadding),
                  RemainingDuration(),
                  FullScreenButton(),
                  PlaybackSpeedButton(),
                ],
                onEnded: (data) => _youTubeController.value.pause(),
                topActions: [
                  Expanded(
                    child: Text(
                      item.snippet.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              youTubeVideoAsyncValue.when(
                loading: () => const SizedBox(),
                error: (_, __) => const SizedBox(),
                data: (video) {
                  final uvVideo = video.items[0];
                  return Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          item.snippet.title,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        SizedBox(height: defaultPadding),
                        Text(
                            '조회수 ${uvVideo.statistics.viewCount} 명  •  ${Format.duration(uvVideo.snippet.publishedAt)}',
                            style: Theme.of(context).textTheme.caption),
                        const SizedBox(height: defaultPadding * 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            PlayerIconButton(
                              onPressed: () {},
                              buttonText: uvVideo.statistics.likeCount,
                              icon: Icon(Icons.thumb_up_outlined, size: 22),
                            ),
                            PlayerIconButton(
                              onPressed: () {},
                              buttonText: uvVideo.statistics.likeCount,
                              icon: Icon(Icons.thumb_down_outlined, size: 22),
                            ),
                            PlayerIconButton(
                              onPressed: () {},
                              buttonText: LocaleKeys.save.tr(),
                              icon: Icon(Icons.archive_outlined, size: 22),
                            ),
                            PlayerIconButton(
                              onPressed: () {},
                              buttonText: LocaleKeys.share.tr(),
                              icon: Icon(Icons.share_outlined, size: 22),
                            ),
                          ],
                        ),
                        Divider(height: defaultPadding * 3),
                        channelAsyncValue.when(
                          loading: () => const SizedBox(),
                          error: (_, __) => const SizedBox(),
                          data: (channel) {
                            final chItem = channel.items[0];
                            return Row(
                              children: [
                                Avatar(
                                  radius: 18,
                                  photoUrl: chItem.snippet.thumbnails
                                          .thumbnailsDefault?.url ??
                                      chItem.snippet.thumbnails.medium?.url ??
                                      chItem.snippet.thumbnails.high!.url,
                                ),
                                SizedBox(width: defaultPadding),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.snippet.videoOwnerChannelTitle),
                                    Text(
                                        '${chItem.statistics.subscriberCount} 명',
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                        Divider(height: defaultPadding * 3),
                        SelectableText(item.snippet.description),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlayerIconButton extends StatelessWidget {
  const PlayerIconButton({
    Key? key,
    required this.icon,
    required this.buttonText,
    required this.onPressed,
  }) : super(key: key);

  final Widget icon;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          constraints: BoxConstraints.tight(Size(26, 33)),
          padding: const EdgeInsets.all(0),
          onPressed: onPressed,
          icon: icon,
        ),
        Text(
          buttonText,
          style: TextStyle(fontSize: 11),
        ),
      ],
    );
  }
}
