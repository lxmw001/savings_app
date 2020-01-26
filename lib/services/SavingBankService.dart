import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savings_app/model/Loan.dart';
import 'package:savings_app/model/SavingBank.dart';
import 'package:savings_app/services/FirestoreService.dart';

class SavingBankService {
  static SavingBank savingBank;

  static void updateSavingBank(double paymentValue) {
    savingBank.setTotal(savingBank.getTotal() + paymentValue);
    FirestoreService.savingBankReference().updateData(savingBank.toJson());
  }

  static void updateWithLoan(Loan loan) {
    print('bank: ' + savingBank.toJson().toString());
    savingBank.setLoanValues(savingBank.getLoanValues() + loan.getValue());
    savingBank.setInterestValues(savingBank.getInterestValues() + loan.getInterestValue());
    FirestoreService.savingBankReference().updateData(savingBank.toJson());
  }

  static Future<DocumentSnapshot> getSavingBank() {
    return FirestoreService.getSavingBank().first;
  }

  static createDefaultSavingBank() {
    savingBank = new SavingBank();
    FirestoreService.savingBankReference().setData(savingBank.toJson());
  }

  static void reset() {
    savingBank = new SavingBank();
  }
}
