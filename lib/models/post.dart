import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_learn/models/timestamp_converter.dart';
import 'package:flutter_learn/models/values.dart';

import 'app_user.dart';

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
    @Default(0) int commentCount,
    @TimestampConverter() DateTime? timestamp,
    @Default({}) Set likedUsers,
    @Default({}) Set readUsers,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  void likePost(AppUser appUser) {
    if (likedUsers.contains(appUser.id)) {
      likedUsers.remove(appUser.id);
    } else {
      likedUsers.add(appUser.id);
    }
  }

  factory Post.random() {
    return _$_Post(
      id: getRandomPostIds(),
      userId: getRandomUserIds(),
      displayName: getRandomDisplayName(),
      title: getRandomTitle(),
      content: getRandomContent(),
      timestamp: getRandomTimestamp(),
    );
  }
}
