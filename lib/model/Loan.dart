import 'package:lombok/lombok.dart';
import './LoanInterest.dart';

@data
class Loan {
  String type;
  double value;
  int paymentsNumber;
  DateTime date;
  double debt;
  double paymentValue;
  LoanInterest interest;

  Loan() {
    this.date = new DateTime.now();
    this.value = 0;
    this.paymentsNumber = 0;
  }

  double calculatePaymentsValue() {
    double totalLoan =  value + interest.value;
    return totalLoan / paymentsNumber;
  }
}
