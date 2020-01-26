import 'package:flutter/material.dart';
import 'package:savings_app/model/SavingBank.dart';
import 'package:savings_app/services/SavingBankService.dart';

import '../widgets/DashboardBox.dart';
import '../widgets/SideMenu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SavingBank bank = SavingBankService.savingBank;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: SideMenu(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DashboardBox(title: "Capital", value: bank.getTotal()),
            DashboardBox(title: "Disponible", value: bank.getAvailableValue()),
            DashboardBox(title: "Prestamos", value: bank.getLoanValues()),
            DashboardBox(title: "Ganancias", value: bank.getInterestValues()),

          ],
        ),
      ),
    );
  }
}
