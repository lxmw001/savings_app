import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:savings_app/constants/DefaultSettings.dart';
import 'package:savings_app/model/Settings.dart';
import 'package:savings_app/services/FirestoreService.dart';

class SettingsService {
  static Settings settings;

  static void updateSettings(Settings sets) {
    settings = sets;
    FirestoreService.settingsReference().updateData(settings.toJson());
  }

  static Future<DocumentSnapshot> getSettings() {
    return FirestoreService.getSettings().first;
  }

  static createDefaultSettings() {
    settings = new Settings(
        internalInterest: DefaultSettings.internalInterest,
        externalInterest: DefaultSettings.externalInterest,
        monthlyPaymentValue: DefaultSettings.monthlyPayment);
    FirestoreService.settingsReference().setData(settings.toJson());
  }

  static void reset() {
    settings = new Settings();
  }
}
