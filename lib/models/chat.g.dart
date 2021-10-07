// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Chat _$_$_ChatFromJson(Map json) {
  return _$_Chat(
    id: json['id'] as String,
    userIds:
        (json['userIds'] as List<dynamic>).map((e) => e as String).toList(),
    lastMessage:
        Message.fromJson(Map<String, dynamic>.from(json['lastMessage'] as Map)),
    displayName: json['displayName'] as String?,
    photoURL: json['photoURL'] as String?,
  );
}

Map<String, dynamic> _$_$_ChatToJson(_$_Chat instance) => <String, dynamic>{
      'id': instance.id,
      'userIds': instance.userIds,
      'lastMessage': instance.lastMessage.toJson(),
      'displayName': instance.displayName,
      'photoURL': instance.photoURL,
    };

_$_Message _$_$_MessageFromJson(Map json) {
  return _$_Message(
    content: json['content'] as String?,
    idFrom: json['idFrom'] as String?,
    idTo: json['idTo'] as String?,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    read: json['read'] as bool? ?? false,
    documentID: json['documentID'] as String?,
  );
}

Map<String, dynamic> _$_$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'content': instance.content,
      'idFrom': instance.idFrom,
      'idTo': instance.idTo,
      'timestamp': instance.timestamp?.toIso8601String(),
      'read': instance.read,
      'documentID': instance.documentID,
    };
