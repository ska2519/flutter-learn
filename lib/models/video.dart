import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.g.dart';
part 'video.freezed.dart';

@freezed
class Video with _$Video {
  const factory Video({
    required String id,
    required String title,
    required String thumbnail,
    required String channelTitle,
    required String channelUrl,
    required String channelThumbnail,
    required Set<String> tags,
    @Default(0) int level,
    @Default(0) int likedCount,
    @Default(0) int watchCount,
    @Default(0) int commentCount,
  }) = _Video;

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
}
