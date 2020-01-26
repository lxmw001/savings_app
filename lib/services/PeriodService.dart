import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savings_app/model/Period.dart';
import 'package:savings_app/services/FirestoreService.dart';

class PeriodService {
  static Period period;

  static void createPeriod() {
    Period newPeriod = generatePeriod();

    FirestoreService.periodsReference()
        .document(newPeriod.getKey())
        .setData(newPeriod.toJson());
    FirestoreService.createPeriodService(newPeriod.getKey());
  }

  static Period generatePeriod() {
    DateTime now = new DateTime.now();
    int currentYear = now.year;
    var from = new DateTime(currentYear, 1, 1);
    var to = new DateTime(currentYear + 1, 1, 0);

    return new Period(from: from, to: to);
  }

  static void setPeriod(Period newPeriod) {
    period = newPeriod;
    FirestoreService.createPeriodService(newPeriod.getKey());
  }

  static Stream<QuerySnapshot> getPeriods() {
    return FirestoreService.periodsReference().snapshots();
  }

  static void reset() {
    period = new Period();
  }
}
