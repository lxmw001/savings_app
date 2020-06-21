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
  double valueToPay;
  int paymentsNumber;
  DateTime date;
  double debt;
  double paymentValue;
  double interestValue;
  @JsonKey(
      fromJson: LoanInterest.loanInterestFromType,
      toJson: LoanInterest.loanInterestToType)
  LoanInterest interest;
  @JsonKey(
    fromJson: Partner.partnerFromId,
    toJson: Partner.partnerToId)
  Partner partner;

  Loan({this.interest}) {
    this.date = new DateTime.now();
    this.value = 0;
    this.paymentsNumber = 0;
    this.paymentValue = 0;
    this.interestValue = 0;
    this.partner = new Partner();
  }

  factory Loan.fromJson(Map<String, dynamic> json) => _$LoanFromJson(json);

  Map<String, dynamic> toJson() => _$LoanToJson(this);


  static Loan loanFromId(String id) {
    Loan loan = new Loan();
    loan.setId(id);
    return loan;
  }

  static String loanToId(Loan loan) => loan?.getId();

  double calculateInterest() {
    return (value != null ? value : 0) * (interest.value / 100).ceilToDouble();
  }

  double calculateValueToPay() {
    valueToPay = value + (calculateInterest() * paymentsNumber);
    interestValue = valueToPay - value;
    return valueToPay.ceilToDouble();
  }

  void calculatePaymentsValue() {
    this.paymentValue =
        paymentsNumber != 0
          ? (calculateValueToPay() / paymentsNumber).ceilToDouble()
          : 0;
  }
}
