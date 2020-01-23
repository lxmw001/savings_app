import 'package:savings_app/constants/LoanTypes.dart';
import 'package:savings_app/model/LoanInterest.dart';

class Settings {
  LoanInterest internalInterest;
  LoanInterest externalInterest;
  double monthlyPaymentValue;

  Settings({
    this.internalInterest,
    this.externalInterest,
    this.monthlyPaymentValue
  });

  factory Settings.fromJson(Map<String, dynamic> settingsMap){
    return Settings(
        internalInterest: new LoanInterest(LoanTypes.INTERNAL, settingsMap['internalInterest']) ,
        externalInterest: new LoanInterest(LoanTypes.EXTERNAL, settingsMap['externalInterest']) ,
        monthlyPaymentValue: settingsMap['monthlyPayment']
    );
  }

  void setInternalInterest(internalInterest) {
    this.internalInterest = internalInterest;
  }

  void setExternalInterest(externalInterest) {
    this.externalInterest = externalInterest;
  }

  LoanInterest getInternalInterest() => internalInterest;

  LoanInterest getExternalInterest() => externalInterest;
}
