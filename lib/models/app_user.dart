import 'package:freezed_annotation/freezed_annotation.dart';

import 'timestamp_converter.dart';

part 'app_user.g.dart';
part 'app_user.freezed.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required String email,
    required String displayName,
    String? photoURL,
    @Default(false) bool deletedUser,
    @Default(0) int point,
    @TimestampConverter() DateTime? timestamp,
    // @Default(0) int updatedDisplayName,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
