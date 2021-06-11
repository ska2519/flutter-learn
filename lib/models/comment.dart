import 'package:flutter_learn/models/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.g.dart';
part 'comment.freezed.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String text,
    required String postId,
    required String userId,
    //@Default(<DateTime>{})
    @TimestampConverter() Set<DateTime>? timestamp,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
