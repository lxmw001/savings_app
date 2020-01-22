import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:savings_app/constants/LoanTypes.dart';
import 'package:savings_app/model/Loan.dart';
import 'package:savings_app/model/LoanInterest.dart';
import 'package:savings_app/model/Partner.dart';

class AddLoanPage extends StatefulWidget {
  @override
  _AddLoanPageState createState() => _AddLoanPageState();
}

class _AddLoanPageState extends State<AddLoanPage> {
  Partner partner;
  double paymentValue = 0;
  Loan loan;

  static LoanInterest interest1 = new LoanInterest(LoanTypes.INTERNAL, 3);
  static LoanInterest interest2 = new LoanInterest(LoanTypes.EXTERNAL, 7);

  final key = GlobalKey<FormState>();
  final partners = [new Partner(name: 'Luis'), new Partner(name: 'Andrea'), new Partner(name: 'Samara')];

  _AddLoanPageState() : this.loan = new Loan(interest: interest1);

  changeInterest(LoanInterest interest) {
    loan.setInterest(interest);
    updatePaymentValue();
  }

  updatePaymentValue() {
    loan.calculatePaymentsValue();
    print(loan.getPaymentValue());
    setState(() {});
  }

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
                    items: partners.map((Partner partnerItem) {
                      return new DropdownMenuItem(
                          value: partnerItem,
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.star),
                              Text(partnerItem.getName()),
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
                    initialValue: loan.getValue().toString(),
                    onChanged: (newValue) {
                      loan.setValue(double.tryParse(newValue));
                      updatePaymentValue();
                    },
                    decoration: InputDecoration(
                      labelText: 'Valor',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    initialValue: loan.getPaymentsNumber().toString(),
                    onChanged: (value) {
                      loan.setPaymentsNumber(int.tryParse(value));
                      updatePaymentValue();
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
                            value: interest1,
                            groupValue: loan.getInterest(),
                            onChanged: changeInterest,
                          ),
                          new Text(
                            'Interno',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                          new Radio(
                            value: interest2,
                            groupValue: loan.getInterest(),
                            onChanged: changeInterest,
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
                  title: Text("Valor de la cuota"),
                  subtitle: Text(loan.getPaymentValue().toString()),
                ),
                ListTile(
                  title: Text("Total a pagar"),
                  subtitle: Text(loan.calculateValueToPay().toString()),
                ),
                ListTile(
                  title: RaisedButton(
                    child: Text("Guardar"),
                    onPressed: () {
                      this.key.currentState.save();
                      loan.setPartner(partner);
                      //save in firebase
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
