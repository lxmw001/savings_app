import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:savings_app/model/Period.dart';
import 'package:savings_app/model/Settings.dart';
import 'package:savings_app/services/FirestoreService.dart';
import 'package:savings_app/services/PeriodService.dart';
import 'package:savings_app/services/SettingsService.dart';

class AppState with ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _loggedIn = false;
  bool _loading = false;
  FirebaseUser _user;

  bool isLoggedIn() => _loggedIn;

  bool isLoading() => _loading;

  FirebaseUser getCurrentUser() => _user;

  void login() async {
    _loading = true;
    notifyListeners();

    _user = await _handleSignIn();

    if (_user != null) {
      FirestoreService.createService(_user.uid);
      await _getPeriods();
      await _getSettings();

      _loading = false;
      _loggedIn = true;
      notifyListeners();
    } else {
      _loading = false;
      notifyListeners();
    }
  }

  void logout() {
    _googleSignIn.signOut();
    _loggedIn = false;
    notifyListeners();
  }

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  Future<void> _getSettings() {
    return SettingsService.getSettings().then((DocumentSnapshot settings) {
      print("Settings retreived: " + settings.data.toString());
      if (settings.data == null) {
        SettingsService.createDefaultSettings();
      } else {
        SettingsService.settings = new Settings.fromJson(settings.data);
      }
      return;
    });
  }

  Future<void> _getPeriods() {
    return PeriodService.getPeriods().first.then((QuerySnapshot snapshot) {
      if (snapshot.documents.length == 0) {
        print('Creating Period');
        PeriodService.createPeriod();
        return;
      }
      DocumentSnapshot documentPeriod = snapshot.documents.firstWhere(
          (doc) => doc.documentID == PeriodService.generatePeriod().getKey());
      print('Period found: ' + documentPeriod.data.toString());
      PeriodService.setPeriod(Period.fromJson(documentPeriod.data));
      return;
    });
  }
}
