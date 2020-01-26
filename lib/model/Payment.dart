import 'package:json_annotation/json_annotation.dart';
import 'package:lombok/lombok.dart';
import 'package:savings_app/constants/PaymentState.dart';
import 'package:savings_app/model/BasicModel.dart';
import 'package:savings_app/model/Loan.dart';
import 'package:savings_app/model/Partner.dart';

part 'Payment.g.dart';

@data
@toString
@JsonSerializable()
class Payment extends BasicModel with _$PaymentLombok {
  DateTime date;
  double value;
  String state;//completed || pending
  @JsonKey(
    fromJson: Partner.partnerFromId,
    toJson: Partner.partnerToId)
  Partner partner;
  @JsonKey(
    fromJson: Loan.loanFromId,
    toJson: Loan.loanToId)
  Loan loan;

  Payment({this.date, this.value = 0, this.state = PaymentState.PENDING});

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}
