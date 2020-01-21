import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savings_app/constants/MyConstants.dart';
import 'package:savings_app/pages/AddLoanPage.dart';
import 'package:savings_app/pages/AddPartnerPage.dart';
import 'package:savings_app/pages/HomePage.dart';
import 'package:savings_app/pages/LoanPage.dart';
import 'package:savings_app/pages/LoginPage.dart';
import 'package:savings_app/pages/PartnerPage.dart';
import 'package:savings_app/pages/SettingsPage.dart';
import 'package:savings_app/states/LoginState.dart';

void main() => runApp(MyConstants(child: MyApp()));//maybe remove MyConstants

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
          'addPartner': (BuildContext context) => AddPartnerPage(),
          'addLoan': (BuildContext context) => AddLoanPage(),
        },
      ),
    );
  }
}
