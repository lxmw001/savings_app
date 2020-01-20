import 'package:flutter/material.dart';
import '../widgets/SideMenu.dart';
import '../widgets/DashboardBox.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: SideMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DashboardBox(title: "Capital", value: 30)
          ],
        ),
      ),
    );
  }
}
