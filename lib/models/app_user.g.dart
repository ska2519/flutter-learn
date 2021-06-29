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
    deletedUser: json['deletedUser'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'photoURL': instance.photoURL,
      'displayName': instance.displayName,
      'deletedUser': instance.deletedUser,
    };
