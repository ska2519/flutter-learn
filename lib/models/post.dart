import 'package:flutter_learn/models/timestamp_converter.dart';
import 'package:flutter_learn/models/values.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

//Timestamp _sendAtFromJson(Timestamp timestamp) => timestamp;

@freezed
class Post with _$Post {
  const Post._();
  const factory Post({
    required String id,
    required String userId,
    required String displayName,
    required String title,
    required String content,
    @TimestampConverter() DateTime? timestamp,
    @Default(0) int commentCount,
    @Default(0) int likedCount,
    @Default(0) int readCount,
    @Default(false) bool private,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  factory Post.random() {
    return _$_Post(
      id: getRandomIds(),
      userId: getRandomUserIds(),
      displayName: getRandomDisplayName(),
      title: getRandomTitle(),
      content: getRandomContent(),
      timestamp: getRandomTimestamp(),
    );
  }
}
