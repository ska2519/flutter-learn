import 'package:flutter_learn/models/youtube_playlist_items.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'api.dart';
import 'api_service.dart';

final youTubeServiceProvider = Provider<YouTubeService>((ref) {
  final apiService = ref.read(apiServiceProvider);
  final api = ref.read(apiProvider);
  return YouTubeService(apiService, api);
});

class YouTubeService {
  YouTubeService(this.apiService, this.api);
  final APIService apiService;
  final API api;

  Future<PlaylistItems> fetchPlaylistItemsList(
      {required String playListId, String? pageToken}) async {
    final playlistItemsData = await apiService.getData(
      api.playlistItemsPath,
      params: api.playlistItemsParam(
        playListId: playListId,
        pageToken: pageToken,
      ),
    );
    final playlistItems =
        PlaylistItems.fromJson(playlistItemsData as Map<String, dynamic>);

    // playlistItems.items.map((e) {
    //   if (e.status.privacyStatus != 'public') {
    //     playlistItems.items.removeAt(playlistItems.items.indexOf(e));
    //   }
    // }).toList();

    return playlistItems;
  }
}
