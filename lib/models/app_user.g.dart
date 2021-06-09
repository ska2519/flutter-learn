// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$_$_AppUserFromJson(Map json) {
  return _$_AppUser(
    id: json['id'] as String?,
    email: json['email'] as String?,
    photoURL: json['photoURL'] as String?,
    displayName: json['displayName'] as String?,
    loginTimestamp: json['loginTimestamp'] == null
        ? null
        : DateTime.parse(json['loginTimestamp'] as String),
  );
}

Map<String, dynamic> _$_$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'photoURL': instance.photoURL,
      'displayName': instance.displayName,
      'loginTimestamp': instance.loginTimestamp?.toIso8601String(),
    };
