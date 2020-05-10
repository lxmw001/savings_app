import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savings_app/model/Loan.dart';
import 'package:savings_app/model/Payment.dart';
import 'package:savings_app/model/SavingBank.dart';
import 'package:savings_app/services/FirestoreService.dart';
import 'package:savings_app/services/LoanService.dart';
import 'package:savings_app/services/PaymentService.dart';

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

  static regenerateData() {
    List<Payment> completedPayments = PaymentService.getCompletedPayments();
    List<Loan> loans = LoanService.loans;

    var totalPayments = completedPayments.fold(0, (total, Payment payment) => total + payment.getValue());
    var totalLoans = loans.fold(0, (total, Loan loan) => total + loan.getValue());
    var interestLoans = loans.fold(0, (total, Loan loan) => total + loan.getInterestValue());
    savingBank = new SavingBank(total:  totalPayments, loanValues: totalLoans, interestValues: interestLoans);
    FirestoreService.savingBankReference().setData(savingBank.toJson());
  }

  static void reset() {
    savingBank = new SavingBank();
  }
}
