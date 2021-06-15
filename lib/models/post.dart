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
    @Default({}) Set usersLiked,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  void likePost(AppUser appUser) {
    if (usersLiked.contains(appUser.id)) {
      usersLiked.remove(appUser.id);
    } else {
      usersLiked.add(appUser.id);
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
  // factory Restaurant.random() {
  //   return Restaurant._(
  //     category: getRandomCategory(),
  //     city: getRandomCity(),
  //     name: getRandomName(),
  //     price: Random().nextInt(3) + 1,
  //     photo: getRandomPhoto(),
  //   );
  // }

  // Post.fromUserInput({
  //   required String userId,
  //   required String displayName,
  //   required String title,
  //   required String content,
  // });
  // : id = null,
  //       timestamp = null,
  //       reference = null;

}
