import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  static DocumentReference userDocument;

  static createService(userId) {
    userDocument = Firestore.instance.collection('users')
        .document(userId);
  }

  static DocumentReference settingsReference() {
    return userDocument.collection('settings').document('business');
  }

  static Stream<DocumentSnapshot> getSettings() {
    return settingsReference().snapshots();
  }

  static CollectionReference partnersReference() {
    return userDocument.collection('partners');
  }

  static CollectionReference loansReference() {
    return userDocument.collection('loans');
  }
}