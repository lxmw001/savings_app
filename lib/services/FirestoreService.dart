import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static DocumentReference userDocument;
  static DocumentReference periodDocument;

  static createService(userId) {
    userDocument = Firestore.instance.collection('users').document(userId);
  }

  static createPeriodService(periodId) {
    periodDocument = periodsReference().document(periodId);
  }

  static CollectionReference periodsReference() {
    return userDocument.collection('periods');
  }

  static DocumentReference settingsReference() {
    return periodDocument.collection('settings').document('business');
  }

  static Stream<DocumentSnapshot> getSettings() {
    return settingsReference().snapshots();
  }

  static DocumentReference savingBankReference() {
    return periodDocument.collection('savings').document('savings');
  }

  static Stream<DocumentSnapshot> getSavingBank() {
    return savingBankReference().snapshots();
  }

  static CollectionReference partnersReference() {
    return periodDocument.collection('partners');
  }

  static CollectionReference loansReference() {
    return periodDocument.collection('loans');
  }

  static CollectionReference paymentsReference() {
    return periodDocument.collection('payments');
  }
}
