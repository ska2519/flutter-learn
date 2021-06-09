import 'package:cloud_firestore/cloud_firestore.dart';
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
    @TimestampConverter() DateTime? loginTimestamp,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
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
