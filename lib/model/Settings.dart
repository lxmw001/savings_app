import 'package:json_annotation/json_annotation.dart';
import 'package:lombok/lombok.dart';
import 'package:savings_app/model/LoanInterest.dart';

part 'Settings.g.dart';

@data
@toString
@JsonSerializable()
class Settings with _$SettingsLombok {
  @JsonKey(
      fromJson: LoanInterest.loanInterestFromInt,
      toJson: LoanInterest.loanInterestToInt)
  LoanInterest internalInterest;
  @JsonKey(
      fromJson: LoanInterest.loanInterestFromInt,
      toJson: LoanInterest.loanInterestToInt)
  LoanInterest externalInterest;
  double monthlyPaymentValue;

  Settings(
      {this.internalInterest, this.externalInterest, this.monthlyPaymentValue});

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsToJson(this);
}
