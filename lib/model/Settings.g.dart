// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Settings _$SettingsFromJson(Map<String, dynamic> json) {
  return Settings(
    internalInterest:
        LoanInterest.loanInterestFromInt(json['internalInterest'] as int),
    externalInterest:
        LoanInterest.loanInterestFromInt(json['externalInterest'] as int),
    monthlyPaymentValue: (json['monthlyPaymentValue'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$SettingsToJson(Settings instance) => <String, dynamic>{
      'internalInterest':
          LoanInterest.loanInterestToInt(instance.internalInterest),
      'externalInterest':
          LoanInterest.loanInterestToInt(instance.externalInterest),
      'monthlyPaymentValue': instance.monthlyPaymentValue,
    };

// **************************************************************************
// DataGenerator
// **************************************************************************

abstract class _$SettingsLombok {
  /// Field
  LoanInterest internalInterest;
  LoanInterest externalInterest;
  double monthlyPaymentValue;

  /// Setter

  void setInternalInterest(LoanInterest internalInterest) {
    this.internalInterest = internalInterest;
  }

  void setExternalInterest(LoanInterest externalInterest) {
    this.externalInterest = externalInterest;
  }

  void setMonthlyPaymentValue(double monthlyPaymentValue) {
    this.monthlyPaymentValue = monthlyPaymentValue;
  }

  /// Getter
  LoanInterest getInternalInterest() {
    return internalInterest;
  }

  LoanInterest getExternalInterest() {
    return externalInterest;
  }

  double getMonthlyPaymentValue() {
    return monthlyPaymentValue;
  }
}
