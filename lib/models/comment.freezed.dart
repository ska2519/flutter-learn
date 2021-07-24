// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
class _$CommentTearOff {
  const _$CommentTearOff();

  _Comment call(
      {required String id,
      required String text,
      required String postId,
      required String postTitle,
      required String userId,
      required String userDisplayName,
      String? userPhotoURL,
      required String postUserId,
      @TimestampConverter() DateTime? timestamp,
      int likedCount = 0,
      int level = 0,
      String? parentCmt = null,
      String? parentCmtUserId = null,
      String? parentCmtText = null,
      bool private = false,
      int childCount = 0}) {
    return _Comment(
      id: id,
      text: text,
      postId: postId,
      postTitle: postTitle,
      userId: userId,
      userDisplayName: userDisplayName,
      userPhotoURL: userPhotoURL,
      postUserId: postUserId,
      timestamp: timestamp,
      likedCount: likedCount,
      level: level,
      parentCmt: parentCmt,
      parentCmtUserId: parentCmtUserId,
      parentCmtText: parentCmtText,
      private: private,
      childCount: childCount,
    );
  }

  Comment fromJson(Map<String, Object> json) {
    return Comment.fromJson(json);
  }
}

/// @nodoc
const $Comment = _$CommentTearOff();

/// @nodoc
mixin _$Comment {
  String get id => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  String get postTitle => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userDisplayName => throw _privateConstructorUsedError;
  String? get userPhotoURL => throw _privateConstructorUsedError;
  String get postUserId => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get timestamp =>
      throw _privateConstructorUsedError; // @Default({}) Set<String> likedUsers,
  int get likedCount => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  String? get parentCmt => throw _privateConstructorUsedError;
  String? get parentCmtUserId => throw _privateConstructorUsedError;
  String? get parentCmtText => throw _privateConstructorUsedError;
  bool get private => throw _privateConstructorUsedError;
  int get childCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String text,
      String postId,
      String postTitle,
      String userId,
      String userDisplayName,
      String? userPhotoURL,
      String postUserId,
      @TimestampConverter() DateTime? timestamp,
      int likedCount,
      int level,
      String? parentCmt,
      String? parentCmtUserId,
      String? parentCmtText,
      bool private,
      int childCount});
}

/// @nodoc
class _$CommentCopyWithImpl<$Res> implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  final Comment _value;
  // ignore: unused_field
  final $Res Function(Comment) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? postId = freezed,
    Object? postTitle = freezed,
    Object? userId = freezed,
    Object? userDisplayName = freezed,
    Object? userPhotoURL = freezed,
    Object? postUserId = freezed,
    Object? timestamp = freezed,
    Object? likedCount = freezed,
    Object? level = freezed,
    Object? parentCmt = freezed,
    Object? parentCmtUserId = freezed,
    Object? parentCmtText = freezed,
    Object? private = freezed,
    Object? childCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      postTitle: postTitle == freezed
          ? _value.postTitle
          : postTitle // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userDisplayName: userDisplayName == freezed
          ? _value.userDisplayName
          : userDisplayName // ignore: cast_nullable_to_non_nullable
              as String,
      userPhotoURL: userPhotoURL == freezed
          ? _value.userPhotoURL
          : userPhotoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      postUserId: postUserId == freezed
          ? _value.postUserId
          : postUserId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      likedCount: likedCount == freezed
          ? _value.likedCount
          : likedCount // ignore: cast_nullable_to_non_nullable
              as int,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      parentCmt: parentCmt == freezed
          ? _value.parentCmt
          : parentCmt // ignore: cast_nullable_to_non_nullable
              as String?,
      parentCmtUserId: parentCmtUserId == freezed
          ? _value.parentCmtUserId
          : parentCmtUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      parentCmtText: parentCmtText == freezed
          ? _value.parentCmtText
          : parentCmtText // ignore: cast_nullable_to_non_nullable
              as String?,
      private: private == freezed
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as bool,
      childCount: childCount == freezed
          ? _value.childCount
          : childCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$CommentCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$CommentCopyWith(_Comment value, $Res Function(_Comment) then) =
      __$CommentCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String text,
      String postId,
      String postTitle,
      String userId,
      String userDisplayName,
      String? userPhotoURL,
      String postUserId,
      @TimestampConverter() DateTime? timestamp,
      int likedCount,
      int level,
      String? parentCmt,
      String? parentCmtUserId,
      String? parentCmtText,
      bool private,
      int childCount});
}

/// @nodoc
class __$CommentCopyWithImpl<$Res> extends _$CommentCopyWithImpl<$Res>
    implements _$CommentCopyWith<$Res> {
  __$CommentCopyWithImpl(_Comment _value, $Res Function(_Comment) _then)
      : super(_value, (v) => _then(v as _Comment));

  @override
  _Comment get _value => super._value as _Comment;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? postId = freezed,
    Object? postTitle = freezed,
    Object? userId = freezed,
    Object? userDisplayName = freezed,
    Object? userPhotoURL = freezed,
    Object? postUserId = freezed,
    Object? timestamp = freezed,
    Object? likedCount = freezed,
    Object? level = freezed,
    Object? parentCmt = freezed,
    Object? parentCmtUserId = freezed,
    Object? parentCmtText = freezed,
    Object? private = freezed,
    Object? childCount = freezed,
  }) {
    return _then(_Comment(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      postTitle: postTitle == freezed
          ? _value.postTitle
          : postTitle // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userDisplayName: userDisplayName == freezed
          ? _value.userDisplayName
          : userDisplayName // ignore: cast_nullable_to_non_nullable
              as String,
      userPhotoURL: userPhotoURL == freezed
          ? _value.userPhotoURL
          : userPhotoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      postUserId: postUserId == freezed
          ? _value.postUserId
          : postUserId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      likedCount: likedCount == freezed
          ? _value.likedCount
          : likedCount // ignore: cast_nullable_to_non_nullable
              as int,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      parentCmt: parentCmt == freezed
          ? _value.parentCmt
          : parentCmt // ignore: cast_nullable_to_non_nullable
              as String?,
      parentCmtUserId: parentCmtUserId == freezed
          ? _value.parentCmtUserId
          : parentCmtUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      parentCmtText: parentCmtText == freezed
          ? _value.parentCmtText
          : parentCmtText // ignore: cast_nullable_to_non_nullable
              as String?,
      private: private == freezed
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as bool,
      childCount: childCount == freezed
          ? _value.childCount
          : childCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Comment extends _Comment {
  const _$_Comment(
      {required this.id,
      required this.text,
      required this.postId,
      required this.postTitle,
      required this.userId,
      required this.userDisplayName,
      this.userPhotoURL,
      required this.postUserId,
      @TimestampConverter() this.timestamp,
      this.likedCount = 0,
      this.level = 0,
      this.parentCmt = null,
      this.parentCmtUserId = null,
      this.parentCmtText = null,
      this.private = false,
      this.childCount = 0})
      : super._();

  factory _$_Comment.fromJson(Map<String, dynamic> json) =>
      _$_$_CommentFromJson(json);

  @override
  final String id;
  @override
  final String text;
  @override
  final String postId;
  @override
  final String postTitle;
  @override
  final String userId;
  @override
  final String userDisplayName;
  @override
  final String? userPhotoURL;
  @override
  final String postUserId;
  @override
  @TimestampConverter()
  final DateTime? timestamp;
  @JsonKey(defaultValue: 0)
  @override // @Default({}) Set<String> likedUsers,
  final int likedCount;
  @JsonKey(defaultValue: 0)
  @override
  final int level;
  @JsonKey(defaultValue: null)
  @override
  final String? parentCmt;
  @JsonKey(defaultValue: null)
  @override
  final String? parentCmtUserId;
  @JsonKey(defaultValue: null)
  @override
  final String? parentCmtText;
  @JsonKey(defaultValue: false)
  @override
  final bool private;
  @JsonKey(defaultValue: 0)
  @override
  final int childCount;

  @override
  String toString() {
    return 'Comment(id: $id, text: $text, postId: $postId, postTitle: $postTitle, userId: $userId, userDisplayName: $userDisplayName, userPhotoURL: $userPhotoURL, postUserId: $postUserId, timestamp: $timestamp, likedCount: $likedCount, level: $level, parentCmt: $parentCmt, parentCmtUserId: $parentCmtUserId, parentCmtText: $parentCmtText, private: $private, childCount: $childCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Comment &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)) &&
            (identical(other.postId, postId) ||
                const DeepCollectionEquality().equals(other.postId, postId)) &&
            (identical(other.postTitle, postTitle) ||
                const DeepCollectionEquality()
                    .equals(other.postTitle, postTitle)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.userDisplayName, userDisplayName) ||
                const DeepCollectionEquality()
                    .equals(other.userDisplayName, userDisplayName)) &&
            (identical(other.userPhotoURL, userPhotoURL) ||
                const DeepCollectionEquality()
                    .equals(other.userPhotoURL, userPhotoURL)) &&
            (identical(other.postUserId, postUserId) ||
                const DeepCollectionEquality()
                    .equals(other.postUserId, postUserId)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.likedCount, likedCount) ||
                const DeepCollectionEquality()
                    .equals(other.likedCount, likedCount)) &&
            (identical(other.level, level) ||
                const DeepCollectionEquality().equals(other.level, level)) &&
            (identical(other.parentCmt, parentCmt) ||
                const DeepCollectionEquality()
                    .equals(other.parentCmt, parentCmt)) &&
            (identical(other.parentCmtUserId, parentCmtUserId) ||
                const DeepCollectionEquality()
                    .equals(other.parentCmtUserId, parentCmtUserId)) &&
            (identical(other.parentCmtText, parentCmtText) ||
                const DeepCollectionEquality()
                    .equals(other.parentCmtText, parentCmtText)) &&
            (identical(other.private, private) ||
                const DeepCollectionEquality()
                    .equals(other.private, private)) &&
            (identical(other.childCount, childCount) ||
                const DeepCollectionEquality()
                    .equals(other.childCount, childCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(text) ^
      const DeepCollectionEquality().hash(postId) ^
      const DeepCollectionEquality().hash(postTitle) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(userDisplayName) ^
      const DeepCollectionEquality().hash(userPhotoURL) ^
      const DeepCollectionEquality().hash(postUserId) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(likedCount) ^
      const DeepCollectionEquality().hash(level) ^
      const DeepCollectionEquality().hash(parentCmt) ^
      const DeepCollectionEquality().hash(parentCmtUserId) ^
      const DeepCollectionEquality().hash(parentCmtText) ^
      const DeepCollectionEquality().hash(private) ^
      const DeepCollectionEquality().hash(childCount);

  @JsonKey(ignore: true)
  @override
  _$CommentCopyWith<_Comment> get copyWith =>
      __$CommentCopyWithImpl<_Comment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CommentToJson(this);
  }
}

abstract class _Comment extends Comment {
  const factory _Comment(
      {required String id,
      required String text,
      required String postId,
      required String postTitle,
      required String userId,
      required String userDisplayName,
      String? userPhotoURL,
      required String postUserId,
      @TimestampConverter() DateTime? timestamp,
      int likedCount,
      int level,
      String? parentCmt,
      String? parentCmtUserId,
      String? parentCmtText,
      bool private,
      int childCount}) = _$_Comment;
  const _Comment._() : super._();

  factory _Comment.fromJson(Map<String, dynamic> json) = _$_Comment.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get text => throw _privateConstructorUsedError;
  @override
  String get postId => throw _privateConstructorUsedError;
  @override
  String get postTitle => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  String get userDisplayName => throw _privateConstructorUsedError;
  @override
  String? get userPhotoURL => throw _privateConstructorUsedError;
  @override
  String get postUserId => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime? get timestamp => throw _privateConstructorUsedError;
  @override // @Default({}) Set<String> likedUsers,
  int get likedCount => throw _privateConstructorUsedError;
  @override
  int get level => throw _privateConstructorUsedError;
  @override
  String? get parentCmt => throw _privateConstructorUsedError;
  @override
  String? get parentCmtUserId => throw _privateConstructorUsedError;
  @override
  String? get parentCmtText => throw _privateConstructorUsedError;
  @override
  bool get private => throw _privateConstructorUsedError;
  @override
  int get childCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CommentCopyWith<_Comment> get copyWith =>
      throw _privateConstructorUsedError;
}
