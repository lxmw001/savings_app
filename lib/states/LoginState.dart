import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:savings_app/services/FirestoreService.dart';
import 'package:savings_app/states/SettingsState.dart';

class LoginState with ChangeNotifier {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _loggedIn = false;
  bool _loading = false;
  FirebaseUser _user;
  SettingsState _settings;

  bool isLoggedIn() => _loggedIn;
  bool isLoading() => _loading;
  FirebaseUser getCurrentUser() => _user;

  void login() async {
    _loading = true;
    notifyListeners();

    _user = await _handleSignIn();

    if(_user != null) {
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
    FirestoreService.createService(_user.uid);
    var completer = new Completer<void>();
    FirestoreService.getSettings().listen((data) {
      print("DataReceived: " + data.data.toString());
      //set settings here

      completer.complete();
    });
    return completer.future;
  }
}
