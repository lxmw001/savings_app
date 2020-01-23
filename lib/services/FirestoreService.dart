import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  static DocumentReference userDocument;

  static createService(userId) {
    userDocument = Firestore.instance.collection('users')
        .document(userId);
  }

  static Stream<DocumentSnapshot> getSettings() {
    return userDocument.collection('settings').document('business').snapshots();
  }
}