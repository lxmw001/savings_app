import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:savings_app/constants/LoanTypes.dart';
import 'package:savings_app/model/Loan.dart';
import 'package:savings_app/model/LoanInterest.dart';

class AddLoanPage extends StatefulWidget {
  @override
  _AddLoanPageState createState() => _AddLoanPageState();
}

class _AddLoanPageState extends State<AddLoanPage> {
  String partner; // TODO: change it for Partner
//  double value = 0;
//  int paymentsNumber = 3;
//  String type = LoanTypes.INTERNAL; //TODO: use constants
  Loan loan = new Loan();
  LoanInterest interest = new LoanInterest(LoanTypes.INTERNAL, 0);

  final key = GlobalKey<FormState>();
  final partners = ['Luis', 'Andrea', 'Samara'];

  _AddLoanPageState() : this.loan = new Loan(), ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Préstamo'),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: key,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Socio:",
                    style: new TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: DropdownButtonFormField(
                    items: partners.map((String partnerItem) {
                      return new DropdownMenuItem(
                          value: partnerItem,
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.star),
                              Text(partnerItem),
                            ],
                          ));
                    }).toList(),
                    onChanged: (newPartner) {
                      // do other stuff with _category
                      setState(() => partner = newPartner);
                    },
                    value: partner,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'Seleccionar socio',
                        errorText: ''),
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    onSaved: (newValue) => loan.setValue(double.tryParse(newValue)),
                    decoration: InputDecoration(
                      labelText: 'Valor',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ], // Only number
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    onSaved: (value) => paymentsNumber = int.tryParse(value),
                    onChanged: (value) {

                    },
                    decoration: InputDecoration(
                      labelText: 'Numero de cuotas',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ], // Onl
                  ),
                ),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      new Text(
                        'Tipo de Prestamo:',
                        style: new TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Radio(
                            value: LoanTypes.INTERNAL,
                            groupValue: type,
                            onChanged: (value) { setState(() => type = value);},
                          ),
                          new Text(
                            'Interno',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                          new Radio(
                            value: LoanTypes.EXTERNAL,
                            groupValue: type,
                            onChanged: (value) { setState(() => type = value);},
                          ),
                          new Text(
                            'Externo',
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: RaisedButton(
                    child: Text("Guardar"),
                    onPressed: () {
                      this.key.currentState.save();
                      //Partner partner = new Partner(name, phoneNumber, email);
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
