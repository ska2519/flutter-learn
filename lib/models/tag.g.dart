// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tag _$_$_TagFromJson(Map json) {
  return _$_Tag(
    name: json['name'] as String,
    playlistId: json['playlistId'] as String?,
    level: json['level'] as int? ?? 0,
    postCount: json['postCount'] as int? ?? 0,
    videoCount: json['videoCount'] as int? ?? 0,
    color: json['color'] as String?,
    image: json['image'] as String?,
    youTube: json['youTube'] as bool? ?? false,
    imageUrl: json['imageUrl'] as String?,
  );
}

Map<String, dynamic> _$_$_TagToJson(_$_Tag instance) => <String, dynamic>{
      'name': instance.name,
      'playlistId': instance.playlistId,
      'level': instance.level,
      'postCount': instance.postCount,
      'videoCount': instance.videoCount,
      'color': instance.color,
      'image': instance.image,
      'youTube': instance.youTube,
      'imageUrl': instance.imageUrl,
    };
