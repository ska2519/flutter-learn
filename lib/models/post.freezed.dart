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
      {required String body,
      String? author,
      Set<dynamic> usersLiked = const {}}) {
    return _Post(
      body: body,
      author: author,
      usersLiked: usersLiked,
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
  String get body => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;
  Set<dynamic> get usersLiked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res>;
  $Res call({String body, String? author, Set<dynamic> usersLiked});
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  final Post _value;
  // ignore: unused_field
  final $Res Function(Post) _then;

  @override
  $Res call({
    Object? body = freezed,
    Object? author = freezed,
    Object? usersLiked = freezed,
  }) {
    return _then(_value.copyWith(
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      usersLiked: usersLiked == freezed
          ? _value.usersLiked
          : usersLiked // ignore: cast_nullable_to_non_nullable
              as Set<dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) then) =
      __$PostCopyWithImpl<$Res>;
  @override
  $Res call({String body, String? author, Set<dynamic> usersLiked});
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
    Object? body = freezed,
    Object? author = freezed,
    Object? usersLiked = freezed,
  }) {
    return _then(_Post(
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      author: author == freezed
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      usersLiked: usersLiked == freezed
          ? _value.usersLiked
          : usersLiked // ignore: cast_nullable_to_non_nullable
              as Set<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Post extends _Post {
  const _$_Post({required this.body, this.author, this.usersLiked = const {}})
      : super._();

  factory _$_Post.fromJson(Map<String, dynamic> json) =>
      _$_$_PostFromJson(json);

  @override
  final String body;
  @override
  final String? author;
  @JsonKey(defaultValue: const {})
  @override
  final Set<dynamic> usersLiked;

  @override
  String toString() {
    return 'Post(body: $body, author: $author, usersLiked: $usersLiked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Post &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.usersLiked, usersLiked) ||
                const DeepCollectionEquality()
                    .equals(other.usersLiked, usersLiked)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(usersLiked);

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
      {required String body,
      String? author,
      Set<dynamic> usersLiked}) = _$_Post;
  const _Post._() : super._();

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  String get body => throw _privateConstructorUsedError;
  @override
  String? get author => throw _privateConstructorUsedError;
  @override
  Set<dynamic> get usersLiked => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostCopyWith<_Post> get copyWith => throw _privateConstructorUsedError;
}
