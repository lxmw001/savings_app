import 'package:lombok/lombok.dart';
import './LoanInterest.dart';

//not woks
@data
class Loan {
  String type;
  double value;
  int paymentsNumber;
  DateTime date;
  double debt;
  double paymentValue;
  LoanInterest interest;

  Loan({this.interest}) {
    this.date = new DateTime.now();
    this.value = 0;
    this.paymentsNumber = 0;
    this.paymentValue = 0;
  }

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

  /*Getters and Setters*/
  void setValue(value) {
    this.value = value;
  }

  double getValue() {
    return this.value;
  }

  void setInterest(interest) {
    this.interest = interest;
  }

  LoanInterest getInterest() {
    return this.interest;
  }

  void setPaymentsNumber(paymentsNumber) {
    this.paymentsNumber = paymentsNumber;
  }

  int getPaymentsNumber() {
    return this.paymentsNumber;
  }

  double getPaymentValue() {
    return this.paymentValue;
  }


}
