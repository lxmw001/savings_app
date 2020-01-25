import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savings_app/model/Loan.dart';
import 'package:savings_app/services/FirestoreService.dart';

class LoanService {
  static void createOrUpdate(Loan loan) {
    if (loan.getId() == null) {
      createLoan(loan);
    } else {
      updateLoan(loan);
    }
  }

  static void createLoan(Loan loan) {
    FirestoreService.loansReference().add(loan.toJson());
  }

  static void updateLoan(Loan loan) {
    FirestoreService.loansReference()
        .document(loan.getId())
        .updateData(loan.toJson());
  }

  static Stream<QuerySnapshot> getLoans() {
    return FirestoreService.loansReference().snapshots();
  }
}
