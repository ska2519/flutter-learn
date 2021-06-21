// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'read_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReadPost _$ReadPostFromJson(Map<String, dynamic> json) {
  return _ReadPost.fromJson(json);
}

/// @nodoc
class _$ReadPostTearOff {
  const _$ReadPostTearOff();

  _ReadPost call(
      {required String postId,
      required String userId,
      @TimestampConverter() DateTime? timestamp}) {
    return _ReadPost(
      postId: postId,
      userId: userId,
      timestamp: timestamp,
    );
  }

  ReadPost fromJson(Map<String, Object> json) {
    return ReadPost.fromJson(json);
  }
}

/// @nodoc
const $ReadPost = _$ReadPostTearOff();

/// @nodoc
mixin _$ReadPost {
  String get postId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReadPostCopyWith<ReadPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadPostCopyWith<$Res> {
  factory $ReadPostCopyWith(ReadPost value, $Res Function(ReadPost) then) =
      _$ReadPostCopyWithImpl<$Res>;
  $Res call(
      {String postId,
      String userId,
      @TimestampConverter() DateTime? timestamp});
}

/// @nodoc
class _$ReadPostCopyWithImpl<$Res> implements $ReadPostCopyWith<$Res> {
  _$ReadPostCopyWithImpl(this._value, this._then);

  final ReadPost _value;
  // ignore: unused_field
  final $Res Function(ReadPost) _then;

  @override
  $Res call({
    Object? postId = freezed,
    Object? userId = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$ReadPostCopyWith<$Res> implements $ReadPostCopyWith<$Res> {
  factory _$ReadPostCopyWith(_ReadPost value, $Res Function(_ReadPost) then) =
      __$ReadPostCopyWithImpl<$Res>;
  @override
  $Res call(
      {String postId,
      String userId,
      @TimestampConverter() DateTime? timestamp});
}

/// @nodoc
class __$ReadPostCopyWithImpl<$Res> extends _$ReadPostCopyWithImpl<$Res>
    implements _$ReadPostCopyWith<$Res> {
  __$ReadPostCopyWithImpl(_ReadPost _value, $Res Function(_ReadPost) _then)
      : super(_value, (v) => _then(v as _ReadPost));

  @override
  _ReadPost get _value => super._value as _ReadPost;

  @override
  $Res call({
    Object? postId = freezed,
    Object? userId = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_ReadPost(
      postId: postId == freezed
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReadPost implements _ReadPost {
  const _$_ReadPost(
      {required this.postId,
      required this.userId,
      @TimestampConverter() this.timestamp});

  factory _$_ReadPost.fromJson(Map<String, dynamic> json) =>
      _$_$_ReadPostFromJson(json);

  @override
  final String postId;
  @override
  final String userId;
  @override
  @TimestampConverter()
  final DateTime? timestamp;

  @override
  String toString() {
    return 'ReadPost(postId: $postId, userId: $userId, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReadPost &&
            (identical(other.postId, postId) ||
                const DeepCollectionEquality().equals(other.postId, postId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(postId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(timestamp);

  @JsonKey(ignore: true)
  @override
  _$ReadPostCopyWith<_ReadPost> get copyWith =>
      __$ReadPostCopyWithImpl<_ReadPost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ReadPostToJson(this);
  }
}

abstract class _ReadPost implements ReadPost {
  const factory _ReadPost(
      {required String postId,
      required String userId,
      @TimestampConverter() DateTime? timestamp}) = _$_ReadPost;

  factory _ReadPost.fromJson(Map<String, dynamic> json) = _$_ReadPost.fromJson;

  @override
  String get postId => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime? get timestamp => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ReadPostCopyWith<_ReadPost> get copyWith =>
      throw _privateConstructorUsedError;
}
