import 'package:flutter/material.dart';
import 'package:savings_app/model/Loan.dart';
import 'package:savings_app/services/LoanService.dart';
import 'package:savings_app/services/SettingsService.dart';
import 'package:savings_app/widgets/LoanItem.dart';

import '../widgets/SideMenu.dart';

class LoanPage extends StatefulWidget {
  @override
  _LoanPageState createState() => _LoanPageState();
}

class _LoanPageState extends State<LoanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prestamos'),
      ),
      drawer: SideMenu(),
      body: StreamBuilder(
        stream: LoanService.getLoans(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Text('Cargando...');
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              Loan loan = Loan.fromJson(snapshot.data.documents[index].data);
              loan.setId(snapshot.data.documents[index].documentID);
              return LoanItem(
                  loan: loan,
                  onTap: () {
                    Navigator.pushNamed(context, 'addLoan', arguments: loan);
                  });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'addLoan',
            arguments: new Loan(
                interest: SettingsService.settings.getInternalInterest())),
        tooltip: 'Nuevo Prestamo',
        child: Icon(Icons.add),
      ),
    );
  }
}
