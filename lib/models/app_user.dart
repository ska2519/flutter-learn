import 'package:flutter_learn/models/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'app_user.g.dart';
part 'app_user.freezed.dart';

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    String? id,
    String? email,
    String? photoURL,
    String? displayName,
    @TimestampsConverter() Set<DateTime>? timestamp,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}

class AppUserNotifier extends StateNotifier<AppUser> {
  AppUserNotifier() : super(const AppUser());

  // ignore: use_setters_to_change_properties
  void login(AppUser appUser) {
    state = appUser;
  }

  void logout() {
    state = AppUser();
  }
}
