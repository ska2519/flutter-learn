// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return _Chat.fromJson(json);
}

/// @nodoc
class _$ChatTearOff {
  const _$ChatTearOff();

  _Chat call(
      {required String id,
      required List<String> userIds,
      required Message lastMessage,
      String? displayName,
      String? photoURL}) {
    return _Chat(
      id: id,
      userIds: userIds,
      lastMessage: lastMessage,
      displayName: displayName,
      photoURL: photoURL,
    );
  }

  Chat fromJson(Map<String, Object> json) {
    return Chat.fromJson(json);
  }
}

/// @nodoc
const $Chat = _$ChatTearOff();

/// @nodoc
mixin _$Chat {
  String get id => throw _privateConstructorUsedError;
  List<String> get userIds => throw _privateConstructorUsedError;
  Message get lastMessage => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get photoURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCopyWith<Chat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) then) =
      _$ChatCopyWithImpl<$Res>;
  $Res call(
      {String id,
      List<String> userIds,
      Message lastMessage,
      String? displayName,
      String? photoURL});

  $MessageCopyWith<$Res> get lastMessage;
}

/// @nodoc
class _$ChatCopyWithImpl<$Res> implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._value, this._then);

  final Chat _value;
  // ignore: unused_field
  final $Res Function(Chat) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userIds = freezed,
    Object? lastMessage = freezed,
    Object? displayName = freezed,
    Object? photoURL = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userIds: userIds == freezed
          ? _value.userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastMessage: lastMessage == freezed
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as Message,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $MessageCopyWith<$Res> get lastMessage {
    return $MessageCopyWith<$Res>(_value.lastMessage, (value) {
      return _then(_value.copyWith(lastMessage: value));
    });
  }
}

/// @nodoc
abstract class _$ChatCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$ChatCopyWith(_Chat value, $Res Function(_Chat) then) =
      __$ChatCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      List<String> userIds,
      Message lastMessage,
      String? displayName,
      String? photoURL});

  @override
  $MessageCopyWith<$Res> get lastMessage;
}

/// @nodoc
class __$ChatCopyWithImpl<$Res> extends _$ChatCopyWithImpl<$Res>
    implements _$ChatCopyWith<$Res> {
  __$ChatCopyWithImpl(_Chat _value, $Res Function(_Chat) _then)
      : super(_value, (v) => _then(v as _Chat));

  @override
  _Chat get _value => super._value as _Chat;

  @override
  $Res call({
    Object? id = freezed,
    Object? userIds = freezed,
    Object? lastMessage = freezed,
    Object? displayName = freezed,
    Object? photoURL = freezed,
  }) {
    return _then(_Chat(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userIds: userIds == freezed
          ? _value.userIds
          : userIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      lastMessage: lastMessage == freezed
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as Message,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Chat implements _Chat {
  const _$_Chat(
      {required this.id,
      required this.userIds,
      required this.lastMessage,
      this.displayName,
      this.photoURL});

  factory _$_Chat.fromJson(Map<String, dynamic> json) =>
      _$_$_ChatFromJson(json);

  @override
  final String id;
  @override
  final List<String> userIds;
  @override
  final Message lastMessage;
  @override
  final String? displayName;
  @override
  final String? photoURL;

  @override
  String toString() {
    return 'Chat(id: $id, userIds: $userIds, lastMessage: $lastMessage, displayName: $displayName, photoURL: $photoURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Chat &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userIds, userIds) ||
                const DeepCollectionEquality()
                    .equals(other.userIds, userIds)) &&
            (identical(other.lastMessage, lastMessage) ||
                const DeepCollectionEquality()
                    .equals(other.lastMessage, lastMessage)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.photoURL, photoURL) ||
                const DeepCollectionEquality()
                    .equals(other.photoURL, photoURL)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userIds) ^
      const DeepCollectionEquality().hash(lastMessage) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(photoURL);

  @JsonKey(ignore: true)
  @override
  _$ChatCopyWith<_Chat> get copyWith =>
      __$ChatCopyWithImpl<_Chat>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ChatToJson(this);
  }
}

abstract class _Chat implements Chat {
  const factory _Chat(
      {required String id,
      required List<String> userIds,
      required Message lastMessage,
      String? displayName,
      String? photoURL}) = _$_Chat;

  factory _Chat.fromJson(Map<String, dynamic> json) = _$_Chat.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  List<String> get userIds => throw _privateConstructorUsedError;
  @override
  Message get lastMessage => throw _privateConstructorUsedError;
  @override
  String? get displayName => throw _privateConstructorUsedError;
  @override
  String? get photoURL => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ChatCopyWith<_Chat> get copyWith => throw _privateConstructorUsedError;
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
class _$MessageTearOff {
  const _$MessageTearOff();

  _Message call(
      {String? content,
      String? idFrom,
      String? idTo,
      DateTime? timestamp,
      bool read = false,
      String? documentID}) {
    return _Message(
      content: content,
      idFrom: idFrom,
      idTo: idTo,
      timestamp: timestamp,
      read: read,
      documentID: documentID,
    );
  }

  Message fromJson(Map<String, Object> json) {
    return Message.fromJson(json);
  }
}

/// @nodoc
const $Message = _$MessageTearOff();

/// @nodoc
mixin _$Message {
  String? get content => throw _privateConstructorUsedError;
  String? get idFrom => throw _privateConstructorUsedError;
  String? get idTo => throw _privateConstructorUsedError;
  DateTime? get timestamp => throw _privateConstructorUsedError;
  bool get read => throw _privateConstructorUsedError;
  String? get documentID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res>;
  $Res call(
      {String? content,
      String? idFrom,
      String? idTo,
      DateTime? timestamp,
      bool read,
      String? documentID});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res> implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  final Message _value;
  // ignore: unused_field
  final $Res Function(Message) _then;

  @override
  $Res call({
    Object? content = freezed,
    Object? idFrom = freezed,
    Object? idTo = freezed,
    Object? timestamp = freezed,
    Object? read = freezed,
    Object? documentID = freezed,
  }) {
    return _then(_value.copyWith(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      idFrom: idFrom == freezed
          ? _value.idFrom
          : idFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      idTo: idTo == freezed
          ? _value.idTo
          : idTo // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      read: read == freezed
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      documentID: documentID == freezed
          ? _value.documentID
          : documentID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) then) =
      __$MessageCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? content,
      String? idFrom,
      String? idTo,
      DateTime? timestamp,
      bool read,
      String? documentID});
}

/// @nodoc
class __$MessageCopyWithImpl<$Res> extends _$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(_Message _value, $Res Function(_Message) _then)
      : super(_value, (v) => _then(v as _Message));

  @override
  _Message get _value => super._value as _Message;

  @override
  $Res call({
    Object? content = freezed,
    Object? idFrom = freezed,
    Object? idTo = freezed,
    Object? timestamp = freezed,
    Object? read = freezed,
    Object? documentID = freezed,
  }) {
    return _then(_Message(
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      idFrom: idFrom == freezed
          ? _value.idFrom
          : idFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      idTo: idTo == freezed
          ? _value.idTo
          : idTo // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      read: read == freezed
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      documentID: documentID == freezed
          ? _value.documentID
          : documentID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Message implements _Message {
  const _$_Message(
      {this.content,
      this.idFrom,
      this.idTo,
      this.timestamp,
      this.read = false,
      this.documentID});

  factory _$_Message.fromJson(Map<String, dynamic> json) =>
      _$_$_MessageFromJson(json);

  @override
  final String? content;
  @override
  final String? idFrom;
  @override
  final String? idTo;
  @override
  final DateTime? timestamp;
  @JsonKey(defaultValue: false)
  @override
  final bool read;
  @override
  final String? documentID;

  @override
  String toString() {
    return 'Message(content: $content, idFrom: $idFrom, idTo: $idTo, timestamp: $timestamp, read: $read, documentID: $documentID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Message &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.idFrom, idFrom) ||
                const DeepCollectionEquality().equals(other.idFrom, idFrom)) &&
            (identical(other.idTo, idTo) ||
                const DeepCollectionEquality().equals(other.idTo, idTo)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.read, read) ||
                const DeepCollectionEquality().equals(other.read, read)) &&
            (identical(other.documentID, documentID) ||
                const DeepCollectionEquality()
                    .equals(other.documentID, documentID)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(idFrom) ^
      const DeepCollectionEquality().hash(idTo) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(read) ^
      const DeepCollectionEquality().hash(documentID);

  @JsonKey(ignore: true)
  @override
  _$MessageCopyWith<_Message> get copyWith =>
      __$MessageCopyWithImpl<_Message>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MessageToJson(this);
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {String? content,
      String? idFrom,
      String? idTo,
      DateTime? timestamp,
      bool read,
      String? documentID}) = _$_Message;

  factory _Message.fromJson(Map<String, dynamic> json) = _$_Message.fromJson;

  @override
  String? get content => throw _privateConstructorUsedError;
  @override
  String? get idFrom => throw _privateConstructorUsedError;
  @override
  String? get idTo => throw _privateConstructorUsedError;
  @override
  DateTime? get timestamp => throw _privateConstructorUsedError;
  @override
  bool get read => throw _privateConstructorUsedError;
  @override
  String? get documentID => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MessageCopyWith<_Message> get copyWith =>
      throw _privateConstructorUsedError;
}
