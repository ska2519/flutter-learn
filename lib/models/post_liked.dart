import 'package:freezed_annotation/freezed_annotation.dart';

import 'timestamp_converter.dart';

part 'post_liked.freezed.dart';
part 'post_liked.g.dart';

@freezed
class PostLiked with _$PostLiked {
  const factory PostLiked({
    required String userId,
    required String userDisplayName,
    required String postId,
    required String postUserId,
    required String postTitle,
    @TimestampConverter() DateTime? timestamp,
  }) = _PostLiked;

  factory PostLiked.fromJson(Map<String, dynamic> json) =>
      _$PostLikedFromJson(json);
}
