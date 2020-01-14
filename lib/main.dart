import 'package:flutter/material.dart';
import 'pages/LoginPage.dart';
import 'pages/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _loggedIn = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (BuildContext context) {
          if(_loggedIn) {
            return HomePage(title: "Home");
          } else {
            return LoginPage();
          }
        }
      },
    );
  }
}
