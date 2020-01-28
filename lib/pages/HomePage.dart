import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:savings_app/design/PaletteColors.dart';
import 'package:savings_app/model/SavingBank.dart';
import 'package:savings_app/services/SavingBankService.dart';
import 'package:savings_app/widgets/DashboardBox.dart';
import 'package:savings_app/widgets/MyAppBar.dart';

import '../widgets/SideMenu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  myBox(title, value) {
    return DashboardBox(title: title, value: value);
  }

  @override
  Widget build(BuildContext context) {
    SavingBank bank = SavingBankService.savingBank;
    return Scaffold(
        appBar: MyAppBar(text: 'Home'),
        drawer: SideMenu(),
        body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: <Widget>[
            myBox("Capital", bank.getTotal()),
            myBox("Disponible", bank.getAvailableValue()),
            myBox("Prestamos", bank.getLoanValues()),
            myBox("Ganancias", bank.getInterestValues()),
          ],
          staggeredTiles: [
            StaggeredTile.extent(2, 180),
            StaggeredTile.extent(2, 160),
            StaggeredTile.extent(1, 160),
            StaggeredTile.extent(1, 160),
          ],
        ));
  }
}
