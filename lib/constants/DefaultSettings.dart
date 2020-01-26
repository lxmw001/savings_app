import 'package:savings_app/constants/LoanInterestTypes.dart';
import 'package:savings_app/model/LoanInterest.dart';

class DefaultSettings {
  static LoanInterest internalInterest = new LoanInterest(type: LoanInterestTypes.INTERNAL, value: 3);
  static LoanInterest externalInterest = new LoanInterest(type: LoanInterestTypes.EXTERNAL, value: 7);
  static double monthlyPayment = 50;
}