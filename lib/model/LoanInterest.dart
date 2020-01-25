import 'package:json_annotation/json_annotation.dart';
import 'package:lombok/lombok.dart';
import 'package:savings_app/constants/LoanInterestTypes.dart';
import 'package:savings_app/services/SettingsService.dart';

part 'LoanInterest.g.dart';

@data
@toString
@JsonSerializable()
class LoanInterest with _$LoanInterestLombok {
  String type;
  int value;

  LoanInterest({this.type, this.value = 0});

  factory LoanInterest.fromJson(Map<String, dynamic> json) =>
      _$LoanInterestFromJson(json);

  Map<String, dynamic> toJson() => _$LoanInterestToJson(this);


  static LoanInterest loanInterestFromType(String type) =>
    type == LoanInterestTypes.INTERNAL
      ? SettingsService.settings.internalInterest
      : SettingsService.settings.externalInterest;

  static String loanInterestToType(LoanInterest interest) => interest?.getType();

  static LoanInterest loanInterestFromIntAndType(String type, int value) => new LoanInterest(type: type, value: value);

  static int loanInterestToInt(LoanInterest interest) => interest?.getValue();
}
