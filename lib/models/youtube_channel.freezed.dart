// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'youtube_channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return _Channel.fromJson(json);
}

/// @nodoc
class _$ChannelTearOff {
  const _$ChannelTearOff();

  _Channel call(
      {required String kind, required String etag, required List<Item> items}) {
    return _Channel(
      kind: kind,
      etag: etag,
      items: items,
    );
  }

  Channel fromJson(Map<String, Object> json) {
    return Channel.fromJson(json);
  }
}

/// @nodoc
const $Channel = _$ChannelTearOff();

/// @nodoc
mixin _$Channel {
  String get kind => throw _privateConstructorUsedError;
  String get etag => throw _privateConstructorUsedError;
  List<Item> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChannelCopyWith<Channel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelCopyWith<$Res> {
  factory $ChannelCopyWith(Channel value, $Res Function(Channel) then) =
      _$ChannelCopyWithImpl<$Res>;
  $Res call({String kind, String etag, List<Item> items});
}

/// @nodoc
class _$ChannelCopyWithImpl<$Res> implements $ChannelCopyWith<$Res> {
  _$ChannelCopyWithImpl(this._value, this._then);

  final Channel _value;
  // ignore: unused_field
  final $Res Function(Channel) _then;

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
abstract class _$ChannelCopyWith<$Res> implements $ChannelCopyWith<$Res> {
  factory _$ChannelCopyWith(_Channel value, $Res Function(_Channel) then) =
      __$ChannelCopyWithImpl<$Res>;
  @override
  $Res call({String kind, String etag, List<Item> items});
}

/// @nodoc
class __$ChannelCopyWithImpl<$Res> extends _$ChannelCopyWithImpl<$Res>
    implements _$ChannelCopyWith<$Res> {
  __$ChannelCopyWithImpl(_Channel _value, $Res Function(_Channel) _then)
      : super(_value, (v) => _then(v as _Channel));

  @override
  _Channel get _value => super._value as _Channel;

  @override
  $Res call({
    Object? kind = freezed,
    Object? etag = freezed,
    Object? items = freezed,
  }) {
    return _then(_Channel(
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
class _$_Channel implements _Channel {
  const _$_Channel(
      {required this.kind, required this.etag, required this.items});

  factory _$_Channel.fromJson(Map<String, dynamic> json) =>
      _$_$_ChannelFromJson(json);

  @override
  final String kind;
  @override
  final String etag;
  @override
  final List<Item> items;

  @override
  String toString() {
    return 'Channel(kind: $kind, etag: $etag, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Channel &&
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
  _$ChannelCopyWith<_Channel> get copyWith =>
      __$ChannelCopyWithImpl<_Channel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ChannelToJson(this);
  }
}

abstract class _Channel implements Channel {
  const factory _Channel(
      {required String kind,
      required String etag,
      required List<Item> items}) = _$_Channel;

  factory _Channel.fromJson(Map<String, dynamic> json) = _$_Channel.fromJson;

  @override
  String get kind => throw _privateConstructorUsedError;
  @override
  String get etag => throw _privateConstructorUsedError;
  @override
  List<Item> get items => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ChannelCopyWith<_Channel> get copyWith =>
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
      required Statistics statistics,
      required BrandingSettings brandingSettings}) {
    return _Item(
      kind: kind,
      etag: etag,
      id: id,
      snippet: snippet,
      statistics: statistics,
      brandingSettings: brandingSettings,
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
  Statistics get statistics => throw _privateConstructorUsedError;
  BrandingSettings get brandingSettings => throw _privateConstructorUsedError;

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
      Statistics statistics,
      BrandingSettings brandingSettings});

  $SnippetCopyWith<$Res> get snippet;
  $StatisticsCopyWith<$Res> get statistics;
  $BrandingSettingsCopyWith<$Res> get brandingSettings;
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
    Object? statistics = freezed,
    Object? brandingSettings = freezed,
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
      statistics: statistics == freezed
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as Statistics,
      brandingSettings: brandingSettings == freezed
          ? _value.brandingSettings
          : brandingSettings // ignore: cast_nullable_to_non_nullable
              as BrandingSettings,
    ));
  }

  @override
  $SnippetCopyWith<$Res> get snippet {
    return $SnippetCopyWith<$Res>(_value.snippet, (value) {
      return _then(_value.copyWith(snippet: value));
    });
  }

  @override
  $StatisticsCopyWith<$Res> get statistics {
    return $StatisticsCopyWith<$Res>(_value.statistics, (value) {
      return _then(_value.copyWith(statistics: value));
    });
  }

  @override
  $BrandingSettingsCopyWith<$Res> get brandingSettings {
    return $BrandingSettingsCopyWith<$Res>(_value.brandingSettings, (value) {
      return _then(_value.copyWith(brandingSettings: value));
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
      Statistics statistics,
      BrandingSettings brandingSettings});

  @override
  $SnippetCopyWith<$Res> get snippet;
  @override
  $StatisticsCopyWith<$Res> get statistics;
  @override
  $BrandingSettingsCopyWith<$Res> get brandingSettings;
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
    Object? statistics = freezed,
    Object? brandingSettings = freezed,
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
      statistics: statistics == freezed
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as Statistics,
      brandingSettings: brandingSettings == freezed
          ? _value.brandingSettings
          : brandingSettings // ignore: cast_nullable_to_non_nullable
              as BrandingSettings,
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
      required this.statistics,
      required this.brandingSettings});

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
  final Statistics statistics;
  @override
  final BrandingSettings brandingSettings;

  @override
  String toString() {
    return 'Item(kind: $kind, etag: $etag, id: $id, snippet: $snippet, statistics: $statistics, brandingSettings: $brandingSettings)';
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
            (identical(other.statistics, statistics) ||
                const DeepCollectionEquality()
                    .equals(other.statistics, statistics)) &&
            (identical(other.brandingSettings, brandingSettings) ||
                const DeepCollectionEquality()
                    .equals(other.brandingSettings, brandingSettings)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(kind) ^
      const DeepCollectionEquality().hash(etag) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(snippet) ^
      const DeepCollectionEquality().hash(statistics) ^
      const DeepCollectionEquality().hash(brandingSettings);

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
      required Statistics statistics,
      required BrandingSettings brandingSettings}) = _$_Item;

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
  Statistics get statistics => throw _privateConstructorUsedError;
  @override
  BrandingSettings get brandingSettings => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ItemCopyWith<_Item> get copyWith => throw _privateConstructorUsedError;
}

BrandingSettings _$BrandingSettingsFromJson(Map<String, dynamic> json) {
  return _BrandingSettings.fromJson(json);
}

/// @nodoc
class _$BrandingSettingsTearOff {
  const _$BrandingSettingsTearOff();

  _BrandingSettings call(
      {required ChannelClass channel, required Image image}) {
    return _BrandingSettings(
      channel: channel,
      image: image,
    );
  }

  BrandingSettings fromJson(Map<String, Object> json) {
    return BrandingSettings.fromJson(json);
  }
}

/// @nodoc
const $BrandingSettings = _$BrandingSettingsTearOff();

/// @nodoc
mixin _$BrandingSettings {
  ChannelClass get channel => throw _privateConstructorUsedError;
  Image get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BrandingSettingsCopyWith<BrandingSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandingSettingsCopyWith<$Res> {
  factory $BrandingSettingsCopyWith(
          BrandingSettings value, $Res Function(BrandingSettings) then) =
      _$BrandingSettingsCopyWithImpl<$Res>;
  $Res call({ChannelClass channel, Image image});

  $ChannelClassCopyWith<$Res> get channel;
  $ImageCopyWith<$Res> get image;
}

/// @nodoc
class _$BrandingSettingsCopyWithImpl<$Res>
    implements $BrandingSettingsCopyWith<$Res> {
  _$BrandingSettingsCopyWithImpl(this._value, this._then);

  final BrandingSettings _value;
  // ignore: unused_field
  final $Res Function(BrandingSettings) _then;

  @override
  $Res call({
    Object? channel = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      channel: channel == freezed
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as ChannelClass,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
    ));
  }

  @override
  $ChannelClassCopyWith<$Res> get channel {
    return $ChannelClassCopyWith<$Res>(_value.channel, (value) {
      return _then(_value.copyWith(channel: value));
    });
  }

  @override
  $ImageCopyWith<$Res> get image {
    return $ImageCopyWith<$Res>(_value.image, (value) {
      return _then(_value.copyWith(image: value));
    });
  }
}

/// @nodoc
abstract class _$BrandingSettingsCopyWith<$Res>
    implements $BrandingSettingsCopyWith<$Res> {
  factory _$BrandingSettingsCopyWith(
          _BrandingSettings value, $Res Function(_BrandingSettings) then) =
      __$BrandingSettingsCopyWithImpl<$Res>;
  @override
  $Res call({ChannelClass channel, Image image});

  @override
  $ChannelClassCopyWith<$Res> get channel;
  @override
  $ImageCopyWith<$Res> get image;
}

/// @nodoc
class __$BrandingSettingsCopyWithImpl<$Res>
    extends _$BrandingSettingsCopyWithImpl<$Res>
    implements _$BrandingSettingsCopyWith<$Res> {
  __$BrandingSettingsCopyWithImpl(
      _BrandingSettings _value, $Res Function(_BrandingSettings) _then)
      : super(_value, (v) => _then(v as _BrandingSettings));

  @override
  _BrandingSettings get _value => super._value as _BrandingSettings;

  @override
  $Res call({
    Object? channel = freezed,
    Object? image = freezed,
  }) {
    return _then(_BrandingSettings(
      channel: channel == freezed
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as ChannelClass,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BrandingSettings implements _BrandingSettings {
  const _$_BrandingSettings({required this.channel, required this.image});

  factory _$_BrandingSettings.fromJson(Map<String, dynamic> json) =>
      _$_$_BrandingSettingsFromJson(json);

  @override
  final ChannelClass channel;
  @override
  final Image image;

  @override
  String toString() {
    return 'BrandingSettings(channel: $channel, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BrandingSettings &&
            (identical(other.channel, channel) ||
                const DeepCollectionEquality()
                    .equals(other.channel, channel)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(channel) ^
      const DeepCollectionEquality().hash(image);

  @JsonKey(ignore: true)
  @override
  _$BrandingSettingsCopyWith<_BrandingSettings> get copyWith =>
      __$BrandingSettingsCopyWithImpl<_BrandingSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BrandingSettingsToJson(this);
  }
}

abstract class _BrandingSettings implements BrandingSettings {
  const factory _BrandingSettings(
      {required ChannelClass channel,
      required Image image}) = _$_BrandingSettings;

  factory _BrandingSettings.fromJson(Map<String, dynamic> json) =
      _$_BrandingSettings.fromJson;

  @override
  ChannelClass get channel => throw _privateConstructorUsedError;
  @override
  Image get image => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BrandingSettingsCopyWith<_BrandingSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

ChannelClass _$ChannelClassFromJson(Map<String, dynamic> json) {
  return _ChannelClass.fromJson(json);
}

/// @nodoc
class _$ChannelClassTearOff {
  const _$ChannelClassTearOff();

  _ChannelClass call(
      {required String title,
      required String description,
      String? keywords,
      required bool showRelatedChannels,
      required bool showBrowseView,
      String? country}) {
    return _ChannelClass(
      title: title,
      description: description,
      keywords: keywords,
      showRelatedChannels: showRelatedChannels,
      showBrowseView: showBrowseView,
      country: country,
    );
  }

  ChannelClass fromJson(Map<String, Object> json) {
    return ChannelClass.fromJson(json);
  }
}

/// @nodoc
const $ChannelClass = _$ChannelClassTearOff();

/// @nodoc
mixin _$ChannelClass {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get keywords => throw _privateConstructorUsedError;
  bool get showRelatedChannels => throw _privateConstructorUsedError;
  bool get showBrowseView => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChannelClassCopyWith<ChannelClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelClassCopyWith<$Res> {
  factory $ChannelClassCopyWith(
          ChannelClass value, $Res Function(ChannelClass) then) =
      _$ChannelClassCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String description,
      String? keywords,
      bool showRelatedChannels,
      bool showBrowseView,
      String? country});
}

/// @nodoc
class _$ChannelClassCopyWithImpl<$Res> implements $ChannelClassCopyWith<$Res> {
  _$ChannelClassCopyWithImpl(this._value, this._then);

  final ChannelClass _value;
  // ignore: unused_field
  final $Res Function(ChannelClass) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? keywords = freezed,
    Object? showRelatedChannels = freezed,
    Object? showBrowseView = freezed,
    Object? country = freezed,
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
      keywords: keywords == freezed
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      showRelatedChannels: showRelatedChannels == freezed
          ? _value.showRelatedChannels
          : showRelatedChannels // ignore: cast_nullable_to_non_nullable
              as bool,
      showBrowseView: showBrowseView == freezed
          ? _value.showBrowseView
          : showBrowseView // ignore: cast_nullable_to_non_nullable
              as bool,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ChannelClassCopyWith<$Res>
    implements $ChannelClassCopyWith<$Res> {
  factory _$ChannelClassCopyWith(
          _ChannelClass value, $Res Function(_ChannelClass) then) =
      __$ChannelClassCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String description,
      String? keywords,
      bool showRelatedChannels,
      bool showBrowseView,
      String? country});
}

/// @nodoc
class __$ChannelClassCopyWithImpl<$Res> extends _$ChannelClassCopyWithImpl<$Res>
    implements _$ChannelClassCopyWith<$Res> {
  __$ChannelClassCopyWithImpl(
      _ChannelClass _value, $Res Function(_ChannelClass) _then)
      : super(_value, (v) => _then(v as _ChannelClass));

  @override
  _ChannelClass get _value => super._value as _ChannelClass;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? keywords = freezed,
    Object? showRelatedChannels = freezed,
    Object? showBrowseView = freezed,
    Object? country = freezed,
  }) {
    return _then(_ChannelClass(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      keywords: keywords == freezed
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
      showRelatedChannels: showRelatedChannels == freezed
          ? _value.showRelatedChannels
          : showRelatedChannels // ignore: cast_nullable_to_non_nullable
              as bool,
      showBrowseView: showBrowseView == freezed
          ? _value.showBrowseView
          : showBrowseView // ignore: cast_nullable_to_non_nullable
              as bool,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChannelClass implements _ChannelClass {
  const _$_ChannelClass(
      {required this.title,
      required this.description,
      this.keywords,
      required this.showRelatedChannels,
      required this.showBrowseView,
      this.country});

  factory _$_ChannelClass.fromJson(Map<String, dynamic> json) =>
      _$_$_ChannelClassFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final String? keywords;
  @override
  final bool showRelatedChannels;
  @override
  final bool showBrowseView;
  @override
  final String? country;

  @override
  String toString() {
    return 'ChannelClass(title: $title, description: $description, keywords: $keywords, showRelatedChannels: $showRelatedChannels, showBrowseView: $showBrowseView, country: $country)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChannelClass &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.keywords, keywords) ||
                const DeepCollectionEquality()
                    .equals(other.keywords, keywords)) &&
            (identical(other.showRelatedChannels, showRelatedChannels) ||
                const DeepCollectionEquality()
                    .equals(other.showRelatedChannels, showRelatedChannels)) &&
            (identical(other.showBrowseView, showBrowseView) ||
                const DeepCollectionEquality()
                    .equals(other.showBrowseView, showBrowseView)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality().equals(other.country, country)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(keywords) ^
      const DeepCollectionEquality().hash(showRelatedChannels) ^
      const DeepCollectionEquality().hash(showBrowseView) ^
      const DeepCollectionEquality().hash(country);

  @JsonKey(ignore: true)
  @override
  _$ChannelClassCopyWith<_ChannelClass> get copyWith =>
      __$ChannelClassCopyWithImpl<_ChannelClass>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ChannelClassToJson(this);
  }
}

abstract class _ChannelClass implements ChannelClass {
  const factory _ChannelClass(
      {required String title,
      required String description,
      String? keywords,
      required bool showRelatedChannels,
      required bool showBrowseView,
      String? country}) = _$_ChannelClass;

  factory _ChannelClass.fromJson(Map<String, dynamic> json) =
      _$_ChannelClass.fromJson;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  String? get keywords => throw _privateConstructorUsedError;
  @override
  bool get showRelatedChannels => throw _privateConstructorUsedError;
  @override
  bool get showBrowseView => throw _privateConstructorUsedError;
  @override
  String? get country => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ChannelClassCopyWith<_ChannelClass> get copyWith =>
      throw _privateConstructorUsedError;
}

Image _$ImageFromJson(Map<String, dynamic> json) {
  return _Image.fromJson(json);
}

/// @nodoc
class _$ImageTearOff {
  const _$ImageTearOff();

  _Image call({required String bannerExternalUrl}) {
    return _Image(
      bannerExternalUrl: bannerExternalUrl,
    );
  }

  Image fromJson(Map<String, Object> json) {
    return Image.fromJson(json);
  }
}

/// @nodoc
const $Image = _$ImageTearOff();

/// @nodoc
mixin _$Image {
  String get bannerExternalUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageCopyWith<Image> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCopyWith<$Res> {
  factory $ImageCopyWith(Image value, $Res Function(Image) then) =
      _$ImageCopyWithImpl<$Res>;
  $Res call({String bannerExternalUrl});
}

/// @nodoc
class _$ImageCopyWithImpl<$Res> implements $ImageCopyWith<$Res> {
  _$ImageCopyWithImpl(this._value, this._then);

  final Image _value;
  // ignore: unused_field
  final $Res Function(Image) _then;

  @override
  $Res call({
    Object? bannerExternalUrl = freezed,
  }) {
    return _then(_value.copyWith(
      bannerExternalUrl: bannerExternalUrl == freezed
          ? _value.bannerExternalUrl
          : bannerExternalUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ImageCopyWith<$Res> implements $ImageCopyWith<$Res> {
  factory _$ImageCopyWith(_Image value, $Res Function(_Image) then) =
      __$ImageCopyWithImpl<$Res>;
  @override
  $Res call({String bannerExternalUrl});
}

/// @nodoc
class __$ImageCopyWithImpl<$Res> extends _$ImageCopyWithImpl<$Res>
    implements _$ImageCopyWith<$Res> {
  __$ImageCopyWithImpl(_Image _value, $Res Function(_Image) _then)
      : super(_value, (v) => _then(v as _Image));

  @override
  _Image get _value => super._value as _Image;

  @override
  $Res call({
    Object? bannerExternalUrl = freezed,
  }) {
    return _then(_Image(
      bannerExternalUrl: bannerExternalUrl == freezed
          ? _value.bannerExternalUrl
          : bannerExternalUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Image implements _Image {
  const _$_Image({required this.bannerExternalUrl});

  factory _$_Image.fromJson(Map<String, dynamic> json) =>
      _$_$_ImageFromJson(json);

  @override
  final String bannerExternalUrl;

  @override
  String toString() {
    return 'Image(bannerExternalUrl: $bannerExternalUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Image &&
            (identical(other.bannerExternalUrl, bannerExternalUrl) ||
                const DeepCollectionEquality()
                    .equals(other.bannerExternalUrl, bannerExternalUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bannerExternalUrl);

  @JsonKey(ignore: true)
  @override
  _$ImageCopyWith<_Image> get copyWith =>
      __$ImageCopyWithImpl<_Image>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ImageToJson(this);
  }
}

abstract class _Image implements Image {
  const factory _Image({required String bannerExternalUrl}) = _$_Image;

  factory _Image.fromJson(Map<String, dynamic> json) = _$_Image.fromJson;

  @override
  String get bannerExternalUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ImageCopyWith<_Image> get copyWith => throw _privateConstructorUsedError;
}

Snippet _$SnippetFromJson(Map<String, dynamic> json) {
  return _Snippet.fromJson(json);
}

/// @nodoc
class _$SnippetTearOff {
  const _$SnippetTearOff();

  _Snippet call(
      {required String title,
      required String description,
      required DateTime publishedAt,
      required Thumbnails thumbnails,
      required Localized localized,
      String? country}) {
    return _Snippet(
      title: title,
      description: description,
      publishedAt: publishedAt,
      thumbnails: thumbnails,
      localized: localized,
      country: country,
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
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get publishedAt => throw _privateConstructorUsedError;
  Thumbnails get thumbnails => throw _privateConstructorUsedError;
  Localized get localized => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SnippetCopyWith<Snippet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SnippetCopyWith<$Res> {
  factory $SnippetCopyWith(Snippet value, $Res Function(Snippet) then) =
      _$SnippetCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String description,
      DateTime publishedAt,
      Thumbnails thumbnails,
      Localized localized,
      String? country});

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
    Object? title = freezed,
    Object? description = freezed,
    Object? publishedAt = freezed,
    Object? thumbnails = freezed,
    Object? localized = freezed,
    Object? country = freezed,
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
      publishedAt: publishedAt == freezed
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      thumbnails: thumbnails == freezed
          ? _value.thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as Thumbnails,
      localized: localized == freezed
          ? _value.localized
          : localized // ignore: cast_nullable_to_non_nullable
              as Localized,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
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
      {String title,
      String description,
      DateTime publishedAt,
      Thumbnails thumbnails,
      Localized localized,
      String? country});

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
    Object? title = freezed,
    Object? description = freezed,
    Object? publishedAt = freezed,
    Object? thumbnails = freezed,
    Object? localized = freezed,
    Object? country = freezed,
  }) {
    return _then(_Snippet(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      publishedAt: publishedAt == freezed
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      thumbnails: thumbnails == freezed
          ? _value.thumbnails
          : thumbnails // ignore: cast_nullable_to_non_nullable
              as Thumbnails,
      localized: localized == freezed
          ? _value.localized
          : localized // ignore: cast_nullable_to_non_nullable
              as Localized,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Snippet implements _Snippet {
  const _$_Snippet(
      {required this.title,
      required this.description,
      required this.publishedAt,
      required this.thumbnails,
      required this.localized,
      this.country});

  factory _$_Snippet.fromJson(Map<String, dynamic> json) =>
      _$_$_SnippetFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime publishedAt;
  @override
  final Thumbnails thumbnails;
  @override
  final Localized localized;
  @override
  final String? country;

  @override
  String toString() {
    return 'Snippet(title: $title, description: $description, publishedAt: $publishedAt, thumbnails: $thumbnails, localized: $localized, country: $country)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Snippet &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.publishedAt, publishedAt) ||
                const DeepCollectionEquality()
                    .equals(other.publishedAt, publishedAt)) &&
            (identical(other.thumbnails, thumbnails) ||
                const DeepCollectionEquality()
                    .equals(other.thumbnails, thumbnails)) &&
            (identical(other.localized, localized) ||
                const DeepCollectionEquality()
                    .equals(other.localized, localized)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality().equals(other.country, country)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(publishedAt) ^
      const DeepCollectionEquality().hash(thumbnails) ^
      const DeepCollectionEquality().hash(localized) ^
      const DeepCollectionEquality().hash(country);

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
      {required String title,
      required String description,
      required DateTime publishedAt,
      required Thumbnails thumbnails,
      required Localized localized,
      String? country}) = _$_Snippet;

  factory _Snippet.fromJson(Map<String, dynamic> json) = _$_Snippet.fromJson;

  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  DateTime get publishedAt => throw _privateConstructorUsedError;
  @override
  Thumbnails get thumbnails => throw _privateConstructorUsedError;
  @override
  Localized get localized => throw _privateConstructorUsedError;
  @override
  String? get country => throw _privateConstructorUsedError;
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
      {Default? thumbnailsDefault, Default? medium, Default? high}) {
    return _Thumbnails(
      thumbnailsDefault: thumbnailsDefault,
      medium: medium,
      high: high,
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
  $Res call({Default? thumbnailsDefault, Default? medium, Default? high});

  $DefaultCopyWith<$Res>? get thumbnailsDefault;
  $DefaultCopyWith<$Res>? get medium;
  $DefaultCopyWith<$Res>? get high;
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
}

/// @nodoc
abstract class _$ThumbnailsCopyWith<$Res> implements $ThumbnailsCopyWith<$Res> {
  factory _$ThumbnailsCopyWith(
          _Thumbnails value, $Res Function(_Thumbnails) then) =
      __$ThumbnailsCopyWithImpl<$Res>;
  @override
  $Res call({Default? thumbnailsDefault, Default? medium, Default? high});

  @override
  $DefaultCopyWith<$Res>? get thumbnailsDefault;
  @override
  $DefaultCopyWith<$Res>? get medium;
  @override
  $DefaultCopyWith<$Res>? get high;
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Thumbnails implements _Thumbnails {
  const _$_Thumbnails({this.thumbnailsDefault, this.medium, this.high});

  factory _$_Thumbnails.fromJson(Map<String, dynamic> json) =>
      _$_$_ThumbnailsFromJson(json);

  @override
  final Default? thumbnailsDefault;
  @override
  final Default? medium;
  @override
  final Default? high;

  @override
  String toString() {
    return 'Thumbnails(thumbnailsDefault: $thumbnailsDefault, medium: $medium, high: $high)';
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
                const DeepCollectionEquality().equals(other.high, high)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(thumbnailsDefault) ^
      const DeepCollectionEquality().hash(medium) ^
      const DeepCollectionEquality().hash(high);

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
      Default? high}) = _$_Thumbnails;

  factory _Thumbnails.fromJson(Map<String, dynamic> json) =
      _$_Thumbnails.fromJson;

  @override
  Default? get thumbnailsDefault => throw _privateConstructorUsedError;
  @override
  Default? get medium => throw _privateConstructorUsedError;
  @override
  Default? get high => throw _privateConstructorUsedError;
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
      String? subscriberCount,
      required bool hiddenSubscriberCount,
      required String videoCount}) {
    return _Statistics(
      viewCount: viewCount,
      subscriberCount: subscriberCount,
      hiddenSubscriberCount: hiddenSubscriberCount,
      videoCount: videoCount,
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
  String? get subscriberCount => throw _privateConstructorUsedError;
  bool get hiddenSubscriberCount => throw _privateConstructorUsedError;
  String get videoCount => throw _privateConstructorUsedError;

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
      String? subscriberCount,
      bool hiddenSubscriberCount,
      String videoCount});
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
    Object? subscriberCount = freezed,
    Object? hiddenSubscriberCount = freezed,
    Object? videoCount = freezed,
  }) {
    return _then(_value.copyWith(
      viewCount: viewCount == freezed
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as String,
      subscriberCount: subscriberCount == freezed
          ? _value.subscriberCount
          : subscriberCount // ignore: cast_nullable_to_non_nullable
              as String?,
      hiddenSubscriberCount: hiddenSubscriberCount == freezed
          ? _value.hiddenSubscriberCount
          : hiddenSubscriberCount // ignore: cast_nullable_to_non_nullable
              as bool,
      videoCount: videoCount == freezed
          ? _value.videoCount
          : videoCount // ignore: cast_nullable_to_non_nullable
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
      String? subscriberCount,
      bool hiddenSubscriberCount,
      String videoCount});
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
    Object? subscriberCount = freezed,
    Object? hiddenSubscriberCount = freezed,
    Object? videoCount = freezed,
  }) {
    return _then(_Statistics(
      viewCount: viewCount == freezed
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as String,
      subscriberCount: subscriberCount == freezed
          ? _value.subscriberCount
          : subscriberCount // ignore: cast_nullable_to_non_nullable
              as String?,
      hiddenSubscriberCount: hiddenSubscriberCount == freezed
          ? _value.hiddenSubscriberCount
          : hiddenSubscriberCount // ignore: cast_nullable_to_non_nullable
              as bool,
      videoCount: videoCount == freezed
          ? _value.videoCount
          : videoCount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Statistics implements _Statistics {
  const _$_Statistics(
      {required this.viewCount,
      this.subscriberCount,
      required this.hiddenSubscriberCount,
      required this.videoCount});

  factory _$_Statistics.fromJson(Map<String, dynamic> json) =>
      _$_$_StatisticsFromJson(json);

  @override
  final String viewCount;
  @override
  final String? subscriberCount;
  @override
  final bool hiddenSubscriberCount;
  @override
  final String videoCount;

  @override
  String toString() {
    return 'Statistics(viewCount: $viewCount, subscriberCount: $subscriberCount, hiddenSubscriberCount: $hiddenSubscriberCount, videoCount: $videoCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Statistics &&
            (identical(other.viewCount, viewCount) ||
                const DeepCollectionEquality()
                    .equals(other.viewCount, viewCount)) &&
            (identical(other.subscriberCount, subscriberCount) ||
                const DeepCollectionEquality()
                    .equals(other.subscriberCount, subscriberCount)) &&
            (identical(other.hiddenSubscriberCount, hiddenSubscriberCount) ||
                const DeepCollectionEquality().equals(
                    other.hiddenSubscriberCount, hiddenSubscriberCount)) &&
            (identical(other.videoCount, videoCount) ||
                const DeepCollectionEquality()
                    .equals(other.videoCount, videoCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(viewCount) ^
      const DeepCollectionEquality().hash(subscriberCount) ^
      const DeepCollectionEquality().hash(hiddenSubscriberCount) ^
      const DeepCollectionEquality().hash(videoCount);

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
      String? subscriberCount,
      required bool hiddenSubscriberCount,
      required String videoCount}) = _$_Statistics;

  factory _Statistics.fromJson(Map<String, dynamic> json) =
      _$_Statistics.fromJson;

  @override
  String get viewCount => throw _privateConstructorUsedError;
  @override
  String? get subscriberCount => throw _privateConstructorUsedError;
  @override
  bool get hiddenSubscriberCount => throw _privateConstructorUsedError;
  @override
  String get videoCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StatisticsCopyWith<_Statistics> get copyWith =>
      throw _privateConstructorUsedError;
}
