import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) => timestamp.toDate();

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}

// class TimestampsConverter
//     implements JsonConverter<Set<DateTime>, Set<Timestamp>> {
//   const TimestampsConverter();
//   static const Set<DateTime> defaultDateTime = <DateTime>{};
//   static const Set<Timestamp> defaultTimestamp = <Timestamp>{};

//   @override
//   Set<DateTime> fromJson(Set<Timestamp> timestamp) {
//     if (timestamp.isEmpty) {
//       return defaultDateTime;
//     }
//     return timestamp.map((timestamp) => timestamp.toDate()).toSet();
//   }

//   @override
//   Set<Timestamp> toJson(Set<DateTime> date) {
//     if (date.isEmpty) {
//       return defaultTimestamp;
//     }
//     return date.map((date) => Timestamp.fromDate(date)).toSet();
//   }
// }
