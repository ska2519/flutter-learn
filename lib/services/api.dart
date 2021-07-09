import 'package:flutter_learn/secret_keys.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const testPlaylistId = 'PLp9pRDdwPnsi0jv1HJFDx09bdoDxFxJUU';
const skaPlaylistId = 'PLwvWMf2xbLQGhm5ZDBAPRcKsKuP854f7G';

final apiProvider = Provider<API>((ref) => API());

class API {
  static const String youTubePath = 'https://www.googleapis.com/youtube/v3/';

  String get playlistItemsPath => '${youTubePath}playlistItems';
  String get channelPath => '${youTubePath}channels';
  String get videoPath => '${youTubePath}videos';

  static const playlistItemsPart = 'id,snippet,contentDetails,status';
  static const channelPart = 'snippet, brandingSettings, statistics';
  static const videoPart =
      'snippet, contentDetails, player, statistics, status';

  Map<String, dynamic> playlistItemsParam(
          {required String playListId, String? pageToken}) =>
      {
        'playlistId': playListId,
        'key': youTubeAPIAndroidKey,
        'part': playlistItemsPart,
        'pageToken': pageToken,
      };

  Map<String, dynamic> channelParam({required String channelId}) => {
        'id': channelId,
        'key': youTubeAPIAndroidKey,
        'part': channelPart,
      };

  Map<String, dynamic> videoParam({required String videoId}) => {
        'id': videoId,
        'key': youTubeAPIAndroidKey,
        'part': videoPart,
      };
}
