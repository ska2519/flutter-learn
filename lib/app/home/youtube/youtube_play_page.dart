import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/utils/format.dart';
import 'package:flutter_learn/app/widgets/avatar.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/youtube_channel.dart' as ch;
import 'package:flutter_learn/models/youtube_playlist_items.dart';
import 'package:flutter_learn/models/youtube_video.dart' as uv;
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/url_launcher.dart';
import 'package:flutter_learn/services/youtube_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import 'youtube_player.dart';

final channelProvider =
    FutureProvider.autoDispose.family<ch.Channel, Item>((ref, item) async {
  final youTubeService = ref.read(youTubeServiceProvider);
  return youTubeService.fetchYouTubeChannel(
      channelId: item.snippet.videoOwnerChannelId);
});
final youTubeVideoProvider =
    FutureProvider.autoDispose.family<uv.YouTubeVideo, Item>((ref, item) async {
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
    final channelAsyncValue = useProvider(channelProvider(item));
    final youTubeVideoAsyncValue = useProvider(youTubeVideoProvider(item));

    final _youTubeController = useState(YoutubePlayerController(
      initialVideoId: item.contentDetails.videoId,
      flags: YoutubePlayerFlags(
        captionLanguage: 'kr',
        controlsVisibleAtStart: true,
        forceHD: true,
      ),
    ));
    final videoUrl =
        'https://www.youtube.com/watch?v=${item.contentDetails.videoId}';

    return YoutubePlayerBuilder(
      onExitFullScreen: () =>
          SystemChrome.setPreferredOrientations(DeviceOrientation.values),
      player: youTubePlayer(_youTubeController, item),
      builder: (context, player) => Scaffold(
        appBar: AppBar(
          title: Text('tags'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              player,
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
                          '${LocaleKeys.views.tr()} ${stringWithComma(uvVideo.statistics.viewCount)}  •  ${DateFormat('yyyy. M. d').format(uvVideo.snippet.publishedAt)}',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        const SizedBox(height: defaultPadding * 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            PlayerIconButton(
                              onPressed: () => launchYouTube(videoUrl),
                              buttonText: uvVideo.statistics.likeCount,
                              icon: Icon(Icons.thumb_up_outlined, size: 22),
                            ),
                            PlayerIconButton(
                              onPressed: () => launchYouTube(videoUrl),
                              buttonText: uvVideo.statistics.dislikeCount,
                              icon: Icon(Icons.thumb_down_outlined, size: 22),
                            ),
                            PlayerIconButton(
                              onPressed: () {},
                              buttonText: LocaleKeys.save.tr(),
                              icon: Icon(Icons.archive_outlined, size: 22),
                            ),
                            PlayerIconButton(
                              onPressed: () => launchYouTube(videoUrl),
                              buttonText: LocaleKeys.share.tr(),
                              icon: Icon(Icons.share_outlined, size: 22),
                            ),
                          ],
                        ),
                        Divider(height: defaultPadding * 3),
                        channelAsyncValue.when(
                          loading: () => const SizedBox(),
                          error: (_, __) => const SizedBox(),
                          data: (channel) => ChannelInfo(channel: channel),
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

class ChannelInfo extends StatelessWidget {
  const ChannelInfo({
    Key? key,
    required this.channel,
  }) : super(key: key);
  final ch.Channel channel;

  @override
  Widget build(BuildContext context) {
    final chItem = channel.items[0];
    final channelUrl = 'https://www.youtube.com/channel/${chItem.id}';
    return Padding(
      padding: const EdgeInsets.only(right: defaultPadding),
      child: InkWell(
        onTap: () => launchYouTube(channelUrl),
        child: Row(
          children: [
            Avatar(
              radius: 18,
              photoUrl: chItem.snippet.thumbnails.thumbnailsDefault?.url ??
                  chItem.snippet.thumbnails.medium?.url ??
                  chItem.snippet.thumbnails.high!.url,
            ),
            SizedBox(width: defaultPadding),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(chItem.snippet.title),
                Text(
                  '${chItem.statistics.subscriberCount != null ? stringWithComma(chItem.statistics.subscriberCount!) : ''} ${LocaleKeys.subscribers.tr()}',
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
            Spacer(),
            Text(
              LocaleKeys.SUBSCRIBE.tr(),
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: subscribeColor),
            )
          ],
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
