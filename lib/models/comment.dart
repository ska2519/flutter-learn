import 'package:flutter_learn/models/timestamp_converter.dart';
import 'package:flutter_learn/models/values.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.g.dart';
part 'comment.freezed.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    String? id,
    //Parent? parent,
    required String text,
    required String postId,
    required String userId,
    @TimestampConverter() DateTime? timestamp,
    String? parent,
    int? level,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  factory Comment.random(String postId) {
    return _$_Comment(
      // id: getRandomCommentId(),
      text: getRandomContent(),
      postId: postId,
      userId: getRandomUserIds(),
      timestamp: getRandomTimestamp(),
    );
  }
}
