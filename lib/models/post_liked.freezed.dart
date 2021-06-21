// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'post_liked.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostLiked _$PostLikedFromJson(Map<String, dynamic> json) {
  return _PostLiked.fromJson(json);
}

/// @nodoc
class _$PostLikedTearOff {
  const _$PostLikedTearOff();

  _PostLiked call(
      {required String postId,
      required String userId,
      @TimestampConverter() DateTime? timestamp}) {
    return _PostLiked(
      postId: postId,
      userId: userId,
      timestamp: timestamp,
    );
  }

  PostLiked fromJson(Map<String, Object> json) {
    return PostLiked.fromJson(json);
  }
}

/// @nodoc
const $PostLiked = _$PostLikedTearOff();

/// @nodoc
mixin _$PostLiked {
  String get postId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostLikedCopyWith<PostLiked> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostLikedCopyWith<$Res> {
  factory $PostLikedCopyWith(PostLiked value, $Res Function(PostLiked) then) =
      _$PostLikedCopyWithImpl<$Res>;
  $Res call(
      {String postId,
      String userId,
      @TimestampConverter() DateTime? timestamp});
}

/// @nodoc
class _$PostLikedCopyWithImpl<$Res> implements $PostLikedCopyWith<$Res> {
  _$PostLikedCopyWithImpl(this._value, this._then);

  final PostLiked _value;
  // ignore: unused_field
  final $Res Function(PostLiked) _then;

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
abstract class _$PostLikedCopyWith<$Res> implements $PostLikedCopyWith<$Res> {
  factory _$PostLikedCopyWith(
          _PostLiked value, $Res Function(_PostLiked) then) =
      __$PostLikedCopyWithImpl<$Res>;
  @override
  $Res call(
      {String postId,
      String userId,
      @TimestampConverter() DateTime? timestamp});
}

/// @nodoc
class __$PostLikedCopyWithImpl<$Res> extends _$PostLikedCopyWithImpl<$Res>
    implements _$PostLikedCopyWith<$Res> {
  __$PostLikedCopyWithImpl(_PostLiked _value, $Res Function(_PostLiked) _then)
      : super(_value, (v) => _then(v as _PostLiked));

  @override
  _PostLiked get _value => super._value as _PostLiked;

  @override
  $Res call({
    Object? postId = freezed,
    Object? userId = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_PostLiked(
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
class _$_PostLiked implements _PostLiked {
  const _$_PostLiked(
      {required this.postId,
      required this.userId,
      @TimestampConverter() this.timestamp});

  factory _$_PostLiked.fromJson(Map<String, dynamic> json) =>
      _$_$_PostLikedFromJson(json);

  @override
  final String postId;
  @override
  final String userId;
  @override
  @TimestampConverter()
  final DateTime? timestamp;

  @override
  String toString() {
    return 'PostLiked(postId: $postId, userId: $userId, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PostLiked &&
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
  _$PostLikedCopyWith<_PostLiked> get copyWith =>
      __$PostLikedCopyWithImpl<_PostLiked>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PostLikedToJson(this);
  }
}

abstract class _PostLiked implements PostLiked {
  const factory _PostLiked(
      {required String postId,
      required String userId,
      @TimestampConverter() DateTime? timestamp}) = _$_PostLiked;

  factory _PostLiked.fromJson(Map<String, dynamic> json) =
      _$_PostLiked.fromJson;

  @override
  String get postId => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime? get timestamp => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostLikedCopyWith<_PostLiked> get copyWith =>
      throw _privateConstructorUsedError;
}
