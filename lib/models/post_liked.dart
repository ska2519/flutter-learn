import 'package:freezed_annotation/freezed_annotation.dart';

import 'timestamp_converter.dart';

part 'post_liked.freezed.dart';
part 'post_liked.g.dart';

@freezed
class PostLiked with _$PostLiked {
  const factory PostLiked({
    required String postId,
    required String userId,
    @TimestampConverter() DateTime? timestamp,
  }) = _PostLiked;

  factory PostLiked.fromJson(Map<String, dynamic> json) =>
      _$PostLikedFromJson(json);

  // void likePost(AppUser appUser) {
  //   if (likedUsers.contains(appUser.id)) {
  //     likedUsers.remove(appUser.id);
  //   } else {
  //     likedUsers.add(appUser.id!);
  //   }
  // }
}
