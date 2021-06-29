import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.g.dart';
part 'app_user.freezed.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    String? id,
    String? email,
    String? photoURL,
    String? displayName,
    @Default(false) bool deletedUser,
    // @TimestampConverter() DateTime? timestamp,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
