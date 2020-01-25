// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoanInterest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanInterest _$LoanInterestFromJson(Map<String, dynamic> json) {
  return LoanInterest(
    type: json['type'] as String,
    value: json['value'] as int,
  );
}

Map<String, dynamic> _$LoanInterestToJson(LoanInterest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
    };

// **************************************************************************
// DataGenerator
// **************************************************************************

abstract class _$LoanInterestLombok {
  /// Field
  String type;
  int value;

  /// Setter

  void setType(String type) {
    this.type = type;
  }

  void setValue(int value) {
    this.value = value;
  }

  /// Getter
  String getType() {
    return type;
  }

  int getValue() {
    return value;
  }
}
