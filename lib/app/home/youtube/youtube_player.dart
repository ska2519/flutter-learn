import 'package:flutter/material.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/youtube_playlist_items.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

YoutubePlayer youTubePlayer(
        ValueNotifier<YoutubePlayerController> _youTubeController, Item item) =>
    YoutubePlayer(
      // key: ObjectKey(_youTubeController),
      controller: _youTubeController.value,
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
            maxLines: 1,
          ),
        ),
      ],
    );
