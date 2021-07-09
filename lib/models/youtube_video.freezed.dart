// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'youtube_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

YouTubeVideo _$YouTubeVideoFromJson(Map<String, dynamic> json) {
  return _YouTubeVideo.fromJson(json);
}

/// @nodoc
class _$YouTubeVideoTearOff {
  const _$YouTubeVideoTearOff();

  _YouTubeVideo call(
      {required String kind, required String etag, required List<Item> items}) {
    return _YouTubeVideo(
      kind: kind,
      etag: etag,
      items: items,
    );
  }

  YouTubeVideo fromJson(Map<String, Object> json) {
    return YouTubeVideo.fromJson(json);
  }
}

/// @nodoc
const $YouTubeVideo = _$YouTubeVideoTearOff();

/// @nodoc
mixin _$YouTubeVideo {
  String get kind => throw _privateConstructorUsedError;
  String get etag => throw _privateConstructorUsedError;
  List<Item> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $YouTubeVideoCopyWith<YouTubeVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YouTubeVideoCopyWith<$Res> {
  factory $YouTubeVideoCopyWith(
          YouTubeVideo value, $Res Function(YouTubeVideo) then) =
      _$YouTubeVideoCopyWithImpl<$Res>;
  $Res call({String kind, String etag, List<Item> items});
}

/// @nodoc
class _$YouTubeVideoCopyWithImpl<$Res> implements $YouTubeVideoCopyWith<$Res> {
  _$YouTubeVideoCopyWithImpl(this._value, this._then);

  final YouTubeVideo _value;
  // ignore: unused_field
  final $Res Function(YouTubeVideo) _then;

  @override
  $Res call({
    Object? kind = freezed,
    Object? etag = freezed,
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      kind: kind == freezed
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      etag: etag == freezed
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ));
  }
}

/// @nodoc
abstract class _$YouTubeVideoCopyWith<$Res>
    implements $YouTubeVideoCopyWith<$Res> {
  factory _$YouTubeVideoCopyWith(
          _YouTubeVideo value, $Res Function(_YouTubeVideo) then) =
      __$YouTubeVideoCopyWithImpl<$Res>;
  @override
  $Res call({String kind, String etag, List<Item> items});
}

/// @nodoc
class __$YouTubeVideoCopyWithImpl<$Res> extends _$YouTubeVideoCopyWithImpl<$Res>
    implements _$YouTubeVideoCopyWith<$Res> {
  __$YouTubeVideoCopyWithImpl(
      _YouTubeVideo _value, $Res Function(_YouTubeVideo) _then)
      : super(_value, (v) => _then(v as _YouTubeVideo));

  @override
  _YouTubeVideo get _value => super._value as _YouTubeVideo;

  @override
  $Res call({
    Object? kind = freezed,
    Object? etag = freezed,
    Object? items = freezed,
  }) {
    return _then(_YouTubeVideo(
      kind: kind == freezed
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      etag: etag == freezed
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_YouTubeVideo implements _YouTubeVideo {
  const _$_YouTubeVideo(
      {required this.kind, required this.etag, required this.items});

  factory _$_YouTubeVideo.fromJson(Map<String, dynamic> json) =>
      _$_$_YouTubeVideoFromJson(json);

  @override
  final String kind;
  @override
  final String etag;
  @override
  final List<Item> items;

  @override
  String toString() {
    return 'YouTubeVideo(kind: $kind, etag: $etag, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _YouTubeVideo &&
            (identical(other.kind, kind) ||
                const DeepCollectionEquality().equals(other.kind, kind)) &&
            (identical(other.etag, etag) ||
                const DeepCollectionEquality().equals(other.etag, etag)) &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(kind) ^
      const DeepCollectionEquality().hash(etag) ^
      const DeepCollectionEquality().hash(items);

  @JsonKey(ignore: true)
  @override
  _$YouTubeVideoCopyWith<_YouTubeVideo> get copyWith =>
      __$YouTubeVideoCopyWithImpl<_YouTubeVideo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_YouTubeVideoToJson(this);
  }
}

abstract class _YouTubeVideo implements YouTubeVideo {
  const factory _YouTubeVideo(
      {required String kind,
      required String etag,
      required List<Item> items}) = _$_YouTubeVideo;

  factory _YouTubeVideo.fromJson(Map<String, dynamic> json) =
      _$_YouTubeVideo.fromJson;

  @override
  String get kind => throw _privateConstructorUsedError;
  @override
  String get etag => throw _privateConstructorUsedError;
  @override
  List<Item> get items => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$YouTubeVideoCopyWith<_YouTubeVideo> get copyWith =>
      throw _privateConstructorUsedError;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

/// @nodoc
class _$ItemTearOff {
  const _$ItemTearOff();

  _Item call(
      {required String kind,
      required String etag,
      required String id,
      required Snippet snippet,
      required ContentDetails contentDetails,
      required Status status,
      required Statistics statistics}) {
    return _Item(
      kind: kind,
      etag: etag,
      id: id,
      snippet: snippet,
      contentDetails: contentDetails,
      status: status,
      statistics: statistics,
    );
  }

  Item fromJson(Map<String, Object> json) {
    return Item.fromJson(json);
  }
}

/// @nodoc
const $Item = _$ItemTearOff();

/// @nodoc
mixin _$Item {
  String get kind => throw _privateConstructorUsedError;
  String get etag => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  Snippet get snippet => throw _privateConstructorUsedError;
  ContentDetails get contentDetails => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  Statistics get statistics => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemCopyWith<Item> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call(
      {String kind,
      String etag,
      String id,
      Snippet snippet,
      ContentDetails contentDetails,
      Status status,
      Statistics statistics});

  $SnippetCopyWith<$Res> get snippet;
  $ContentDetailsCopyWith<$Res> get contentDetails;
  $StatusCopyWith<$Res> get status;
  $StatisticsCopyWith<$Res> get statistics;
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  final Item _value;
  // ignore: unused_field
  final $Res Function(Item) _then;

  @override
  $Res call({
    Object? kind = freezed,
    Object? etag = freezed,
    Object? id = freezed,
    Object? snippet = freezed,
    Object? contentDetails = freezed,
    Object? status = freezed,
    Object? statistics = freezed,
  }) {
    return _then(_value.copyWith(
      kind: kind == freezed
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      etag: etag == freezed
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      snippet: snippet == freezed
          ? _value.snippet
          : snippet // ignore: cast_nullable_to_non_nullable
              as Snippet,
      contentDetails: contentDetails == freezed
          ? _value.contentDetails
          : contentDetails // ignore: cast_nullable_to_non_nullable
              as ContentDetails,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      statistics: statistics == freezed
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as Statistics,
    ));
  }

  @override
  $SnippetCopyWith<$Res> get snippet {
    return $SnippetCopyWith<$Res>(_value.snippet, (value) {
      return _then(_value.copyWith(snippet: value));
    });
  }

  @override
  $ContentDetailsCopyWith<$Res> get contentDetails {
    return $ContentDetailsCopyWith<$Res>(_value.contentDetails, (value) {
      return _then(_value.copyWith(contentDetails: value));
    });
  }

  @override
  $StatusCopyWith<$Res> get status {
    return $StatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value));
    });
  }

  @override
  $StatisticsCopyWith<$Res> get statistics {
    return $StatisticsCopyWith<$Res>(_value.statistics, (value) {
      return _then(_value.copyWith(statistics: value));
    });
  }
}

/// @nodoc
abstract class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) then) =
      __$ItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String kind,
      String etag,
      String id,
      Snippet snippet,
      ContentDetails contentDetails,
      Status status,
      Statistics statistics});

  @override
  $SnippetCopyWith<$Res> get snippet;
  @override
  $ContentDetailsCopyWith<$Res> get contentDetails;
  @override
  $StatusCopyWith<$Res> get status;
  @override
  $StatisticsCopyWith<$Res> get statistics;
}

/// @nodoc
class __$ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res>
    implements _$ItemCopyWith<$Res> {
  __$ItemCopyWithImpl(_Item _value, $Res Function(_Item) _then)
      : super(_value, (v) => _then(v as _Item));

  @override
  _Item get _value => super._value as _Item;

  @override
  $Res call({
    Object? kind = freezed,
    Object? etag = freezed,
    Object? id = freezed,
    Object? snippet = freezed,
    Object? contentDetails = freezed,
    Object? status = freezed,
    Object? statistics = freezed,
  }) {
    return _then(_Item(
      kind: kind == freezed
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      etag: etag == freezed
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      snippet: snippet == freezed
          ? _value.snippet
          : snippet // ignore: cast_nullable_to_non_nullable
              as Snippet,
      contentDetails: contentDetails == freezed
          ? _value.contentDetails
          : contentDetails // ignore: cast_nullable_to_non_nullable
              as ContentDetails,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      statistics: statistics == freezed
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as Statistics,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Item implements _Item {
  const _$_Item(
      {required this.kind,
      required this.etag,
      required this.id,
      required this.snippet,
      required this.contentDetails,
      required this.status,
      required this.statistics});

  factory _$_Item.fromJson(Map<String, dynamic> json) =>
      _$_$_ItemFromJson(json);

  @override
  final String kind;
  @override
  final String etag;
  @override
  final String id;
  @override
  final Snippet snippet;
  @override
  final ContentDetails contentDetails;
  @override
  final Status status;
  @override
  final Statistics statistics;

  @override
  String toString() {
    return 'Item(kind: $kind, etag: $etag, id: $id, snippet: $snippet, contentDetails: $contentDetails, status: $status, statistics: $statistics)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Item &&
            (identical(other.kind, kind) ||
                const DeepCollectionEquality().equals(other.kind, kind)) &&
            (identical(other.etag, etag) ||
                const DeepCollectionEquality().equals(other.etag, etag)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.snippet, snippet) ||
                const DeepCollectionEquality()
                    .equals(other.snippet, snippet)) &&
            (identical(other.contentDetails, contentDetails) ||
                const DeepCollectionEquality()
                    .equals(other.contentDetails, contentDetails)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.statistics, statistics) ||
                const DeepCollectionEquality()
                    .equals(other.statistics, statistics)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(kind) ^
      const DeepCollectionEquality().hash(etag) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(snippet) ^
      const DeepCollectionEquality().hash(contentDetails) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(statistics);

  @JsonKey(ignore: true)
  @override
  _$ItemCopyWith<_Item> get copyWith =>
      __$ItemCopyWithImpl<_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ItemToJson(this);
  }
}

abstract class _Item implements Item {
  const factory _Item(
      {required String kind,
      required String etag,
      required String id,
      required Snippet snippet,
      required ContentDetails contentDetails,
      required Status status,
      required Statistics statistics}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  String get kind => throw _privateConstructorUsedError;
  @override
  String get etag => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  Snippet get snippet => throw _privateConstructorUsedError;
  @override
  ContentDetails get contentDetails => throw _privateConstructorUsedError;
  @override
  Status get status => throw _privateConstructorUsedError;
  @override
  Statistics get statistics => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ItemCopyWith<_Item> get copyWith => throw _privateConstructorUsedError;
}

ContentDetails _$ContentDetailsFromJson(Map<String, dynamic> json) {
  return _ContentDetails.fromJson(json);
}

/// @nodoc
class _$ContentDetailsTearOff {
  const _$ContentDetailsTearOff();

  _ContentDetails call(
      {required String duration,
      required String dimension,
      required String definition,
      required String caption,
      required bool licensedContent,
      required ContentRating contentRating,
      required String projection}) {
    return _ContentDetails(
      duration: duration,
      dimension: dimension,
      definition: definition,
      caption: caption,
      licensedContent: licensedContent,
      contentRating: contentRating,
      projection: projection,
    );
  }

  ContentDetails fromJson(Map<String, Object> json) {
    return ContentDetails.fromJson(json);
  }
}

/// @nodoc
const $ContentDetails = _$ContentDetailsTearOff();

/// @nodoc
mixin _$ContentDetails {
  String get duration => throw _privateConstructorUsedError;
  String get dimension => throw _privateConstructorUsedError;
  String get definition => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;
  bool get licensedContent => throw _privateConstructorUsedError;
  ContentRating get contentRating => throw _privateConstructorUsedError;
  String get projection => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentDetailsCopyWith<ContentDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentDetailsCopyWith<$Res> {
  factory $ContentDetailsCopyWith(
          ContentDetails value, $Res Function(ContentDetails) then) =
      _$ContentDetailsCopyWithImpl<$Res>;
  $Res call(
      {String duration,
      String dimension,
      String definition,
      String caption,
      bool licensedContent,
      ContentRating contentRating,
      String projection});

  $ContentRatingCopyWith<$Res> get contentRating;
}

/// @nodoc
class _$ContentDetailsCopyWithImpl<$Res>
    implements $ContentDetailsCopyWith<$Res> {
  _$ContentDetailsCopyWithImpl(this._value, this._then);

  final ContentDetails _value;
  // ignore: unused_field
  final $Res Function(ContentDetails) _then;

  @override
  $Res call({
    Object? duration = freezed,
    Object? dimension = freezed,
    Object? definition = freezed,
    Object? caption = freezed,
    Object? licensedContent = freezed,
    Object? contentRating = freezed,
    Object? projection = freezed,
  }) {
    return _then(_value.copyWith(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      dimension: dimension == freezed
          ? _value.dimension
          : dimension // ignore: cast_nullable_to_non_nullable
              as String,
      definition: definition == freezed
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String,
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      licensedContent: licensedContent == freezed
          ? _value.licensedContent
          : licensedContent // ignore: cast_nullable_to_non_nullable
              as bool,
      contentRating: contentRating == freezed
          ? _value.contentRating
          : contentRating // ignore: cast_nullable_to_non_nullable
              as ContentRating,
      projection: projection == freezed
          ? _value.projection
          : projection // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  $ContentRatingCopyWith<$Res> get contentRating {
    return $ContentRatingCopyWith<$Res>(_value.contentRating, (value) {
      return _then(_value.copyWith(contentRating: value));
    });
  }
}

/// @nodoc
abstract class _$ContentDetailsCopyWith<$Res>
    implements $ContentDetailsCopyWith<$Res> {
  factory _$ContentDetailsCopyWith(
          _ContentDetails value, $Res Function(_ContentDetails) then) =
      __$ContentDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String duration,
      String dimension,
      String definition,
      String caption,
      bool licensedContent,
      ContentRating contentRating,
      String projection});

  @override
  $ContentRatingCopyWith<$Res> get contentRating;
}

/// @nodoc
class __$ContentDetailsCopyWithImpl<$Res>
    extends _$ContentDetailsCopyWithImpl<$Res>
    implements _$ContentDetailsCopyWith<$Res> {
  __$ContentDetailsCopyWithImpl(
      _ContentDetails _value, $Res Function(_ContentDetails) _then)
      : super(_value, (v) => _then(v as _ContentDetails));

  @override
  _ContentDetails get _value => super._value as _ContentDetails;

  @override
  $Res call({
    Object? duration = freezed,
    Object? dimension = freezed,
    Object? definition = freezed,
    Object? caption = freezed,
    Object? licensedContent = freezed,
    Object? contentRating = freezed,
    Object? projection = freezed,
  }) {
    return _then(_ContentDetails(
      duration: duration == freezed
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
      dimension: dimension == freezed
          ? _value.dimension
          : dimension // ignore: cast_nullable_to_non_nullable
              as String,
      definition: definition == freezed
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as String,
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      licensedContent: licensedContent == freezed
          ? _value.licensedContent
          : licensedContent // ignore: cast_nullable_to_non_nullable
              as bool,
      contentRating: contentRating == freezed
          ? _value.contentRating
          : contentRating // ignore: cast_nullable_to_non_nullable
              as ContentRating,
      projection: projection == freezed
          ? _value.projection
          : projection // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContentDetails implements _ContentDetails {
  const _$_ContentDetails(
      {required this.duration,
      required this.dimension,
      required this.definition,
      required this.caption,
      required this.licensedContent,
      required this.contentRating,
      required this.projection});

  factory _$_ContentDetails.fromJson(Map<String, dynamic> json) =>
      _$_$_ContentDetailsFromJson(json);

  @override
  final String duration;
  @override
  final String dimension;
  @override
  final String definition;
  @override
  final String caption;
  @override
  final bool licensedContent;
  @override
  final ContentRating contentRating;
  @override
  final String projection;

  @override
  String toString() {
    return 'ContentDetails(duration: $duration, dimension: $dimension, definition: $definition, caption: $caption, licensedContent: $licensedContent, contentRating: $contentRating, projection: $projection)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ContentDetails &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.dimension, dimension) ||
                const DeepCollectionEquality()
                    .equals(other.dimension, dimension)) &&
            (identical(other.definition, definition) ||
                const DeepCollectionEquality()
                    .equals(other.definition, definition)) &&
            (identical(other.caption, caption) ||
                const DeepCollectionEquality()
                    .equals(other.caption, caption)) &&
            (identical(other.licensedContent, licensedContent) ||
                const DeepCollectionEquality()
                    .equals(other.licensedContent, licensedContent)) &&
            (identical(other.contentRating, contentRating) ||
                const DeepCollectionEquality()
                    .equals(other.contentRating, contentRating)) &&
            (identical(other.projection, projection) ||
                const DeepCollectionEquality()
                    .equals(other.projection, projection)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(dimension) ^
      const DeepCollectionEquality().hash(definition) ^
      const DeepCollectionEquality().hash(caption) ^
      const DeepCollectionEquality().hash(licensedContent) ^
      const DeepCollectionEquality().hash(contentRating) ^
      const DeepCollectionEquality().hash(projection);

  @JsonKey(ignore: true)
  @override
  _$ContentDetailsCopyWith<_ContentDetails> get copyWith =>
      __$ContentDetailsCopyWithImpl<_ContentDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ContentDetailsToJson(this);
  }
}

abstract class _ContentDetails implements ContentDetails {
  const factory _ContentDetails(
      {required String duration,
      required String dimension,
      required String definition,
      required String caption,
      required bool licensedContent,
      required ContentRating contentRating,
      required String projection}) = _$_ContentDetails;

  factory _ContentDetails.fromJson(Map<String, dynamic> json) =
      _$_ContentDetails.fromJson;

  @override
  String get duration => throw _privateConstructorUsedError;
  @override
  String get dimension => throw _privateConstructorUsedError;
  @override
  String get definition => throw _privateConstructorUsedError;
  @override
  String get caption => throw _privateConstructorUsedError;
  @override
  bool get licensedContent => throw _privateConstructorUsedError;
  @override
  ContentRating get contentRating => throw _privateConstructorUsedError;
  @override
  String get projection => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ContentDetailsCopyWith<_ContentDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

ContentRating _$ContentRatingFromJson(Map<String, dynamic> json) {
  return _ContentRating.fromJson(json);
}

/// @nodoc
class _$ContentRatingTearOff {
  const _$ContentRatingTearOff();

  _ContentRating call() {
    return const _ContentRating();
  }

  ContentRating fromJson(Map<String, Object> json) {
    return ContentRating.fromJson(json);
  }
}

/// @nodoc
const $ContentRating = _$ContentRatingTearOff();

/// @nodoc
mixin _$ContentRating {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentRatingCopyWith<$Res> {
  factory $ContentRatingCopyWith(
          ContentRating value, $Res Function(ContentRating) then) =
      _$ContentRatingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ContentRatingCopyWithImpl<$Res>
    implements $ContentRatingCopyWith<$Res> {
  _$ContentRatingCopyWithImpl(this._value, this._then);

  final ContentRating _value;
  // ignore: unused_field
  final $Res Function(ContentRating) _then;
}

/// @nodoc
abstract class _$ContentRatingCopyWith<$Res> {
  factory _$ContentRatingCopyWith(
          _ContentRating value, $Res Function(_ContentRating) then) =
      __$ContentRatingCopyWithImpl<$Res>;
}

/// @nodoc
class __$ContentRatingCopyWithImpl<$Res>
    extends _$ContentRatingCopyWithImpl<$Res>
    implements _$ContentRatingCopyWith<$Res> {
  __$ContentRatingCopyWithImpl(
      _ContentRating _value, $Res Function(_ContentRating) _then)
      : super(_value, (v) => _then(v as _ContentRating));

  @override
  _ContentRating get _value => super._value as _ContentRating;
}

/// @nodoc
@JsonSerializable()
class _$_ContentRating implements _ContentRating {
  const _$_ContentRating();

  factory _$_ContentRating.fromJson(Map<String, dynamic> json) =>
      _$_$_ContentRatingFromJson(json);

  @override
  String toString() {
    return 'ContentRating()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ContentRating);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ContentRatingToJson(this);
  }
}

abstract class _ContentRating implements ContentRating {
  const factory _ContentRating() = _$_ContentRating;

  factory _ContentRating.fromJson(Map<String, dynamic> json) =
      _$_ContentRating.fromJson;
}

Snippet _$SnippetFromJson(Map<String, dynamic> json) {
  return _Snippet.fromJson(json);
}

/// @nodoc
class _$SnippetTearOff {
  const _$SnippetTearOff();

  _Snippet call(
      {required DateTime publishedAt,
      required String channelId,
      required String title,
      required String description,
      required Thumbnails thumbnails,
      required String channelTitle,
      required String categoryId,
      required String liveBroadcastContent,
      required Localized localized,
      String? defaultAudioLanguage}) {
    return _Snippet(
      publishedAt: publishedAt,
      channelId: channelId,
      title: title,
      description: description,
      thumbnails: thumbnails,
      channelTitle: channelTitle,
      categoryId: categoryId,
      liveBroadcastContent: liveBroadcastContent,
      localized: localized,
      defaultAudioLanguage: defaultAudioLanguage,
    );
  }

  Snippet fromJson(Map<String, Object> json) {
    return Snippet.fromJson(json);
  }
}

/// @nodoc
const $Snippet = _$SnippetTearOff();

/// @nodoc
mixin _$Snippet {
  DateTime get publishedAt => throw _privateConstructorUsedError;
  String get channelId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  Thumbnails get thumbnails => throw _privateConstructorUsedError;
  String get channelTitle => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String get liveBroadcastContent => throw _privateConstructorUsedError;
  Localized get localized => throw _privateConstructorUsedError;
  String? get defaultAudioLanguage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SnippetCopyWith<Snippet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnippetCopyWith<$Res> {
  factory $SnippetCopyWith(Snippet value, $Res Function(Snippet) then) =
      _$SnippetCopyWithImpl<$Res>;
  $Res call(
      {DateTime publishedAt,
      String channelId,
      String title,
      String description,
      Thumbnails thumbnails,
      String channelTitle,
      String categoryId,
      String liveBroadcastContent,
      Localized localized,
      String? defaultAudioLanguage});

  $ThumbnailsCopyWith<$Res> get thumbnails;
  $LocalizedCopyWith<$Res> get localized;
}

/// @nodoc
class _$SnippetCopyWithImpl<$Res> implements $SnippetCopyWith<$Res> {
  _$SnippetCopyWithImpl(this._value, this._then);

  final Snippet _value;
  // ignore: unused_field
  final $Res Function(Snippet) _then;

  @override
  $Res call({
    Object? publishedAt = freezed,
    Object? channelId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? thumbnails = freezed,
    Object? channelTitle = freezed,
    Object? categoryId = freezed,
    Object? liveBroadcastContent = freezed,
    Object? localized = freezed,
    Object? defaultAudioLanguage = freezed,
  }) {
    return _then(_value.copyWith(
      publishedAt: publishedAt == freezed
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      channelId: channelId == freezed
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnails: thumbnails == freezed
          ? _value.thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as Thumbnails,
      channelTitle: channelTitle == freezed
          ? _value.channelTitle
          : channelTitle // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      liveBroadcastContent: liveBroadcastContent == freezed
          ? _value.liveBroadcastContent
          : liveBroadcastContent // ignore: cast_nullable_to_non_nullable
              as String,
      localized: localized == freezed
          ? _value.localized
          : localized // ignore: cast_nullable_to_non_nullable
              as Localized,
      defaultAudioLanguage: defaultAudioLanguage == freezed
          ? _value.defaultAudioLanguage
          : defaultAudioLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $ThumbnailsCopyWith<$Res> get thumbnails {
    return $ThumbnailsCopyWith<$Res>(_value.thumbnails, (value) {
      return _then(_value.copyWith(thumbnails: value));
    });
  }

  @override
  $LocalizedCopyWith<$Res> get localized {
    return $LocalizedCopyWith<$Res>(_value.localized, (value) {
      return _then(_value.copyWith(localized: value));
    });
  }
}

/// @nodoc
abstract class _$SnippetCopyWith<$Res> implements $SnippetCopyWith<$Res> {
  factory _$SnippetCopyWith(_Snippet value, $Res Function(_Snippet) then) =
      __$SnippetCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime publishedAt,
      String channelId,
      String title,
      String description,
      Thumbnails thumbnails,
      String channelTitle,
      String categoryId,
      String liveBroadcastContent,
      Localized localized,
      String? defaultAudioLanguage});

  @override
  $ThumbnailsCopyWith<$Res> get thumbnails;
  @override
  $LocalizedCopyWith<$Res> get localized;
}

/// @nodoc
class __$SnippetCopyWithImpl<$Res> extends _$SnippetCopyWithImpl<$Res>
    implements _$SnippetCopyWith<$Res> {
  __$SnippetCopyWithImpl(_Snippet _value, $Res Function(_Snippet) _then)
      : super(_value, (v) => _then(v as _Snippet));

  @override
  _Snippet get _value => super._value as _Snippet;

  @override
  $Res call({
    Object? publishedAt = freezed,
    Object? channelId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? thumbnails = freezed,
    Object? channelTitle = freezed,
    Object? categoryId = freezed,
    Object? liveBroadcastContent = freezed,
    Object? localized = freezed,
    Object? defaultAudioLanguage = freezed,
  }) {
    return _then(_Snippet(
      publishedAt: publishedAt == freezed
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      channelId: channelId == freezed
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnails: thumbnails == freezed
          ? _value.thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as Thumbnails,
      channelTitle: channelTitle == freezed
          ? _value.channelTitle
          : channelTitle // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: categoryId == freezed
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      liveBroadcastContent: liveBroadcastContent == freezed
          ? _value.liveBroadcastContent
          : liveBroadcastContent // ignore: cast_nullable_to_non_nullable
              as String,
      localized: localized == freezed
          ? _value.localized
          : localized // ignore: cast_nullable_to_non_nullable
              as Localized,
      defaultAudioLanguage: defaultAudioLanguage == freezed
          ? _value.defaultAudioLanguage
          : defaultAudioLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Snippet implements _Snippet {
  const _$_Snippet(
      {required this.publishedAt,
      required this.channelId,
      required this.title,
      required this.description,
      required this.thumbnails,
      required this.channelTitle,
      required this.categoryId,
      required this.liveBroadcastContent,
      required this.localized,
      this.defaultAudioLanguage});

  factory _$_Snippet.fromJson(Map<String, dynamic> json) =>
      _$_$_SnippetFromJson(json);

  @override
  final DateTime publishedAt;
  @override
  final String channelId;
  @override
  final String title;
  @override
  final String description;
  @override
  final Thumbnails thumbnails;
  @override
  final String channelTitle;
  @override
  final String categoryId;
  @override
  final String liveBroadcastContent;
  @override
  final Localized localized;
  @override
  final String? defaultAudioLanguage;

  @override
  String toString() {
    return 'Snippet(publishedAt: $publishedAt, channelId: $channelId, title: $title, description: $description, thumbnails: $thumbnails, channelTitle: $channelTitle, categoryId: $categoryId, liveBroadcastContent: $liveBroadcastContent, localized: $localized, defaultAudioLanguage: $defaultAudioLanguage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Snippet &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality()
                    .equals(other.publishedAt, publishedAt)) &&
            (identical(other.channelId, channelId) ||
                const DeepCollectionEquality()
                    .equals(other.channelId, channelId)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.thumbnails, thumbnails) ||
                const DeepCollectionEquality()
                    .equals(other.thumbnails, thumbnails)) &&
            (identical(other.channelTitle, channelTitle) ||
                const DeepCollectionEquality()
                    .equals(other.channelTitle, channelTitle)) &&
            (identical(other.categoryId, categoryId) ||
                const DeepCollectionEquality()
                    .equals(other.categoryId, categoryId)) &&
            (identical(other.liveBroadcastContent, liveBroadcastContent) ||
                const DeepCollectionEquality().equals(
                    other.liveBroadcastContent, liveBroadcastContent)) &&
            (identical(other.localized, localized) ||
                const DeepCollectionEquality()
                    .equals(other.localized, localized)) &&
            (identical(other.defaultAudioLanguage, defaultAudioLanguage) ||
                const DeepCollectionEquality()
                    .equals(other.defaultAudioLanguage, defaultAudioLanguage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(channelId) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(thumbnails) ^
      const DeepCollectionEquality().hash(channelTitle) ^
      const DeepCollectionEquality().hash(categoryId) ^
      const DeepCollectionEquality().hash(liveBroadcastContent) ^
      const DeepCollectionEquality().hash(localized) ^
      const DeepCollectionEquality().hash(defaultAudioLanguage);

  @JsonKey(ignore: true)
  @override
  _$SnippetCopyWith<_Snippet> get copyWith =>
      __$SnippetCopyWithImpl<_Snippet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SnippetToJson(this);
  }
}

abstract class _Snippet implements Snippet {
  const factory _Snippet(
      {required DateTime publishedAt,
      required String channelId,
      required String title,
      required String description,
      required Thumbnails thumbnails,
      required String channelTitle,
      required String categoryId,
      required String liveBroadcastContent,
      required Localized localized,
      String? defaultAudioLanguage}) = _$_Snippet;

  factory _Snippet.fromJson(Map<String, dynamic> json) = _$_Snippet.fromJson;

  @override
  DateTime get publishedAt => throw _privateConstructorUsedError;
  @override
  String get channelId => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  Thumbnails get thumbnails => throw _privateConstructorUsedError;
  @override
  String get channelTitle => throw _privateConstructorUsedError;
  @override
  String get categoryId => throw _privateConstructorUsedError;
  @override
  String get liveBroadcastContent => throw _privateConstructorUsedError;
  @override
  Localized get localized => throw _privateConstructorUsedError;
  @override
  String? get defaultAudioLanguage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SnippetCopyWith<_Snippet> get copyWith =>
      throw _privateConstructorUsedError;
}

Localized _$LocalizedFromJson(Map<String, dynamic> json) {
  return _Localized.fromJson(json);
}

/// @nodoc
class _$LocalizedTearOff {
  const _$LocalizedTearOff();

  _Localized call({required String title, required String description}) {
    return _Localized(
      title: title,
      description: description,
    );
  }

  Localized fromJson(Map<String, Object> json) {
    return Localized.fromJson(json);
  }
}

/// @nodoc
const $Localized = _$LocalizedTearOff();

/// @nodoc
mixin _$Localized {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocalizedCopyWith<Localized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizedCopyWith<$Res> {
  factory $LocalizedCopyWith(Localized value, $Res Function(Localized) then) =
      _$LocalizedCopyWithImpl<$Res>;
  $Res call({String title, String description});
}

/// @nodoc
class _$LocalizedCopyWithImpl<$Res> implements $LocalizedCopyWith<$Res> {
  _$LocalizedCopyWithImpl(this._value, this._then);

  final Localized _value;
  // ignore: unused_field
  final $Res Function(Localized) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LocalizedCopyWith<$Res> implements $LocalizedCopyWith<$Res> {
  factory _$LocalizedCopyWith(
          _Localized value, $Res Function(_Localized) then) =
      __$LocalizedCopyWithImpl<$Res>;
  @override
  $Res call({String title, String description});
}

/// @nodoc
class __$LocalizedCopyWithImpl<$Res> extends _$LocalizedCopyWithImpl<$Res>
    implements _$LocalizedCopyWith<$Res> {
  __$LocalizedCopyWithImpl(_Localized _value, $Res Function(_Localized) _then)
      : super(_value, (v) => _then(v as _Localized));

  @override
  _Localized get _value => super._value as _Localized;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_Localized(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Localized implements _Localized {
  const _$_Localized({required this.title, required this.description});

  factory _$_Localized.fromJson(Map<String, dynamic> json) =>
      _$_$_LocalizedFromJson(json);

  @override
  final String title;
  @override
  final String description;

  @override
  String toString() {
    return 'Localized(title: $title, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Localized &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  _$LocalizedCopyWith<_Localized> get copyWith =>
      __$LocalizedCopyWithImpl<_Localized>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LocalizedToJson(this);
  }
}

abstract class _Localized implements Localized {
  const factory _Localized(
      {required String title, required String description}) = _$_Localized;

  factory _Localized.fromJson(Map<String, dynamic> json) =
      _$_Localized.fromJson;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LocalizedCopyWith<_Localized> get copyWith =>
      throw _privateConstructorUsedError;
}

Thumbnails _$ThumbnailsFromJson(Map<String, dynamic> json) {
  return _Thumbnails.fromJson(json);
}

/// @nodoc
class _$ThumbnailsTearOff {
  const _$ThumbnailsTearOff();

  _Thumbnails call(
      {Default? thumbnailsDefault,
      Default? medium,
      Default? high,
      Default? standard,
      Default? maxres}) {
    return _Thumbnails(
      thumbnailsDefault: thumbnailsDefault,
      medium: medium,
      high: high,
      standard: standard,
      maxres: maxres,
    );
  }

  Thumbnails fromJson(Map<String, Object> json) {
    return Thumbnails.fromJson(json);
  }
}

/// @nodoc
const $Thumbnails = _$ThumbnailsTearOff();

/// @nodoc
mixin _$Thumbnails {
  Default? get thumbnailsDefault => throw _privateConstructorUsedError;
  Default? get medium => throw _privateConstructorUsedError;
  Default? get high => throw _privateConstructorUsedError;
  Default? get standard => throw _privateConstructorUsedError;
  Default? get maxres => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThumbnailsCopyWith<Thumbnails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThumbnailsCopyWith<$Res> {
  factory $ThumbnailsCopyWith(
          Thumbnails value, $Res Function(Thumbnails) then) =
      _$ThumbnailsCopyWithImpl<$Res>;
  $Res call(
      {Default? thumbnailsDefault,
      Default? medium,
      Default? high,
      Default? standard,
      Default? maxres});

  $DefaultCopyWith<$Res>? get thumbnailsDefault;
  $DefaultCopyWith<$Res>? get medium;
  $DefaultCopyWith<$Res>? get high;
  $DefaultCopyWith<$Res>? get standard;
  $DefaultCopyWith<$Res>? get maxres;
}

/// @nodoc
class _$ThumbnailsCopyWithImpl<$Res> implements $ThumbnailsCopyWith<$Res> {
  _$ThumbnailsCopyWithImpl(this._value, this._then);

  final Thumbnails _value;
  // ignore: unused_field
  final $Res Function(Thumbnails) _then;

  @override
  $Res call({
    Object? thumbnailsDefault = freezed,
    Object? medium = freezed,
    Object? high = freezed,
    Object? standard = freezed,
    Object? maxres = freezed,
  }) {
    return _then(_value.copyWith(
      thumbnailsDefault: thumbnailsDefault == freezed
          ? _value.thumbnailsDefault
          : thumbnailsDefault // ignore: cast_nullable_to_non_nullable
              as Default?,
      medium: medium == freezed
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as Default?,
      high: high == freezed
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as Default?,
      standard: standard == freezed
          ? _value.standard
          : standard // ignore: cast_nullable_to_non_nullable
              as Default?,
      maxres: maxres == freezed
          ? _value.maxres
          : maxres // ignore: cast_nullable_to_non_nullable
              as Default?,
    ));
  }

  @override
  $DefaultCopyWith<$Res>? get thumbnailsDefault {
    if (_value.thumbnailsDefault == null) {
      return null;
    }

    return $DefaultCopyWith<$Res>(_value.thumbnailsDefault!, (value) {
      return _then(_value.copyWith(thumbnailsDefault: value));
    });
  }

  @override
  $DefaultCopyWith<$Res>? get medium {
    if (_value.medium == null) {
      return null;
    }

    return $DefaultCopyWith<$Res>(_value.medium!, (value) {
      return _then(_value.copyWith(medium: value));
    });
  }

  @override
  $DefaultCopyWith<$Res>? get high {
    if (_value.high == null) {
      return null;
    }

    return $DefaultCopyWith<$Res>(_value.high!, (value) {
      return _then(_value.copyWith(high: value));
    });
  }

  @override
  $DefaultCopyWith<$Res>? get standard {
    if (_value.standard == null) {
      return null;
    }

    return $DefaultCopyWith<$Res>(_value.standard!, (value) {
      return _then(_value.copyWith(standard: value));
    });
  }

  @override
  $DefaultCopyWith<$Res>? get maxres {
    if (_value.maxres == null) {
      return null;
    }

    return $DefaultCopyWith<$Res>(_value.maxres!, (value) {
      return _then(_value.copyWith(maxres: value));
    });
  }
}

/// @nodoc
abstract class _$ThumbnailsCopyWith<$Res> implements $ThumbnailsCopyWith<$Res> {
  factory _$ThumbnailsCopyWith(
          _Thumbnails value, $Res Function(_Thumbnails) then) =
      __$ThumbnailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {Default? thumbnailsDefault,
      Default? medium,
      Default? high,
      Default? standard,
      Default? maxres});

  @override
  $DefaultCopyWith<$Res>? get thumbnailsDefault;
  @override
  $DefaultCopyWith<$Res>? get medium;
  @override
  $DefaultCopyWith<$Res>? get high;
  @override
  $DefaultCopyWith<$Res>? get standard;
  @override
  $DefaultCopyWith<$Res>? get maxres;
}

/// @nodoc
class __$ThumbnailsCopyWithImpl<$Res> extends _$ThumbnailsCopyWithImpl<$Res>
    implements _$ThumbnailsCopyWith<$Res> {
  __$ThumbnailsCopyWithImpl(
      _Thumbnails _value, $Res Function(_Thumbnails) _then)
      : super(_value, (v) => _then(v as _Thumbnails));

  @override
  _Thumbnails get _value => super._value as _Thumbnails;

  @override
  $Res call({
    Object? thumbnailsDefault = freezed,
    Object? medium = freezed,
    Object? high = freezed,
    Object? standard = freezed,
    Object? maxres = freezed,
  }) {
    return _then(_Thumbnails(
      thumbnailsDefault: thumbnailsDefault == freezed
          ? _value.thumbnailsDefault
          : thumbnailsDefault // ignore: cast_nullable_to_non_nullable
              as Default?,
      medium: medium == freezed
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as Default?,
      high: high == freezed
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as Default?,
      standard: standard == freezed
          ? _value.standard
          : standard // ignore: cast_nullable_to_non_nullable
              as Default?,
      maxres: maxres == freezed
          ? _value.maxres
          : maxres // ignore: cast_nullable_to_non_nullable
              as Default?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Thumbnails implements _Thumbnails {
  const _$_Thumbnails(
      {this.thumbnailsDefault,
      this.medium,
      this.high,
      this.standard,
      this.maxres});

  factory _$_Thumbnails.fromJson(Map<String, dynamic> json) =>
      _$_$_ThumbnailsFromJson(json);

  @override
  final Default? thumbnailsDefault;
  @override
  final Default? medium;
  @override
  final Default? high;
  @override
  final Default? standard;
  @override
  final Default? maxres;

  @override
  String toString() {
    return 'Thumbnails(thumbnailsDefault: $thumbnailsDefault, medium: $medium, high: $high, standard: $standard, maxres: $maxres)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Thumbnails &&
            (identical(other.thumbnailsDefault, thumbnailsDefault) ||
                const DeepCollectionEquality()
                    .equals(other.thumbnailsDefault, thumbnailsDefault)) &&
            (identical(other.medium, medium) ||
                const DeepCollectionEquality().equals(other.medium, medium)) &&
            (identical(other.high, high) ||
                const DeepCollectionEquality().equals(other.high, high)) &&
            (identical(other.standard, standard) ||
                const DeepCollectionEquality()
                    .equals(other.standard, standard)) &&
            (identical(other.maxres, maxres) ||
                const DeepCollectionEquality().equals(other.maxres, maxres)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(thumbnailsDefault) ^
      const DeepCollectionEquality().hash(medium) ^
      const DeepCollectionEquality().hash(high) ^
      const DeepCollectionEquality().hash(standard) ^
      const DeepCollectionEquality().hash(maxres);

  @JsonKey(ignore: true)
  @override
  _$ThumbnailsCopyWith<_Thumbnails> get copyWith =>
      __$ThumbnailsCopyWithImpl<_Thumbnails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ThumbnailsToJson(this);
  }
}

abstract class _Thumbnails implements Thumbnails {
  const factory _Thumbnails(
      {Default? thumbnailsDefault,
      Default? medium,
      Default? high,
      Default? standard,
      Default? maxres}) = _$_Thumbnails;

  factory _Thumbnails.fromJson(Map<String, dynamic> json) =
      _$_Thumbnails.fromJson;

  @override
  Default? get thumbnailsDefault => throw _privateConstructorUsedError;
  @override
  Default? get medium => throw _privateConstructorUsedError;
  @override
  Default? get high => throw _privateConstructorUsedError;
  @override
  Default? get standard => throw _privateConstructorUsedError;
  @override
  Default? get maxres => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ThumbnailsCopyWith<_Thumbnails> get copyWith =>
      throw _privateConstructorUsedError;
}

Default _$DefaultFromJson(Map<String, dynamic> json) {
  return _Default.fromJson(json);
}

/// @nodoc
class _$DefaultTearOff {
  const _$DefaultTearOff();

  _Default call(
      {required String url, required int width, required int height}) {
    return _Default(
      url: url,
      width: width,
      height: height,
    );
  }

  Default fromJson(Map<String, Object> json) {
    return Default.fromJson(json);
  }
}

/// @nodoc
const $Default = _$DefaultTearOff();

/// @nodoc
mixin _$Default {
  String get url => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefaultCopyWith<Default> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultCopyWith<$Res> {
  factory $DefaultCopyWith(Default value, $Res Function(Default) then) =
      _$DefaultCopyWithImpl<$Res>;
  $Res call({String url, int width, int height});
}

/// @nodoc
class _$DefaultCopyWithImpl<$Res> implements $DefaultCopyWith<$Res> {
  _$DefaultCopyWithImpl(this._value, this._then);

  final Default _value;
  // ignore: unused_field
  final $Res Function(Default) _then;

  @override
  $Res call({
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_value.copyWith(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$DefaultCopyWith<$Res> implements $DefaultCopyWith<$Res> {
  factory _$DefaultCopyWith(_Default value, $Res Function(_Default) then) =
      __$DefaultCopyWithImpl<$Res>;
  @override
  $Res call({String url, int width, int height});
}

/// @nodoc
class __$DefaultCopyWithImpl<$Res> extends _$DefaultCopyWithImpl<$Res>
    implements _$DefaultCopyWith<$Res> {
  __$DefaultCopyWithImpl(_Default _value, $Res Function(_Default) _then)
      : super(_value, (v) => _then(v as _Default));

  @override
  _Default get _value => super._value as _Default;

  @override
  $Res call({
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_Default(
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Default implements _Default {
  const _$_Default(
      {required this.url, required this.width, required this.height});

  factory _$_Default.fromJson(Map<String, dynamic> json) =>
      _$_$_DefaultFromJson(json);

  @override
  final String url;
  @override
  final int width;
  @override
  final int height;

  @override
  String toString() {
    return 'Default(url: $url, width: $width, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Default &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height);

  @JsonKey(ignore: true)
  @override
  _$DefaultCopyWith<_Default> get copyWith =>
      __$DefaultCopyWithImpl<_Default>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DefaultToJson(this);
  }
}

abstract class _Default implements Default {
  const factory _Default(
      {required String url,
      required int width,
      required int height}) = _$_Default;

  factory _Default.fromJson(Map<String, dynamic> json) = _$_Default.fromJson;

  @override
  String get url => throw _privateConstructorUsedError;
  @override
  int get width => throw _privateConstructorUsedError;
  @override
  int get height => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DefaultCopyWith<_Default> get copyWith =>
      throw _privateConstructorUsedError;
}

Statistics _$StatisticsFromJson(Map<String, dynamic> json) {
  return _Statistics.fromJson(json);
}

/// @nodoc
class _$StatisticsTearOff {
  const _$StatisticsTearOff();

  _Statistics call(
      {required String viewCount,
      required String likeCount,
      required String dislikeCount,
      required String favoriteCount,
      required String commentCount}) {
    return _Statistics(
      viewCount: viewCount,
      likeCount: likeCount,
      dislikeCount: dislikeCount,
      favoriteCount: favoriteCount,
      commentCount: commentCount,
    );
  }

  Statistics fromJson(Map<String, Object> json) {
    return Statistics.fromJson(json);
  }
}

/// @nodoc
const $Statistics = _$StatisticsTearOff();

/// @nodoc
mixin _$Statistics {
  String get viewCount => throw _privateConstructorUsedError;
  String get likeCount => throw _privateConstructorUsedError;
  String get dislikeCount => throw _privateConstructorUsedError;
  String get favoriteCount => throw _privateConstructorUsedError;
  String get commentCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatisticsCopyWith<Statistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsCopyWith<$Res> {
  factory $StatisticsCopyWith(
          Statistics value, $Res Function(Statistics) then) =
      _$StatisticsCopyWithImpl<$Res>;
  $Res call(
      {String viewCount,
      String likeCount,
      String dislikeCount,
      String favoriteCount,
      String commentCount});
}

/// @nodoc
class _$StatisticsCopyWithImpl<$Res> implements $StatisticsCopyWith<$Res> {
  _$StatisticsCopyWithImpl(this._value, this._then);

  final Statistics _value;
  // ignore: unused_field
  final $Res Function(Statistics) _then;

  @override
  $Res call({
    Object? viewCount = freezed,
    Object? likeCount = freezed,
    Object? dislikeCount = freezed,
    Object? favoriteCount = freezed,
    Object? commentCount = freezed,
  }) {
    return _then(_value.copyWith(
      viewCount: viewCount == freezed
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: likeCount == freezed
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as String,
      dislikeCount: dislikeCount == freezed
          ? _value.dislikeCount
          : dislikeCount // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteCount: favoriteCount == freezed
          ? _value.favoriteCount
          : favoriteCount // ignore: cast_nullable_to_non_nullable
              as String,
      commentCount: commentCount == freezed
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$StatisticsCopyWith<$Res> implements $StatisticsCopyWith<$Res> {
  factory _$StatisticsCopyWith(
          _Statistics value, $Res Function(_Statistics) then) =
      __$StatisticsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String viewCount,
      String likeCount,
      String dislikeCount,
      String favoriteCount,
      String commentCount});
}

/// @nodoc
class __$StatisticsCopyWithImpl<$Res> extends _$StatisticsCopyWithImpl<$Res>
    implements _$StatisticsCopyWith<$Res> {
  __$StatisticsCopyWithImpl(
      _Statistics _value, $Res Function(_Statistics) _then)
      : super(_value, (v) => _then(v as _Statistics));

  @override
  _Statistics get _value => super._value as _Statistics;

  @override
  $Res call({
    Object? viewCount = freezed,
    Object? likeCount = freezed,
    Object? dislikeCount = freezed,
    Object? favoriteCount = freezed,
    Object? commentCount = freezed,
  }) {
    return _then(_Statistics(
      viewCount: viewCount == freezed
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as String,
      likeCount: likeCount == freezed
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as String,
      dislikeCount: dislikeCount == freezed
          ? _value.dislikeCount
          : dislikeCount // ignore: cast_nullable_to_non_nullable
              as String,
      favoriteCount: favoriteCount == freezed
          ? _value.favoriteCount
          : favoriteCount // ignore: cast_nullable_to_non_nullable
              as String,
      commentCount: commentCount == freezed
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Statistics implements _Statistics {
  const _$_Statistics(
      {required this.viewCount,
      required this.likeCount,
      required this.dislikeCount,
      required this.favoriteCount,
      required this.commentCount});

  factory _$_Statistics.fromJson(Map<String, dynamic> json) =>
      _$_$_StatisticsFromJson(json);

  @override
  final String viewCount;
  @override
  final String likeCount;
  @override
  final String dislikeCount;
  @override
  final String favoriteCount;
  @override
  final String commentCount;

  @override
  String toString() {
    return 'Statistics(viewCount: $viewCount, likeCount: $likeCount, dislikeCount: $dislikeCount, favoriteCount: $favoriteCount, commentCount: $commentCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Statistics &&
            (identical(other.viewCount, viewCount) ||
                const DeepCollectionEquality()
                    .equals(other.viewCount, viewCount)) &&
            (identical(other.likeCount, likeCount) ||
                const DeepCollectionEquality()
                    .equals(other.likeCount, likeCount)) &&
            (identical(other.dislikeCount, dislikeCount) ||
                const DeepCollectionEquality()
                    .equals(other.dislikeCount, dislikeCount)) &&
            (identical(other.favoriteCount, favoriteCount) ||
                const DeepCollectionEquality()
                    .equals(other.favoriteCount, favoriteCount)) &&
            (identical(other.commentCount, commentCount) ||
                const DeepCollectionEquality()
                    .equals(other.commentCount, commentCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(viewCount) ^
      const DeepCollectionEquality().hash(likeCount) ^
      const DeepCollectionEquality().hash(dislikeCount) ^
      const DeepCollectionEquality().hash(favoriteCount) ^
      const DeepCollectionEquality().hash(commentCount);

  @JsonKey(ignore: true)
  @override
  _$StatisticsCopyWith<_Statistics> get copyWith =>
      __$StatisticsCopyWithImpl<_Statistics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StatisticsToJson(this);
  }
}

abstract class _Statistics implements Statistics {
  const factory _Statistics(
      {required String viewCount,
      required String likeCount,
      required String dislikeCount,
      required String favoriteCount,
      required String commentCount}) = _$_Statistics;

  factory _Statistics.fromJson(Map<String, dynamic> json) =
      _$_Statistics.fromJson;

  @override
  String get viewCount => throw _privateConstructorUsedError;
  @override
  String get likeCount => throw _privateConstructorUsedError;
  @override
  String get dislikeCount => throw _privateConstructorUsedError;
  @override
  String get favoriteCount => throw _privateConstructorUsedError;
  @override
  String get commentCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StatisticsCopyWith<_Statistics> get copyWith =>
      throw _privateConstructorUsedError;
}

Status _$StatusFromJson(Map<String, dynamic> json) {
  return _Status.fromJson(json);
}

/// @nodoc
class _$StatusTearOff {
  const _$StatusTearOff();

  _Status call(
      {required String uploadStatus,
      required String privacyStatus,
      required String license,
      required bool embeddable,
      required bool publicStatsViewable,
      required bool madeForKids}) {
    return _Status(
      uploadStatus: uploadStatus,
      privacyStatus: privacyStatus,
      license: license,
      embeddable: embeddable,
      publicStatsViewable: publicStatsViewable,
      madeForKids: madeForKids,
    );
  }

  Status fromJson(Map<String, Object> json) {
    return Status.fromJson(json);
  }
}

/// @nodoc
const $Status = _$StatusTearOff();

/// @nodoc
mixin _$Status {
  String get uploadStatus => throw _privateConstructorUsedError;
  String get privacyStatus => throw _privateConstructorUsedError;
  String get license => throw _privateConstructorUsedError;
  bool get embeddable => throw _privateConstructorUsedError;
  bool get publicStatsViewable => throw _privateConstructorUsedError;
  bool get madeForKids => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusCopyWith<Status> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusCopyWith<$Res> {
  factory $StatusCopyWith(Status value, $Res Function(Status) then) =
      _$StatusCopyWithImpl<$Res>;
  $Res call(
      {String uploadStatus,
      String privacyStatus,
      String license,
      bool embeddable,
      bool publicStatsViewable,
      bool madeForKids});
}

/// @nodoc
class _$StatusCopyWithImpl<$Res> implements $StatusCopyWith<$Res> {
  _$StatusCopyWithImpl(this._value, this._then);

  final Status _value;
  // ignore: unused_field
  final $Res Function(Status) _then;

  @override
  $Res call({
    Object? uploadStatus = freezed,
    Object? privacyStatus = freezed,
    Object? license = freezed,
    Object? embeddable = freezed,
    Object? publicStatsViewable = freezed,
    Object? madeForKids = freezed,
  }) {
    return _then(_value.copyWith(
      uploadStatus: uploadStatus == freezed
          ? _value.uploadStatus
          : uploadStatus // ignore: cast_nullable_to_non_nullable
              as String,
      privacyStatus: privacyStatus == freezed
          ? _value.privacyStatus
          : privacyStatus // ignore: cast_nullable_to_non_nullable
              as String,
      license: license == freezed
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String,
      embeddable: embeddable == freezed
          ? _value.embeddable
          : embeddable // ignore: cast_nullable_to_non_nullable
              as bool,
      publicStatsViewable: publicStatsViewable == freezed
          ? _value.publicStatsViewable
          : publicStatsViewable // ignore: cast_nullable_to_non_nullable
              as bool,
      madeForKids: madeForKids == freezed
          ? _value.madeForKids
          : madeForKids // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$StatusCopyWith<$Res> implements $StatusCopyWith<$Res> {
  factory _$StatusCopyWith(_Status value, $Res Function(_Status) then) =
      __$StatusCopyWithImpl<$Res>;
  @override
  $Res call(
      {String uploadStatus,
      String privacyStatus,
      String license,
      bool embeddable,
      bool publicStatsViewable,
      bool madeForKids});
}

/// @nodoc
class __$StatusCopyWithImpl<$Res> extends _$StatusCopyWithImpl<$Res>
    implements _$StatusCopyWith<$Res> {
  __$StatusCopyWithImpl(_Status _value, $Res Function(_Status) _then)
      : super(_value, (v) => _then(v as _Status));

  @override
  _Status get _value => super._value as _Status;

  @override
  $Res call({
    Object? uploadStatus = freezed,
    Object? privacyStatus = freezed,
    Object? license = freezed,
    Object? embeddable = freezed,
    Object? publicStatsViewable = freezed,
    Object? madeForKids = freezed,
  }) {
    return _then(_Status(
      uploadStatus: uploadStatus == freezed
          ? _value.uploadStatus
          : uploadStatus // ignore: cast_nullable_to_non_nullable
              as String,
      privacyStatus: privacyStatus == freezed
          ? _value.privacyStatus
          : privacyStatus // ignore: cast_nullable_to_non_nullable
              as String,
      license: license == freezed
          ? _value.license
          : license // ignore: cast_nullable_to_non_nullable
              as String,
      embeddable: embeddable == freezed
          ? _value.embeddable
          : embeddable // ignore: cast_nullable_to_non_nullable
              as bool,
      publicStatsViewable: publicStatsViewable == freezed
          ? _value.publicStatsViewable
          : publicStatsViewable // ignore: cast_nullable_to_non_nullable
              as bool,
      madeForKids: madeForKids == freezed
          ? _value.madeForKids
          : madeForKids // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Status implements _Status {
  const _$_Status(
      {required this.uploadStatus,
      required this.privacyStatus,
      required this.license,
      required this.embeddable,
      required this.publicStatsViewable,
      required this.madeForKids});

  factory _$_Status.fromJson(Map<String, dynamic> json) =>
      _$_$_StatusFromJson(json);

  @override
  final String uploadStatus;
  @override
  final String privacyStatus;
  @override
  final String license;
  @override
  final bool embeddable;
  @override
  final bool publicStatsViewable;
  @override
  final bool madeForKids;

  @override
  String toString() {
    return 'Status(uploadStatus: $uploadStatus, privacyStatus: $privacyStatus, license: $license, embeddable: $embeddable, publicStatsViewable: $publicStatsViewable, madeForKids: $madeForKids)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Status &&
            (identical(other.uploadStatus, uploadStatus) ||
                const DeepCollectionEquality()
                    .equals(other.uploadStatus, uploadStatus)) &&
            (identical(other.privacyStatus, privacyStatus) ||
                const DeepCollectionEquality()
                    .equals(other.privacyStatus, privacyStatus)) &&
            (identical(other.license, license) ||
                const DeepCollectionEquality()
                    .equals(other.license, license)) &&
            (identical(other.embeddable, embeddable) ||
                const DeepCollectionEquality()
                    .equals(other.embeddable, embeddable)) &&
            (identical(other.publicStatsViewable, publicStatsViewable) ||
                const DeepCollectionEquality()
                    .equals(other.publicStatsViewable, publicStatsViewable)) &&
            (identical(other.madeForKids, madeForKids) ||
                const DeepCollectionEquality()
                    .equals(other.madeForKids, madeForKids)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uploadStatus) ^
      const DeepCollectionEquality().hash(privacyStatus) ^
      const DeepCollectionEquality().hash(license) ^
      const DeepCollectionEquality().hash(embeddable) ^
      const DeepCollectionEquality().hash(publicStatsViewable) ^
      const DeepCollectionEquality().hash(madeForKids);

  @JsonKey(ignore: true)
  @override
  _$StatusCopyWith<_Status> get copyWith =>
      __$StatusCopyWithImpl<_Status>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StatusToJson(this);
  }
}

abstract class _Status implements Status {
  const factory _Status(
      {required String uploadStatus,
      required String privacyStatus,
      required String license,
      required bool embeddable,
      required bool publicStatsViewable,
      required bool madeForKids}) = _$_Status;

  factory _Status.fromJson(Map<String, dynamic> json) = _$_Status.fromJson;

  @override
  String get uploadStatus => throw _privateConstructorUsedError;
  @override
  String get privacyStatus => throw _privateConstructorUsedError;
  @override
  String get license => throw _privateConstructorUsedError;
  @override
  bool get embeddable => throw _privateConstructorUsedError;
  @override
  bool get publicStatsViewable => throw _privateConstructorUsedError;
  @override
  bool get madeForKids => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StatusCopyWith<_Status> get copyWith => throw _privateConstructorUsedError;
}
