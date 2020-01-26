// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SavingBank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavingBank _$SavingBankFromJson(Map<String, dynamic> json) {
  return SavingBank(
    total: (json['total'] as num)?.toDouble(),
    loanValues: (json['loanValues'] as num)?.toDouble(),
    interestValues: (json['interestValues'] as num)?.toDouble(),
  )..id = json['id'] as String;
}

Map<String, dynamic> _$SavingBankToJson(SavingBank instance) =>
    <String, dynamic>{
      'id': instance.id,
      'total': instance.total,
      'loanValues': instance.loanValues,
      'interestValues': instance.interestValues,
    };

// **************************************************************************
// DataGenerator
// **************************************************************************

abstract class _$SavingBankLombok {
  /// Field
  double total;
  double loanValues;
  double interestValues;

  /// Setter

  void setTotal(double total) {
    this.total = total;
  }

  void setLoanValues(double loanValues) {
    this.loanValues = loanValues;
  }

  void setInterestValues(double interestValues) {
    this.interestValues = interestValues;
  }

  /// Getter
  double getTotal() {
    return total;
  }

  double getLoanValues() {
    return loanValues;
  }

  double getInterestValues() {
    return interestValues;
  }
}
