import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savings_app/constants/PaymentState.dart';
import 'package:savings_app/model/Loan.dart';
import 'package:savings_app/model/Partner.dart';
import 'package:savings_app/model/Payment.dart';
import 'package:savings_app/services/FirestoreService.dart';
import 'package:savings_app/services/SettingsService.dart';
import 'package:savings_app/utils/DateUtils.dart';

class PaymentService {
  static List<Payment> payments = [];

  static void generatePaymentForPartner(Partner partner) {
    List<DateTime> months =
        DateUtils.calculateMonthsInterval();

    months.forEach((month) {
      Payment payment = new Payment(
          date: month,
          value: SettingsService.settings.getMonthlyPaymentValue());
      payment.setPartner(partner);
      FirestoreService.paymentsReference().add(payment.toJson());
    });
  }

  static void generatePaymentForLoan(Loan loan) {
    List<DateTime> months =
    DateUtils.calculateNextMonthsInterval(loan.getPaymentsNumber());

    months.forEach((month) {
      Payment payment = new Payment(
        date: month,
        value: loan.getPaymentValue());
      payment.setPartner(loan.getPartner());
      payment.setLoan(loan);
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
    return payments.where((payment) {
      bool matched = payment.partner.getId() == partner.getId();
      if(matched) {
        payment.setPartner(partner);
      }
      return matched;
    }).toList();
  }

  static List<Payment> getCurrentPayments(Partner partner) {
    return getPaymentsForPartner(partner).where((payment) {
      var now = new DateTime.now();
      var isPending = payment.getState() == PaymentState.PENDING;
      var isBefore = payment.getDate().month < now.month;
      var isCurrent = payment.getDate().month == now.month;
      var ret =  isCurrent ? isCurrent: isBefore && isPending;
//      if(payment.getState() == PaymentState.COMPLETE) {
//        print('=========================');
//        print('Payment id: ' + payment.getId());
//        print('Payment value: ' + payment.getValue().toString());
//        print('=========================');
//      }
//      if(partner.getId() == 'CBuaaG0tXMzrpgcg2m69' && ret) {
//        print('Socio: ' + partner.getName());
//        print('Payament ID ' + payment.getId().toString());
//        print('Payament Value ' + payment.getValue().toString());
//      }
      return ret;
    }).toList();
  }

  static List<Payment> getCompletedPayments() {
    return payments.where((payment) {
      return payment.getState() == PaymentState.COMPLETE;
    }).toList();
  }

  static double getNextMonthTotalPayments() {
    var nextMonthPayments = payments.where((payment) {
      return payment.getDate().month == (DateTime.now().month + 1);
    }).toList();

    return nextMonthPayments.fold(0, (total, Payment payment) => total + payment.getValue());
  }

  static void updatePayment(Payment payment) {
    FirestoreService.paymentsReference()
      .document(payment.getId())
      .updateData(payment.toJson());
  }


  static Stream<QuerySnapshot> getPayments() {
    return FirestoreService.paymentsReference().snapshots();
  }

  static void loadPayments() {
    getPayments().listen((QuerySnapshot event) {
      loadFromDocumentList(event.documents);
    });
  }

  static void reset() {
    payments = [];
  }
}
