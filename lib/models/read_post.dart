import 'package:freezed_annotation/freezed_annotation.dart';

import 'timestamp_converter.dart';

part 'read_post.g.dart';
part 'read_post.freezed.dart';

@freezed
class ReadPost with _$ReadPost {
  const factory ReadPost({
    required String postId,
    required String userId,
    @TimestampConverter() DateTime? timestamp,
  }) = _ReadPost;

  factory ReadPost.fromJson(Map<String, dynamic> json) =>
      _$ReadPostFromJson(json);
}
