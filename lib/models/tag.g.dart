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
    count: json['count'] as int? ?? 0,
    color: json['color'] as String?,
    image: json['image'] as String?,
    youTube: json['youTube'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_TagToJson(_$_Tag instance) => <String, dynamic>{
      'name': instance.name,
      'playlistId': instance.playlistId,
      'level': instance.level,
      'count': instance.count,
      'color': instance.color,
      'image': instance.image,
      'youTube': instance.youTube,
    };
