import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.g.dart';
part 'tag.freezed.dart';

@freezed
class Tag with _$Tag {
  const factory Tag({
    required String name,
    String? playlistId,
    @Default(0) int level,
    @Default(0) int postCount,
    @Default(0) int videoCount,
    String? color,
    String? image,
    @Default(false) bool youTube,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}
