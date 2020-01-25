import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:savings_app/constants/LoanInterestTypes.dart';
import 'package:savings_app/model/Loan.dart';
import 'package:savings_app/model/LoanInterest.dart';
import 'package:savings_app/model/Partner.dart';
import 'package:savings_app/model/Settings.dart';
import 'package:savings_app/services/LoanService.dart';
import 'package:savings_app/services/PartnerService.dart';
import 'package:savings_app/services/SettingsService.dart';

class AddLoanPage extends StatefulWidget {
  @override
  _AddLoanPageState createState() => _AddLoanPageState();
}

class _AddLoanPageState extends State<AddLoanPage> {
  String partnerId;
  double paymentValue = 0;
  Loan loan;
  Settings settings;

  bool isInitialized = false;

  final key = GlobalKey<FormState>();

  changeInterest(String interestType) {
    print('type: ' + interestType);
    LoanInterest interest = interestType == LoanInterestTypes.INTERNAL
        ? settings.getInternalInterest()
        : settings.getExternalInterest();
    print('interest to set: ' + interest.getType());
    loan.setInterest(interest);
    updatePaymentValue();
  }

  updatePaymentValue() {
    loan.calculatePaymentsValue();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!isInitialized) {
      isInitialized = true;
      loan = ModalRoute.of(context).settings.arguments;
      settings = SettingsService.settings;
      print(loan.toString());

      partnerId = loan.getPartner().getId();
    }

    bool isNewLoan = loan.getId() == null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isNewLoan ? 'Nuevo Préstamo' : 'Editar Préstamo'),
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
                  title: StreamBuilder(
                    stream: PartnerService.getPartners(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return const Text('Cargando...');
                      PartnerService.loadFromDocumentList(
                          snapshot.data.documents);
                      final partnersIds = PartnerService.getPartnersIds();
                      return DropdownButtonFormField<String>(
                        items: partnersIds
                            .map<DropdownMenuItem<String>>((String partnerId) {
                          return new DropdownMenuItem<String>(
                              value: partnerId,
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.person),
                                  Text(' ' +
                                      PartnerService.getPartnerFrommId(
                                              partnerId)
                                          .getName()),
                                ],
                              ));
                        }).toList(),
                        onChanged: (String newPartner) =>
                            setState(() => partnerId = newPartner),
                        value: partnerId,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Seleccionar socio',
                            errorText: ''),
                      );
                    },
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
                            value: LoanInterestTypes.INTERNAL,
                            groupValue: loan.getInterest().getType(),
                            onChanged: changeInterest,
                          ),
                          new Text(
                            'Interno',
                            style: new TextStyle(fontSize: 16.0),
                          ),
                          new Radio(
                            value: LoanInterestTypes.EXTERNAL,
                            groupValue: loan.getInterest().getType(),
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
                      Partner partner =
                          PartnerService.getPartnerFrommId(partnerId);
                      loan.setPartner(partner);
                      LoanService.createOrUpdate(loan);
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
