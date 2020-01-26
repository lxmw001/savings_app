// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Period.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Period _$PeriodFromJson(Map<String, dynamic> json) {
  return Period(
    from: json['from'] == null ? null : DateTime.parse(json['from'] as String),
    to: json['to'] == null ? null : DateTime.parse(json['to'] as String),
  )..id = json['id'] as String;
}

Map<String, dynamic> _$PeriodToJson(Period instance) => <String, dynamic>{
      'id': instance.id,
      'from': instance.from?.toIso8601String(),
      'to': instance.to?.toIso8601String(),
    };

// **************************************************************************
// DataGenerator
// **************************************************************************

abstract class _$PeriodLombok {
  /// Field
  DateTime from;
  DateTime to;

  /// Setter

  void setFrom(DateTime from) {
    this.from = from;
  }

  void setTo(DateTime to) {
    this.to = to;
  }

  /// Getter
  DateTime getFrom() {
    return from;
  }

  DateTime getTo() {
    return to;
  }
}
