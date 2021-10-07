import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.g.dart';
part 'chat.freezed.dart';

@freezed
class Chat with _$Chat {
  const factory Chat({
    required String id,
    required List<String> userIds,
    required Message lastMessage,
    String? displayName,
    String? photoURL,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}

@freezed
class Message with _$Message {
  const factory Message({
    String? content,
    String? idFrom,
    String? idTo,
    DateTime? timestamp,
    @Default(false) bool read,
    String? documentID,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
