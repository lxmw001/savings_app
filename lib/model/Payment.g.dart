// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return Payment(
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    value: json['value'] as int,
  );
}

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'value': instance.value,
    };

// **************************************************************************
// DataGenerator
// **************************************************************************

abstract class _$PaymentLombok {
  /// Field
  DateTime date;
  int value;

  /// Setter

  void setDate(DateTime date) {
    this.date = date;
  }

  void setValue(int value) {
    this.value = value;
  }

  /// Getter
  DateTime getDate() {
    return date;
  }

  int getValue() {
    return value;
  }
}
