import 'package:flutter/material.dart';
import 'package:savings_app/model/LoanInterest.dart';

class SettingsState with ChangeNotifier {
  LoanInterest internal;
  LoanInterest external;
  double monthlyPaymentValue;


  LoanInterest getInternalInterest() => internal;
  LoanInterest getExternalInterest() => external;
  double getMonthlyPaymentValue() => monthlyPaymentValue;

}
