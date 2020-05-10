import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savings_app/model/Loan.dart';
import 'package:savings_app/services/FirestoreService.dart';
import 'package:savings_app/services/PaymentService.dart';
import 'package:savings_app/services/SavingBankService.dart';

class LoanService {

  static List<Loan> loans;

  static List<Loan> loadFromDocumentList(List<DocumentSnapshot> documents) {
    List<Loan> loanList = [];
    documents.forEach ((loanDocument) {
      Loan loan = Loan.fromJson(loanDocument.data);
      loan.setId(loanDocument.documentID);
      loanList.add(loan);
    });
    loans = loanList;

    return loanList;
  }


  static void createOrUpdate(Loan loan) {
    if (loan.getId() == null) {
      createLoan(loan);
    } else {
      updateLoan(loan);
    }
  }

  static void createLoan(Loan loan) {
    FirestoreService.loansReference().add(loan.toJson()).then((loanCreated) {
      loan.setId(loanCreated.documentID);
      PaymentService.generatePaymentForLoan(loan);
      SavingBankService.updateWithLoan(loan);
    });
  }

  static void updateLoan(Loan loan) {
    FirestoreService.loansReference()
        .document(loan.getId())
        .updateData(loan.toJson());
  }

  static Stream<QuerySnapshot> getLoans() {
    return FirestoreService.loansReference().snapshots();
  }

  static void loadLoans() {
    getLoans().listen((QuerySnapshot event) {
      loadFromDocumentList(event.documents);
    });
  }

  static void reset() {
    loans = [];
  }
}
