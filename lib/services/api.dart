import 'package:flutter_learn/secret_keys.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const testPlaylistId = 'PLp9pRDdwPnsi0jv1HJFDx09bdoDxFxJUU';
const skaPlaylistId = 'PLwvWMf2xbLQGhm5ZDBAPRcKsKuP854f7G';

final apiProvider = Provider<API>((ref) => API());

class API {
  static const String youTubePath = 'https://www.googleapis.com/youtube/v3/';

  String get playlistItemsPath => '${youTubePath}playlistItems';
  static const playlistItemsListPart = 'id,snippet,contentDetails,status';

  Map<String, dynamic> playlistItemsParam({
    required String playListId,
    String? pageToken,
  }) =>
      {
        'playlistId': playListId,
        'key': youTubeAPIAndroidKey,
        'part': playlistItemsListPart,
        'pageToken': pageToken,
      };
}
