import 'package:json_annotation/json_annotation.dart';
import 'package:lombok/lombok.dart';

part 'LoanInterest.g.dart';

@data
@toString
@JsonSerializable()
class LoanInterest with _$LoanInterestLombok {
  String type;
  int value;

  LoanInterest(this.type, this.value);

  factory LoanInterest.fromJson(Map<String, dynamic> json) =>
      _$LoanInterestFromJson(json);

  Map<String, dynamic> toJson() => _$LoanInterestToJson(this);

  static LoanInterest loanInterestFromInt(int value) =>
      value == null ? null : new LoanInterest('', value);

  static int loanInterestToInt(LoanInterest interest) => interest?.getValue();
}
