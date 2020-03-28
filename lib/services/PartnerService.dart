import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savings_app/model/Partner.dart';
import 'package:savings_app/services/FirestoreService.dart';
import 'package:savings_app/services/PaymentService.dart';

class PartnerService {
  static List<Partner> partners;

  static Future createOrUpdate(Partner partner) {
    if (partner.getId() == null) {
      return createPartner(partner);
    }
    return updatePartner(partner);

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

  static Future createPartner(Partner partner) {
    return FirestoreService.partnersReference().add(partner.toJson()).then((partnerCreated) {
      partner.setId(partnerCreated.documentID);
      PaymentService.generatePaymentForPartner(partner);
      return partnerCreated;
    });

  }

  static Future updatePartner(Partner partner) {
    return FirestoreService.partnersReference()
        .document(partner.getId())
        .updateData(partner.toJson());
  }

  static Stream<QuerySnapshot> getPartners() {
    return FirestoreService.partnersReference().snapshots();
  }

  static void loadPartners() {
    getPartners().listen((QuerySnapshot event) {
      loadFromDocumentList(event.documents);
    });
  }


  static void reset() {
    partners = [];
  }
}
