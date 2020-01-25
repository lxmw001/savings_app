import 'package:json_annotation/json_annotation.dart';
import 'package:lombok/lombok.dart';
import 'package:savings_app/constants/LoanInterestTypes.dart';
import 'package:savings_app/model/LoanInterest.dart';

part 'Settings.g.dart';

@data
@toString
@JsonSerializable()
class Settings with _$SettingsLombok {
  @JsonKey(
      fromJson: _internalInterestFromInt,
      toJson: LoanInterest.loanInterestToInt)
  LoanInterest internalInterest;
  @JsonKey(
      fromJson: _externalInterestFromInt,
      toJson: LoanInterest.loanInterestToInt)
  LoanInterest externalInterest;
  double monthlyPaymentValue;

  Settings(
      {this.internalInterest, this.externalInterest, this.monthlyPaymentValue});

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsToJson(this);

  static LoanInterest _internalInterestFromInt(int value) {
    return LoanInterest.loanInterestFromIntAndType(
        LoanInterestTypes.INTERNAL, value);
  }

  static LoanInterest _externalInterestFromInt(int value) {
    return LoanInterest.loanInterestFromIntAndType(
        LoanInterestTypes.EXTERNAL, value);
  }
}
