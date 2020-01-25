import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savings_app/model/Partner.dart';
import 'package:savings_app/services/FirestoreService.dart';

class PartnerService {
  static void createOrUpdate(Partner partner) {
    if (partner.getId() == null) {
      createPartner(partner);
    } else {
      updatePartner(partner);
    }
  }

  static void createPartner(Partner partner) {
    FirestoreService.partnersReference().add(partner.toJson());
  }

  static void updatePartner(Partner partner) {
    FirestoreService.partnersReference()
        .document(partner.getId())
        .updateData(partner.toJson());
  }

  static Stream<QuerySnapshot> getPartners() {
    return FirestoreService.partnersReference().snapshots();
  }
}
