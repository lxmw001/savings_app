import 'package:json_annotation/json_annotation.dart';
import 'package:lombok/lombok.dart';
import 'package:savings_app/model/BasicModel.dart';
import 'package:savings_app/model/LoanInterest.dart';
import 'package:savings_app/model/Partner.dart';

part 'Loan.g.dart';

@data
@toString
@JsonSerializable()
class Loan extends BasicModel with _$LoanLombok {
  String type;
  double value;
  int paymentsNumber;
  DateTime date;
  double debt;
  double paymentValue;
  @JsonKey(
      fromJson: LoanInterest.loanInterestFromInt,
      toJson: LoanInterest.loanInterestToInt)
  LoanInterest interest;
  Partner partner;

  Loan({this.interest}) {
    this.date = new DateTime.now();
    this.value = 0;
    this.paymentsNumber = 0;
    this.paymentValue = 0;
  }

  factory Loan.fromJson(Map<String, dynamic> json) => _$LoanFromJson(json);

  Map<String, dynamic> toJson() => _$LoanToJson(this);

  /*Functions*/
  double calculateInterest() {
    return value * (interest.value / 100);
  }

  double calculateValueToPay() {
    return value + (calculateInterest() * paymentsNumber);
  }

  void calculatePaymentsValue() {
    this.paymentValue = calculateValueToPay() / paymentsNumber;
  }
}
