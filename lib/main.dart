import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/LoginPage.dart';
import 'pages/HomePage.dart';
import 'pages/LoanPage.dart';
import 'pages/PartnerPage.dart';
import 'pages/SettingsPage.dart';
import 'states/LoginState.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginState>(
      builder: (BuildContext context) => LoginState(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          // TODO: implement a secured route in utils
          '/': (BuildContext context) {
            var state = Provider.of<LoginState>(context);
            if (state.isLoggedIn()) {
              return HomePage();
            } else {
              return LoginPage();
            }
          },
          'partners': (BuildContext context) {
            var state = Provider.of<LoginState>(context);
            if (state.isLoggedIn()) {
              return PartnerPage();
            } else {
              return LoginPage();
            }
          },
          'loans': (BuildContext context) {
            var state = Provider.of<LoginState>(context);
            if (state.isLoggedIn()) {
              return LoanPage();
            } else {
              return LoginPage();
            }
          },
          'settings': (BuildContext context) => SettingsPage(),
        },
      ),
    );
  }
}
