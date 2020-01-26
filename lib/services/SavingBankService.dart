import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savings_app/model/SavingBank.dart';
import 'package:savings_app/services/FirestoreService.dart';
import 'package:savings_app/services/PaymentService.dart';

class SavingBankService {
  
    static SavingBank savingBank;

    static void updateSavingBank(double paymentValue) {
      savingBank.setTotal(savingBank.getTotal() + paymentValue);
      FirestoreService.savingBankReference().updateData(savingBank.toJson());
    }

    static Future<DocumentSnapshot> getSavingBank() {
      return FirestoreService.getSavingBank().first;
    }

    static createDefaultSavingBank() {
      savingBank = new SavingBank();
      FirestoreService.savingBankReference().setData(savingBank.toJson());
    }
}
