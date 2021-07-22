// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'youtube_playlist_items.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaylistItems _$PlaylistItemsFromJson(Map<String, dynamic> json) {
  return _PlaylistItems.fromJson(json);
}

/// @nodoc
class _$PlaylistItemsTearOff {
  const _$PlaylistItemsTearOff();

  _PlaylistItems call(
      {required String kind,
      required String etag,
      String? nextPageToken,
      String? prevPageToken,
      required List<Item> items,
      required PageInfo pageInfo}) {
    return _PlaylistItems(
      kind: kind,
      etag: etag,
      nextPageToken: nextPageToken,
      prevPageToken: prevPageToken,
      items: items,
      pageInfo: pageInfo,
    );
  }

  PlaylistItems fromJson(Map<String, Object> json) {
    return PlaylistItems.fromJson(json);
  }
}

/// @nodoc
const $PlaylistItems = _$PlaylistItemsTearOff();

/// @nodoc
mixin _$PlaylistItems {
  String get kind => throw _privateConstructorUsedError;
  String get etag => throw _privateConstructorUsedError;
  String? get nextPageToken => throw _privateConstructorUsedError;
  String? get prevPageToken => throw _privateConstructorUsedError;
  List<Item> get items => throw _privateConstructorUsedError;
  PageInfo get pageInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaylistItemsCopyWith<PlaylistItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistItemsCopyWith<$Res> {
  factory $PlaylistItemsCopyWith(
          PlaylistItems value, $Res Function(PlaylistItems) then) =
      _$PlaylistItemsCopyWithImpl<$Res>;
  $Res call(
      {String kind,
      String etag,
      String? nextPageToken,
      String? prevPageToken,
      List<Item> items,
      PageInfo pageInfo});

  $PageInfoCopyWith<$Res> get pageInfo;
}

/// @nodoc
class _$PlaylistItemsCopyWithImpl<$Res>
    implements $PlaylistItemsCopyWith<$Res> {
  _$PlaylistItemsCopyWithImpl(this._value, this._then);

  final PlaylistItems _value;
  // ignore: unused_field
  final $Res Function(PlaylistItems) _then;

  @override
  $Res call({
    Object? kind = freezed,
    Object? etag = freezed,
    Object? nextPageToken = freezed,
    Object? prevPageToken = freezed,
    Object? items = freezed,
    Object? pageInfo = freezed,
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
      nextPageToken: nextPageToken == freezed
          ? _value.nextPageToken
          : nextPageToken // ignore: cast_nullable_to_non_nullable
              as String?,
      prevPageToken: prevPageToken == freezed
          ? _value.prevPageToken
          : prevPageToken // ignore: cast_nullable_to_non_nullable
              as String?,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      pageInfo: pageInfo == freezed
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo,
    ));
  }

  @override
  $PageInfoCopyWith<$Res> get pageInfo {
    return $PageInfoCopyWith<$Res>(_value.pageInfo, (value) {
      return _then(_value.copyWith(pageInfo: value));
    });
  }
}

/// @nodoc
abstract class _$PlaylistItemsCopyWith<$Res>
    implements $PlaylistItemsCopyWith<$Res> {
  factory _$PlaylistItemsCopyWith(
          _PlaylistItems value, $Res Function(_PlaylistItems) then) =
      __$PlaylistItemsCopyWithImpl<$Res>;
  @override
  $Res call(
      {String kind,
      String etag,
      String? nextPageToken,
      String? prevPageToken,
      List<Item> items,
      PageInfo pageInfo});

  @override
  $PageInfoCopyWith<$Res> get pageInfo;
}

/// @nodoc
class __$PlaylistItemsCopyWithImpl<$Res>
    extends _$PlaylistItemsCopyWithImpl<$Res>
    implements _$PlaylistItemsCopyWith<$Res> {
  __$PlaylistItemsCopyWithImpl(
      _PlaylistItems _value, $Res Function(_PlaylistItems) _then)
      : super(_value, (v) => _then(v as _PlaylistItems));

  @override
  _PlaylistItems get _value => super._value as _PlaylistItems;

  @override
  $Res call({
    Object? kind = freezed,
    Object? etag = freezed,
    Object? nextPageToken = freezed,
    Object? prevPageToken = freezed,
    Object? items = freezed,
    Object? pageInfo = freezed,
  }) {
    return _then(_PlaylistItems(
      kind: kind == freezed
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      etag: etag == freezed
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String,
      nextPageToken: nextPageToken == freezed
          ? _value.nextPageToken
          : nextPageToken // ignore: cast_nullable_to_non_nullable
              as String?,
      prevPageToken: prevPageToken == freezed
          ? _value.prevPageToken
          : prevPageToken // ignore: cast_nullable_to_non_nullable
              as String?,
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Item>,
      pageInfo: pageInfo == freezed
          ? _value.pageInfo
          : pageInfo // ignore: cast_nullable_to_non_nullable
              as PageInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlaylistItems implements _PlaylistItems {
  const _$_PlaylistItems(
      {required this.kind,
      required this.etag,
      this.nextPageToken,
      this.prevPageToken,
      required this.items,
      required this.pageInfo});

  factory _$_PlaylistItems.fromJson(Map<String, dynamic> json) =>
      _$_$_PlaylistItemsFromJson(json);

  @override
  final String kind;
  @override
  final String etag;
  @override
  final String? nextPageToken;
  @override
  final String? prevPageToken;
  @override
  final List<Item> items;
  @override
  final PageInfo pageInfo;

  @override
  String toString() {
    return 'PlaylistItems(kind: $kind, etag: $etag, nextPageToken: $nextPageToken, prevPageToken: $prevPageToken, items: $items, pageInfo: $pageInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PlaylistItems &&
            (identical(other.kind, kind) ||
                const DeepCollectionEquality().equals(other.kind, kind)) &&
            (identical(other.etag, etag) ||
                const DeepCollectionEquality().equals(other.etag, etag)) &&
            (identical(other.nextPageToken, nextPageToken) ||
                const DeepCollectionEquality()
                    .equals(other.nextPageToken, nextPageToken)) &&
            (identical(other.prevPageToken, prevPageToken) ||
                const DeepCollectionEquality()
                    .equals(other.prevPageToken, prevPageToken)) &&
            (identical(other.items, items) ||
                const DeepCollectionEquality().equals(other.items, items)) &&
            (identical(other.pageInfo, pageInfo) ||
                const DeepCollectionEquality()
                    .equals(other.pageInfo, pageInfo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(kind) ^
      const DeepCollectionEquality().hash(etag) ^
      const DeepCollectionEquality().hash(nextPageToken) ^
      const DeepCollectionEquality().hash(prevPageToken) ^
      const DeepCollectionEquality().hash(items) ^
      const DeepCollectionEquality().hash(pageInfo);

  @JsonKey(ignore: true)
  @override
  _$PlaylistItemsCopyWith<_PlaylistItems> get copyWith =>
      __$PlaylistItemsCopyWithImpl<_PlaylistItems>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PlaylistItemsToJson(this);
  }
}

abstract class _PlaylistItems implements PlaylistItems {
  const factory _PlaylistItems(
      {required String kind,
      required String etag,
      String? nextPageToken,
      String? prevPageToken,
      required List<Item> items,
      required PageInfo pageInfo}) = _$_PlaylistItems;

  factory _PlaylistItems.fromJson(Map<String, dynamic> json) =
      _$_PlaylistItems.fromJson;

  @override
  String get kind => throw _privateConstructorUsedError;
  @override
  String get etag => throw _privateConstructorUsedError;
  @override
  String? get nextPageToken => throw _privateConstructorUsedError;
  @override
  String? get prevPageToken => throw _privateConstructorUsedError;
  @override
  List<Item> get items => throw _privateConstructorUsedError;
  @override
  PageInfo get pageInfo => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PlaylistItemsCopyWith<_PlaylistItems> get copyWith =>
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
      required Status status}) {
    return _Item(
      kind: kind,
      etag: etag,
      id: id,
      snippet: snippet,
      contentDetails: contentDetails,
      status: status,
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
      Status status});

  $SnippetCopyWith<$Res> get snippet;
  $ContentDetailsCopyWith<$Res> get contentDetails;
  $StatusCopyWith<$Res> get status;
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
      Status status});

  @override
  $SnippetCopyWith<$Res> get snippet;
  @override
  $ContentDetailsCopyWith<$Res> get contentDetails;
  @override
  $StatusCopyWith<$Res> get status;
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
      required this.status});

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
  String toString() {
    return 'Item(kind: $kind, etag: $etag, id: $id, snippet: $snippet, contentDetails: $contentDetails, status: $status)';
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
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(kind) ^
      const DeepCollectionEquality().hash(etag) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(snippet) ^
      const DeepCollectionEquality().hash(contentDetails) ^
      const DeepCollectionEquality().hash(status);

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
      required Status status}) = _$_Item;

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
  @JsonKey(ignore: true)
  _$ItemCopyWith<_Item> get copyWith => throw _privateConstructorUsedError;
}

ContentDetails _$ContentDetailsFromJson(Map<String, dynamic> json) {
  return _ContentDetails.fromJson(json);
}

/// @nodoc
class _$ContentDetailsTearOff {
  const _$ContentDetailsTearOff();

  _ContentDetails call({required String videoId, DateTime? videoPublishedAt}) {
    return _ContentDetails(
      videoId: videoId,
      videoPublishedAt: videoPublishedAt,
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
  String get videoId => throw _privateConstructorUsedError;
  DateTime? get videoPublishedAt => throw _privateConstructorUsedError;

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
  $Res call({String videoId, DateTime? videoPublishedAt});
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
    Object? videoId = freezed,
    Object? videoPublishedAt = freezed,
  }) {
    return _then(_value.copyWith(
      videoId: videoId == freezed
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      videoPublishedAt: videoPublishedAt == freezed
          ? _value.videoPublishedAt
          : videoPublishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$ContentDetailsCopyWith<$Res>
    implements $ContentDetailsCopyWith<$Res> {
  factory _$ContentDetailsCopyWith(
          _ContentDetails value, $Res Function(_ContentDetails) then) =
      __$ContentDetailsCopyWithImpl<$Res>;
  @override
  $Res call({String videoId, DateTime? videoPublishedAt});
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
    Object? videoId = freezed,
    Object? videoPublishedAt = freezed,
  }) {
    return _then(_ContentDetails(
      videoId: videoId == freezed
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      videoPublishedAt: videoPublishedAt == freezed
          ? _value.videoPublishedAt
          : videoPublishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContentDetails implements _ContentDetails {
  const _$_ContentDetails({required this.videoId, this.videoPublishedAt});

  factory _$_ContentDetails.fromJson(Map<String, dynamic> json) =>
      _$_$_ContentDetailsFromJson(json);

  @override
  final String videoId;
  @override
  final DateTime? videoPublishedAt;

  @override
  String toString() {
    return 'ContentDetails(videoId: $videoId, videoPublishedAt: $videoPublishedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ContentDetails &&
            (identical(other.videoId, videoId) ||
                const DeepCollectionEquality()
                    .equals(other.videoId, videoId)) &&
            (identical(other.videoPublishedAt, videoPublishedAt) ||
                const DeepCollectionEquality()
                    .equals(other.videoPublishedAt, videoPublishedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(videoId) ^
      const DeepCollectionEquality().hash(videoPublishedAt);

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
      {required String videoId,
      DateTime? videoPublishedAt}) = _$_ContentDetails;

  factory _ContentDetails.fromJson(Map<String, dynamic> json) =
      _$_ContentDetails.fromJson;

  @override
  String get videoId => throw _privateConstructorUsedError;
  @override
  DateTime? get videoPublishedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ContentDetailsCopyWith<_ContentDetails> get copyWith =>
      throw _privateConstructorUsedError;
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
      required String playlistId,
      required int position,
      required ResourceId resourceId,
      String? videoOwnerChannelTitle,
      String? videoOwnerChannelId}) {
    return _Snippet(
      publishedAt: publishedAt,
      channelId: channelId,
      title: title,
      description: description,
      thumbnails: thumbnails,
      channelTitle: channelTitle,
      playlistId: playlistId,
      position: position,
      resourceId: resourceId,
      videoOwnerChannelTitle: videoOwnerChannelTitle,
      videoOwnerChannelId: videoOwnerChannelId,
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
  String get playlistId => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;
  ResourceId get resourceId => throw _privateConstructorUsedError;
  String? get videoOwnerChannelTitle => throw _privateConstructorUsedError;
  String? get videoOwnerChannelId => throw _privateConstructorUsedError;

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
      String playlistId,
      int position,
      ResourceId resourceId,
      String? videoOwnerChannelTitle,
      String? videoOwnerChannelId});

  $ThumbnailsCopyWith<$Res> get thumbnails;
  $ResourceIdCopyWith<$Res> get resourceId;
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
    Object? playlistId = freezed,
    Object? position = freezed,
    Object? resourceId = freezed,
    Object? videoOwnerChannelTitle = freezed,
    Object? videoOwnerChannelId = freezed,
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
      playlistId: playlistId == freezed
          ? _value.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      resourceId: resourceId == freezed
          ? _value.resourceId
          : resourceId // ignore: cast_nullable_to_non_nullable
              as ResourceId,
      videoOwnerChannelTitle: videoOwnerChannelTitle == freezed
          ? _value.videoOwnerChannelTitle
          : videoOwnerChannelTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      videoOwnerChannelId: videoOwnerChannelId == freezed
          ? _value.videoOwnerChannelId
          : videoOwnerChannelId // ignore: cast_nullable_to_non_nullable
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
  $ResourceIdCopyWith<$Res> get resourceId {
    return $ResourceIdCopyWith<$Res>(_value.resourceId, (value) {
      return _then(_value.copyWith(resourceId: value));
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
      String playlistId,
      int position,
      ResourceId resourceId,
      String? videoOwnerChannelTitle,
      String? videoOwnerChannelId});

  @override
  $ThumbnailsCopyWith<$Res> get thumbnails;
  @override
  $ResourceIdCopyWith<$Res> get resourceId;
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
    Object? playlistId = freezed,
    Object? position = freezed,
    Object? resourceId = freezed,
    Object? videoOwnerChannelTitle = freezed,
    Object? videoOwnerChannelId = freezed,
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
      playlistId: playlistId == freezed
          ? _value.playlistId
          : playlistId // ignore: cast_nullable_to_non_nullable
              as String,
      position: position == freezed
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
      resourceId: resourceId == freezed
          ? _value.resourceId
          : resourceId // ignore: cast_nullable_to_non_nullable
              as ResourceId,
      videoOwnerChannelTitle: videoOwnerChannelTitle == freezed
          ? _value.videoOwnerChannelTitle
          : videoOwnerChannelTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      videoOwnerChannelId: videoOwnerChannelId == freezed
          ? _value.videoOwnerChannelId
          : videoOwnerChannelId // ignore: cast_nullable_to_non_nullable
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
      required this.playlistId,
      required this.position,
      required this.resourceId,
      this.videoOwnerChannelTitle,
      this.videoOwnerChannelId});

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
  final String playlistId;
  @override
  final int position;
  @override
  final ResourceId resourceId;
  @override
  final String? videoOwnerChannelTitle;
  @override
  final String? videoOwnerChannelId;

  @override
  String toString() {
    return 'Snippet(publishedAt: $publishedAt, channelId: $channelId, title: $title, description: $description, thumbnails: $thumbnails, channelTitle: $channelTitle, playlistId: $playlistId, position: $position, resourceId: $resourceId, videoOwnerChannelTitle: $videoOwnerChannelTitle, videoOwnerChannelId: $videoOwnerChannelId)';
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
            (identical(other.playlistId, playlistId) ||
                const DeepCollectionEquality()
                    .equals(other.playlistId, playlistId)) &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.resourceId, resourceId) ||
                const DeepCollectionEquality()
                    .equals(other.resourceId, resourceId)) &&
            (identical(other.videoOwnerChannelTitle, videoOwnerChannelTitle) ||
                const DeepCollectionEquality().equals(
                    other.videoOwnerChannelTitle, videoOwnerChannelTitle)) &&
            (identical(other.videoOwnerChannelId, videoOwnerChannelId) ||
                const DeepCollectionEquality()
                    .equals(other.videoOwnerChannelId, videoOwnerChannelId)));
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
      const DeepCollectionEquality().hash(playlistId) ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(resourceId) ^
      const DeepCollectionEquality().hash(videoOwnerChannelTitle) ^
      const DeepCollectionEquality().hash(videoOwnerChannelId);

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
      required String playlistId,
      required int position,
      required ResourceId resourceId,
      String? videoOwnerChannelTitle,
      String? videoOwnerChannelId}) = _$_Snippet;

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
  String get playlistId => throw _privateConstructorUsedError;
  @override
  int get position => throw _privateConstructorUsedError;
  @override
  ResourceId get resourceId => throw _privateConstructorUsedError;
  @override
  String? get videoOwnerChannelTitle => throw _privateConstructorUsedError;
  @override
  String? get videoOwnerChannelId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SnippetCopyWith<_Snippet> get copyWith =>
      throw _privateConstructorUsedError;
}

ResourceId _$ResourceIdFromJson(Map<String, dynamic> json) {
  return _ResourceId.fromJson(json);
}

/// @nodoc
class _$ResourceIdTearOff {
  const _$ResourceIdTearOff();

  _ResourceId call({required String kind, required String videoId}) {
    return _ResourceId(
      kind: kind,
      videoId: videoId,
    );
  }

  ResourceId fromJson(Map<String, Object> json) {
    return ResourceId.fromJson(json);
  }
}

/// @nodoc
const $ResourceId = _$ResourceIdTearOff();

/// @nodoc
mixin _$ResourceId {
  String get kind => throw _privateConstructorUsedError;
  String get videoId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResourceIdCopyWith<ResourceId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourceIdCopyWith<$Res> {
  factory $ResourceIdCopyWith(
          ResourceId value, $Res Function(ResourceId) then) =
      _$ResourceIdCopyWithImpl<$Res>;
  $Res call({String kind, String videoId});
}

/// @nodoc
class _$ResourceIdCopyWithImpl<$Res> implements $ResourceIdCopyWith<$Res> {
  _$ResourceIdCopyWithImpl(this._value, this._then);

  final ResourceId _value;
  // ignore: unused_field
  final $Res Function(ResourceId) _then;

  @override
  $Res call({
    Object? kind = freezed,
    Object? videoId = freezed,
  }) {
    return _then(_value.copyWith(
      kind: kind == freezed
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      videoId: videoId == freezed
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ResourceIdCopyWith<$Res> implements $ResourceIdCopyWith<$Res> {
  factory _$ResourceIdCopyWith(
          _ResourceId value, $Res Function(_ResourceId) then) =
      __$ResourceIdCopyWithImpl<$Res>;
  @override
  $Res call({String kind, String videoId});
}

/// @nodoc
class __$ResourceIdCopyWithImpl<$Res> extends _$ResourceIdCopyWithImpl<$Res>
    implements _$ResourceIdCopyWith<$Res> {
  __$ResourceIdCopyWithImpl(
      _ResourceId _value, $Res Function(_ResourceId) _then)
      : super(_value, (v) => _then(v as _ResourceId));

  @override
  _ResourceId get _value => super._value as _ResourceId;

  @override
  $Res call({
    Object? kind = freezed,
    Object? videoId = freezed,
  }) {
    return _then(_ResourceId(
      kind: kind == freezed
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      videoId: videoId == freezed
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResourceId implements _ResourceId {
  const _$_ResourceId({required this.kind, required this.videoId});

  factory _$_ResourceId.fromJson(Map<String, dynamic> json) =>
      _$_$_ResourceIdFromJson(json);

  @override
  final String kind;
  @override
  final String videoId;

  @override
  String toString() {
    return 'ResourceId(kind: $kind, videoId: $videoId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ResourceId &&
            (identical(other.kind, kind) ||
                const DeepCollectionEquality().equals(other.kind, kind)) &&
            (identical(other.videoId, videoId) ||
                const DeepCollectionEquality().equals(other.videoId, videoId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(kind) ^
      const DeepCollectionEquality().hash(videoId);

  @JsonKey(ignore: true)
  @override
  _$ResourceIdCopyWith<_ResourceId> get copyWith =>
      __$ResourceIdCopyWithImpl<_ResourceId>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ResourceIdToJson(this);
  }
}

abstract class _ResourceId implements ResourceId {
  const factory _ResourceId({required String kind, required String videoId}) =
      _$_ResourceId;

  factory _ResourceId.fromJson(Map<String, dynamic> json) =
      _$_ResourceId.fromJson;

  @override
  String get kind => throw _privateConstructorUsedError;
  @override
  String get videoId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ResourceIdCopyWith<_ResourceId> get copyWith =>
      throw _privateConstructorUsedError;
}

Thumbnails _$ThumbnailsFromJson(Map<String, dynamic> json) {
  return _Thumbnails.fromJson(json);
}

/// @nodoc
class _$ThumbnailsTearOff {
  const _$ThumbnailsTearOff();

  _Thumbnails call(
      {@JsonKey(name: 'default') Thumbnail? dflt,
      Thumbnail? medium,
      Thumbnail? high,
      Thumbnail? standard,
      Thumbnail? maxres}) {
    return _Thumbnails(
      dflt: dflt,
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
  @JsonKey(name: 'default')
  Thumbnail? get dflt => throw _privateConstructorUsedError;
  Thumbnail? get medium => throw _privateConstructorUsedError;
  Thumbnail? get high => throw _privateConstructorUsedError;
  Thumbnail? get standard => throw _privateConstructorUsedError;
  Thumbnail? get maxres => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'default') Thumbnail? dflt,
      Thumbnail? medium,
      Thumbnail? high,
      Thumbnail? standard,
      Thumbnail? maxres});

  $ThumbnailCopyWith<$Res>? get dflt;
  $ThumbnailCopyWith<$Res>? get medium;
  $ThumbnailCopyWith<$Res>? get high;
  $ThumbnailCopyWith<$Res>? get standard;
  $ThumbnailCopyWith<$Res>? get maxres;
}

/// @nodoc
class _$ThumbnailsCopyWithImpl<$Res> implements $ThumbnailsCopyWith<$Res> {
  _$ThumbnailsCopyWithImpl(this._value, this._then);

  final Thumbnails _value;
  // ignore: unused_field
  final $Res Function(Thumbnails) _then;

  @override
  $Res call({
    Object? dflt = freezed,
    Object? medium = freezed,
    Object? high = freezed,
    Object? standard = freezed,
    Object? maxres = freezed,
  }) {
    return _then(_value.copyWith(
      dflt: dflt == freezed
          ? _value.dflt
          : dflt // ignore: cast_nullable_to_non_nullable
              as Thumbnail?,
      medium: medium == freezed
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as Thumbnail?,
      high: high == freezed
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as Thumbnail?,
      standard: standard == freezed
          ? _value.standard
          : standard // ignore: cast_nullable_to_non_nullable
              as Thumbnail?,
      maxres: maxres == freezed
          ? _value.maxres
          : maxres // ignore: cast_nullable_to_non_nullable
              as Thumbnail?,
    ));
  }

  @override
  $ThumbnailCopyWith<$Res>? get dflt {
    if (_value.dflt == null) {
      return null;
    }

    return $ThumbnailCopyWith<$Res>(_value.dflt!, (value) {
      return _then(_value.copyWith(dflt: value));
    });
  }

  @override
  $ThumbnailCopyWith<$Res>? get medium {
    if (_value.medium == null) {
      return null;
    }

    return $ThumbnailCopyWith<$Res>(_value.medium!, (value) {
      return _then(_value.copyWith(medium: value));
    });
  }

  @override
  $ThumbnailCopyWith<$Res>? get high {
    if (_value.high == null) {
      return null;
    }

    return $ThumbnailCopyWith<$Res>(_value.high!, (value) {
      return _then(_value.copyWith(high: value));
    });
  }

  @override
  $ThumbnailCopyWith<$Res>? get standard {
    if (_value.standard == null) {
      return null;
    }

    return $ThumbnailCopyWith<$Res>(_value.standard!, (value) {
      return _then(_value.copyWith(standard: value));
    });
  }

  @override
  $ThumbnailCopyWith<$Res>? get maxres {
    if (_value.maxres == null) {
      return null;
    }

    return $ThumbnailCopyWith<$Res>(_value.maxres!, (value) {
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
      {@JsonKey(name: 'default') Thumbnail? dflt,
      Thumbnail? medium,
      Thumbnail? high,
      Thumbnail? standard,
      Thumbnail? maxres});

  @override
  $ThumbnailCopyWith<$Res>? get dflt;
  @override
  $ThumbnailCopyWith<$Res>? get medium;
  @override
  $ThumbnailCopyWith<$Res>? get high;
  @override
  $ThumbnailCopyWith<$Res>? get standard;
  @override
  $ThumbnailCopyWith<$Res>? get maxres;
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
    Object? dflt = freezed,
    Object? medium = freezed,
    Object? high = freezed,
    Object? standard = freezed,
    Object? maxres = freezed,
  }) {
    return _then(_Thumbnails(
      dflt: dflt == freezed
          ? _value.dflt
          : dflt // ignore: cast_nullable_to_non_nullable
              as Thumbnail?,
      medium: medium == freezed
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as Thumbnail?,
      high: high == freezed
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as Thumbnail?,
      standard: standard == freezed
          ? _value.standard
          : standard // ignore: cast_nullable_to_non_nullable
              as Thumbnail?,
      maxres: maxres == freezed
          ? _value.maxres
          : maxres // ignore: cast_nullable_to_non_nullable
              as Thumbnail?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Thumbnails implements _Thumbnails {
  const _$_Thumbnails(
      {@JsonKey(name: 'default') this.dflt,
      this.medium,
      this.high,
      this.standard,
      this.maxres});

  factory _$_Thumbnails.fromJson(Map<String, dynamic> json) =>
      _$_$_ThumbnailsFromJson(json);

  @override
  @JsonKey(name: 'default')
  final Thumbnail? dflt;
  @override
  final Thumbnail? medium;
  @override
  final Thumbnail? high;
  @override
  final Thumbnail? standard;
  @override
  final Thumbnail? maxres;

  @override
  String toString() {
    return 'Thumbnails(dflt: $dflt, medium: $medium, high: $high, standard: $standard, maxres: $maxres)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Thumbnails &&
            (identical(other.dflt, dflt) ||
                const DeepCollectionEquality().equals(other.dflt, dflt)) &&
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
      const DeepCollectionEquality().hash(dflt) ^
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
      {@JsonKey(name: 'default') Thumbnail? dflt,
      Thumbnail? medium,
      Thumbnail? high,
      Thumbnail? standard,
      Thumbnail? maxres}) = _$_Thumbnails;

  factory _Thumbnails.fromJson(Map<String, dynamic> json) =
      _$_Thumbnails.fromJson;

  @override
  @JsonKey(name: 'default')
  Thumbnail? get dflt => throw _privateConstructorUsedError;
  @override
  Thumbnail? get medium => throw _privateConstructorUsedError;
  @override
  Thumbnail? get high => throw _privateConstructorUsedError;
  @override
  Thumbnail? get standard => throw _privateConstructorUsedError;
  @override
  Thumbnail? get maxres => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ThumbnailsCopyWith<_Thumbnails> get copyWith =>
      throw _privateConstructorUsedError;
}

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) {
  return _Thumbnail.fromJson(json);
}

/// @nodoc
class _$ThumbnailTearOff {
  const _$ThumbnailTearOff();

  _Thumbnail call(
      {required String url, required int width, required int height}) {
    return _Thumbnail(
      url: url,
      width: width,
      height: height,
    );
  }

  Thumbnail fromJson(Map<String, Object> json) {
    return Thumbnail.fromJson(json);
  }
}

/// @nodoc
const $Thumbnail = _$ThumbnailTearOff();

/// @nodoc
mixin _$Thumbnail {
  String get url => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ThumbnailCopyWith<Thumbnail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThumbnailCopyWith<$Res> {
  factory $ThumbnailCopyWith(Thumbnail value, $Res Function(Thumbnail) then) =
      _$ThumbnailCopyWithImpl<$Res>;
  $Res call({String url, int width, int height});
}

/// @nodoc
class _$ThumbnailCopyWithImpl<$Res> implements $ThumbnailCopyWith<$Res> {
  _$ThumbnailCopyWithImpl(this._value, this._then);

  final Thumbnail _value;
  // ignore: unused_field
  final $Res Function(Thumbnail) _then;

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
abstract class _$ThumbnailCopyWith<$Res> implements $ThumbnailCopyWith<$Res> {
  factory _$ThumbnailCopyWith(
          _Thumbnail value, $Res Function(_Thumbnail) then) =
      __$ThumbnailCopyWithImpl<$Res>;
  @override
  $Res call({String url, int width, int height});
}

/// @nodoc
class __$ThumbnailCopyWithImpl<$Res> extends _$ThumbnailCopyWithImpl<$Res>
    implements _$ThumbnailCopyWith<$Res> {
  __$ThumbnailCopyWithImpl(_Thumbnail _value, $Res Function(_Thumbnail) _then)
      : super(_value, (v) => _then(v as _Thumbnail));

  @override
  _Thumbnail get _value => super._value as _Thumbnail;

  @override
  $Res call({
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_Thumbnail(
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
class _$_Thumbnail implements _Thumbnail {
  const _$_Thumbnail(
      {required this.url, required this.width, required this.height});

  factory _$_Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$_$_ThumbnailFromJson(json);

  @override
  final String url;
  @override
  final int width;
  @override
  final int height;

  @override
  String toString() {
    return 'Thumbnail(url: $url, width: $width, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Thumbnail &&
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
  _$ThumbnailCopyWith<_Thumbnail> get copyWith =>
      __$ThumbnailCopyWithImpl<_Thumbnail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ThumbnailToJson(this);
  }
}

abstract class _Thumbnail implements Thumbnail {
  const factory _Thumbnail(
      {required String url,
      required int width,
      required int height}) = _$_Thumbnail;

  factory _Thumbnail.fromJson(Map<String, dynamic> json) =
      _$_Thumbnail.fromJson;

  @override
  String get url => throw _privateConstructorUsedError;
  @override
  int get width => throw _privateConstructorUsedError;
  @override
  int get height => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ThumbnailCopyWith<_Thumbnail> get copyWith =>
      throw _privateConstructorUsedError;
}

Status _$StatusFromJson(Map<String, dynamic> json) {
  return _Status.fromJson(json);
}

/// @nodoc
class _$StatusTearOff {
  const _$StatusTearOff();

  _Status call({required String privacyStatus}) {
    return _Status(
      privacyStatus: privacyStatus,
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
  String get privacyStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusCopyWith<Status> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusCopyWith<$Res> {
  factory $StatusCopyWith(Status value, $Res Function(Status) then) =
      _$StatusCopyWithImpl<$Res>;
  $Res call({String privacyStatus});
}

/// @nodoc
class _$StatusCopyWithImpl<$Res> implements $StatusCopyWith<$Res> {
  _$StatusCopyWithImpl(this._value, this._then);

  final Status _value;
  // ignore: unused_field
  final $Res Function(Status) _then;

  @override
  $Res call({
    Object? privacyStatus = freezed,
  }) {
    return _then(_value.copyWith(
      privacyStatus: privacyStatus == freezed
          ? _value.privacyStatus
          : privacyStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$StatusCopyWith<$Res> implements $StatusCopyWith<$Res> {
  factory _$StatusCopyWith(_Status value, $Res Function(_Status) then) =
      __$StatusCopyWithImpl<$Res>;
  @override
  $Res call({String privacyStatus});
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
    Object? privacyStatus = freezed,
  }) {
    return _then(_Status(
      privacyStatus: privacyStatus == freezed
          ? _value.privacyStatus
          : privacyStatus // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Status implements _Status {
  const _$_Status({required this.privacyStatus});

  factory _$_Status.fromJson(Map<String, dynamic> json) =>
      _$_$_StatusFromJson(json);

  @override
  final String privacyStatus;

  @override
  String toString() {
    return 'Status(privacyStatus: $privacyStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Status &&
            (identical(other.privacyStatus, privacyStatus) ||
                const DeepCollectionEquality()
                    .equals(other.privacyStatus, privacyStatus)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(privacyStatus);

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
  const factory _Status({required String privacyStatus}) = _$_Status;

  factory _Status.fromJson(Map<String, dynamic> json) = _$_Status.fromJson;

  @override
  String get privacyStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StatusCopyWith<_Status> get copyWith => throw _privateConstructorUsedError;
}

PageInfo _$PageInfoFromJson(Map<String, dynamic> json) {
  return _PageInfo.fromJson(json);
}

/// @nodoc
class _$PageInfoTearOff {
  const _$PageInfoTearOff();

  _PageInfo call({required int totalResults, required int resultsPerPage}) {
    return _PageInfo(
      totalResults: totalResults,
      resultsPerPage: resultsPerPage,
    );
  }

  PageInfo fromJson(Map<String, Object> json) {
    return PageInfo.fromJson(json);
  }
}

/// @nodoc
const $PageInfo = _$PageInfoTearOff();

/// @nodoc
mixin _$PageInfo {
  int get totalResults => throw _privateConstructorUsedError;
  int get resultsPerPage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PageInfoCopyWith<PageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageInfoCopyWith<$Res> {
  factory $PageInfoCopyWith(PageInfo value, $Res Function(PageInfo) then) =
      _$PageInfoCopyWithImpl<$Res>;
  $Res call({int totalResults, int resultsPerPage});
}

/// @nodoc
class _$PageInfoCopyWithImpl<$Res> implements $PageInfoCopyWith<$Res> {
  _$PageInfoCopyWithImpl(this._value, this._then);

  final PageInfo _value;
  // ignore: unused_field
  final $Res Function(PageInfo) _then;

  @override
  $Res call({
    Object? totalResults = freezed,
    Object? resultsPerPage = freezed,
  }) {
    return _then(_value.copyWith(
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      resultsPerPage: resultsPerPage == freezed
          ? _value.resultsPerPage
          : resultsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$PageInfoCopyWith<$Res> implements $PageInfoCopyWith<$Res> {
  factory _$PageInfoCopyWith(_PageInfo value, $Res Function(_PageInfo) then) =
      __$PageInfoCopyWithImpl<$Res>;
  @override
  $Res call({int totalResults, int resultsPerPage});
}

/// @nodoc
class __$PageInfoCopyWithImpl<$Res> extends _$PageInfoCopyWithImpl<$Res>
    implements _$PageInfoCopyWith<$Res> {
  __$PageInfoCopyWithImpl(_PageInfo _value, $Res Function(_PageInfo) _then)
      : super(_value, (v) => _then(v as _PageInfo));

  @override
  _PageInfo get _value => super._value as _PageInfo;

  @override
  $Res call({
    Object? totalResults = freezed,
    Object? resultsPerPage = freezed,
  }) {
    return _then(_PageInfo(
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int,
      resultsPerPage: resultsPerPage == freezed
          ? _value.resultsPerPage
          : resultsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PageInfo implements _PageInfo {
  const _$_PageInfo({required this.totalResults, required this.resultsPerPage});

  factory _$_PageInfo.fromJson(Map<String, dynamic> json) =>
      _$_$_PageInfoFromJson(json);

  @override
  final int totalResults;
  @override
  final int resultsPerPage;

  @override
  String toString() {
    return 'PageInfo(totalResults: $totalResults, resultsPerPage: $resultsPerPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PageInfo &&
            (identical(other.totalResults, totalResults) ||
                const DeepCollectionEquality()
                    .equals(other.totalResults, totalResults)) &&
            (identical(other.resultsPerPage, resultsPerPage) ||
                const DeepCollectionEquality()
                    .equals(other.resultsPerPage, resultsPerPage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(totalResults) ^
      const DeepCollectionEquality().hash(resultsPerPage);

  @JsonKey(ignore: true)
  @override
  _$PageInfoCopyWith<_PageInfo> get copyWith =>
      __$PageInfoCopyWithImpl<_PageInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PageInfoToJson(this);
  }
}

abstract class _PageInfo implements PageInfo {
  const factory _PageInfo(
      {required int totalResults, required int resultsPerPage}) = _$_PageInfo;

  factory _PageInfo.fromJson(Map<String, dynamic> json) = _$_PageInfo.fromJson;

  @override
  int get totalResults => throw _privateConstructorUsedError;
  @override
  int get resultsPerPage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PageInfoCopyWith<_PageInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
