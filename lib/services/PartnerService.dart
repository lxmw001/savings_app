import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savings_app/model/Partner.dart';
import 'package:savings_app/services/FirestoreService.dart';

class PartnerService {
  static List<Partner> partners;

  static void createOrUpdate(Partner partner) {
    if (partner.getId() == null) {
      createPartner(partner);
    } else {
      updatePartner(partner);
    }
  }

  static List<Partner> loadFromDocumentList(List<DocumentSnapshot> documents) {
    List<Partner> partnerList = [];
    documents.forEach ((partnerDocument) {
      Partner partner = Partner.fromJson(partnerDocument.data);
      partner.setId(partnerDocument.documentID);
      partnerList.add(partner);
    });
    partners = partnerList;

    return partnerList;
  }

  static getPartnersIds() {
    return partners.map((parent) => parent.getId());
  }

  static Partner getPartnerFrommId(String partnerId) {
    return partners.firstWhere((p) => p.getId() == partnerId);
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
