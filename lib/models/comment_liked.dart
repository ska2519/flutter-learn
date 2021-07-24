import 'package:freezed_annotation/freezed_annotation.dart';

import 'timestamp_converter.dart';

part 'comment_liked.freezed.dart';
part 'comment_liked.g.dart';

@freezed
class CommentLiked with _$CommentLiked {
  const factory CommentLiked({
    required String userId,
    required String userDisplayName,
    required String commentId,
    required String commentUserId,
    required String commentText,
    required String postId,
    required String postUserId,
    @TimestampConverter() DateTime? timestamp,
  }) = _CommentLiked;

  factory CommentLiked.fromJson(Map<String, dynamic> json) =>
      _$CommentLikedFromJson(json);
}
