// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SavingBank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavingBank _$SavingBankFromJson(Map<String, dynamic> json) {
  return SavingBank(
    total: (json['total'] as num)?.toDouble(),
  )..id = json['id'] as String;
}

Map<String, dynamic> _$SavingBankToJson(SavingBank instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total': instance.total,
    };

// **************************************************************************
// DataGenerator
// **************************************************************************

abstract class _$SavingBankLombok {
  /// Field
  double total;

  /// Setter

  void setTotal(double total) {
    this.total = total;
  }

  /// Getter
  double getTotal() {
    return total;
  }
}
