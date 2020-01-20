import 'package:flutter/material.dart';
import 'package:savings_app/widgets/LoanItem.dart';
import '../widgets/SideMenu.dart';

class LoanPage extends StatefulWidget {
  @override
  _LoanPageState createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  var items = new List<int>.generate(10, (i) => i + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prestamos'),
      ),
      drawer: SideMenu(),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return LoanItem(
              value: 300, interest: 3, paymentsNumber: 3, onTap: () => {});
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Nuevo Prestamo',
        child: Icon(Icons.add),
      ),
    );
  }
}
