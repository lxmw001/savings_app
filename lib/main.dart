import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/LoginPage.dart';
import 'pages/HomePage.dart';
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
          '/': (BuildContext context) {
            var state = Provider.of<LoginState>(context);
            if (state.isLoggedIn()) {
              return HomePage(title: "Home");
            } else {
              return LoginPage();
            }
          },
        },
      ),
    );
  }
}

