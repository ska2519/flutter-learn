// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
class _$PostTearOff {
  const _$PostTearOff();

  _Post call(
      {required String id,
      required String userId,
      required String displayName,
      required String title,
      required String content,
      @TimestampConverter() DateTime? timestamp,
      int commentCount = 0,
      int likedCount = 0,
      int readCount = 0,
      bool private = false}) {
    return _Post(
      id: id,
      userId: userId,
      displayName: displayName,
      title: title,
      content: content,
      timestamp: timestamp,
      commentCount: commentCount,
      likedCount: likedCount,
      readCount: readCount,
      private: private,
    );
  }

  Post fromJson(Map<String, Object> json) {
    return Post.fromJson(json);
  }
}

/// @nodoc
const $Post = _$PostTearOff();

/// @nodoc
mixin _$Post {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get timestamp => throw _privateConstructorUsedError;
  int get commentCount => throw _privateConstructorUsedError;
  int get likedCount => throw _privateConstructorUsedError;
  int get readCount => throw _privateConstructorUsedError;
  bool get private => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String userId,
      String displayName,
      String title,
      String content,
      @TimestampConverter() DateTime? timestamp,
      int commentCount,
      int likedCount,
      int readCount,
      bool private});
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  final Post _value;
  // ignore: unused_field
  final $Res Function(Post) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? displayName = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? timestamp = freezed,
    Object? commentCount = freezed,
    Object? likedCount = freezed,
    Object? readCount = freezed,
    Object? private = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      commentCount: commentCount == freezed
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      likedCount: likedCount == freezed
          ? _value.likedCount
          : likedCount // ignore: cast_nullable_to_non_nullable
              as int,
      readCount: readCount == freezed
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int,
      private: private == freezed
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) then) =
      __$PostCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String userId,
      String displayName,
      String title,
      String content,
      @TimestampConverter() DateTime? timestamp,
      int commentCount,
      int likedCount,
      int readCount,
      bool private});
}

/// @nodoc
class __$PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(_Post _value, $Res Function(_Post) _then)
      : super(_value, (v) => _then(v as _Post));

  @override
  _Post get _value => super._value as _Post;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? displayName = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? timestamp = freezed,
    Object? commentCount = freezed,
    Object? likedCount = freezed,
    Object? readCount = freezed,
    Object? private = freezed,
  }) {
    return _then(_Post(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      commentCount: commentCount == freezed
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      likedCount: likedCount == freezed
          ? _value.likedCount
          : likedCount // ignore: cast_nullable_to_non_nullable
              as int,
      readCount: readCount == freezed
          ? _value.readCount
          : readCount // ignore: cast_nullable_to_non_nullable
              as int,
      private: private == freezed
          ? _value.private
          : private // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Post extends _Post {
  const _$_Post(
      {required this.id,
      required this.userId,
      required this.displayName,
      required this.title,
      required this.content,
      @TimestampConverter() this.timestamp,
      this.commentCount = 0,
      this.likedCount = 0,
      this.readCount = 0,
      this.private = false})
      : super._();

  factory _$_Post.fromJson(Map<String, dynamic> json) =>
      _$_$_PostFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String displayName;
  @override
  final String title;
  @override
  final String content;
  @override
  @TimestampConverter()
  final DateTime? timestamp;
  @JsonKey(defaultValue: 0)
  @override
  final int commentCount;
  @JsonKey(defaultValue: 0)
  @override
  final int likedCount;
  @JsonKey(defaultValue: 0)
  @override
  final int readCount;
  @JsonKey(defaultValue: false)
  @override
  final bool private;

  @override
  String toString() {
    return 'Post(id: $id, userId: $userId, displayName: $displayName, title: $title, content: $content, timestamp: $timestamp, commentCount: $commentCount, likedCount: $likedCount, readCount: $readCount, private: $private)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Post &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.commentCount, commentCount) ||
                const DeepCollectionEquality()
                    .equals(other.commentCount, commentCount)) &&
            (identical(other.likedCount, likedCount) ||
                const DeepCollectionEquality()
                    .equals(other.likedCount, likedCount)) &&
            (identical(other.readCount, readCount) ||
                const DeepCollectionEquality()
                    .equals(other.readCount, readCount)) &&
            (identical(other.private, private) ||
                const DeepCollectionEquality().equals(other.private, private)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(commentCount) ^
      const DeepCollectionEquality().hash(likedCount) ^
      const DeepCollectionEquality().hash(readCount) ^
      const DeepCollectionEquality().hash(private);

  @JsonKey(ignore: true)
  @override
  _$PostCopyWith<_Post> get copyWith =>
      __$PostCopyWithImpl<_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PostToJson(this);
  }
}

abstract class _Post extends Post {
  const factory _Post(
      {required String id,
      required String userId,
      required String displayName,
      required String title,
      required String content,
      @TimestampConverter() DateTime? timestamp,
      int commentCount,
      int likedCount,
      int readCount,
      bool private}) = _$_Post;
  const _Post._() : super._();

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  String get displayName => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get content => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime? get timestamp => throw _privateConstructorUsedError;
  @override
  int get commentCount => throw _privateConstructorUsedError;
  @override
  int get likedCount => throw _privateConstructorUsedError;
  @override
  int get readCount => throw _privateConstructorUsedError;
  @override
  bool get private => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostCopyWith<_Post> get copyWith => throw _privateConstructorUsedError;
}
