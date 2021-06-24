import 'package:flutter_learn/models/timestamp_converter.dart';
import 'package:flutter_learn/models/values.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_user.dart';

part 'comment.g.dart';
part 'comment.freezed.dart';

@freezed
class Comment with _$Comment {
  const Comment._();
  const factory Comment({
    String? id,
    //Parent? parent,
    required String text,
    required String postId,
    required String userId,
    @TimestampConverter() DateTime? timestamp,
    @Default({}) Set<String> likedUsers,
    @Default(0) int? level,
    @Default('') String? parent,
  }) = _Comment;

  void likeComment(AppUser appUser) {
    if (likedUsers.contains(appUser.id)) {
      likedUsers.remove(appUser.id);
    } else {
      likedUsers.add(appUser.id!);
    }
  }

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
