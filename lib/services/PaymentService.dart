import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savings_app/constants/PaymentState.dart';
import 'package:savings_app/model/Partner.dart';
import 'package:savings_app/model/Payment.dart';
import 'package:savings_app/services/FirestoreService.dart';
import 'package:savings_app/services/PeriodService.dart';
import 'package:savings_app/services/SettingsService.dart';
import 'package:savings_app/utils/DateUtils.dart';

class PaymentService {
  static List<Payment> payments = [];

  static void generatePaymentForPartner(Partner partner) {
    List<DateTime> months =
        DateUtils.calculateDaysInterval(PeriodService.period.getFrom().year);

    months.forEach((month) {
      Payment payment = new Payment(
          date: month,
          value: SettingsService.settings.getMonthlyPaymentValue());
      payment.setPartner(partner);
      FirestoreService.paymentsReference().add(payment.toJson());
    });
  }

  static List<Payment> loadFromDocumentList(List<DocumentSnapshot> documents) {
    List<Payment> paymentList = [];
    documents.forEach ((paymentDocument) {
      Payment payment = Payment.fromJson(paymentDocument.data);
      payment.setId(paymentDocument.documentID);
      paymentList.add(payment);
    });
    payments = paymentList;

    return paymentList;
  }

  static String getStatePayments(List<Payment> payments) {
    var filtered = payments.where((payment) {
      var isPending = payment.getState() == PaymentState.PENDING;
      var now = new DateTime.now();
       var isCurrent = payment.getDate().month == now.month;
       return isPending && isCurrent;
    }).toList();

    return filtered.length > 0 ? PaymentState.PENDING : PaymentState.COMPLETE;
  }

  static List<Payment> getPaymentsForPartner(Partner partner) {
    return payments.where((payment) => payment.partner.getId() == partner.getId()).toList();
  }

  static List<Payment> getCurrentPayments(Partner partner) {
    return getPaymentsForPartner(partner).where((payment) {
      var now = new DateTime.now();
      var isPending = payment.getState() == PaymentState.PENDING;
      var isBefore = payment.getDate().month < now.month;
      var isCurrent = payment.getDate().month == now.month;
      return isCurrent ? isCurrent: isBefore && isPending;
    }).toList();
  }

  static void updatePayment(Payment payment) {
    FirestoreService.paymentsReference()
      .document(payment.getId())
      .updateData(payment.toJson());
  }


  static Stream<QuerySnapshot> getPayments() {
    return FirestoreService.paymentsReference().snapshots();
  }
}
