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
    String? imageUrl,
  }) = _Tag;

  factory Tag.fromJson(Map<String, dynamic> json) => _customFromJson(json);

  static Tag _customFromJson(Map<String, dynamic> json) {
    json['level'] =
        json['level'] is double ? json['level'].toInt() : json['level'];
    json['postCount'] = json['postCount'] is double
        ? json['postCount'].toInt()
        : json['postCount'];
    json['videoCount'] = json['videoCount'] is double
        ? json['videoCount'].toInt()
        : json['videoCount'];
    return _$TagFromJson(json);
  }
}
