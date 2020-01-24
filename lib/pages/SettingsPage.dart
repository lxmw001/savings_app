import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savings_app/model/Settings.dart';
import '../states/AppState.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String internal;
  String external;
  double monthlyPaymentValue;
  Settings settings = new Settings();

  final key = GlobalKey<FormState>();

  @override
  void initState() {
    settings = Provider.of<AppState>(context, listen: false).getSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: key,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: TextFormField(
                    initialValue: settings.monthlyPaymentValue.toString(),
                    onSaved: (value) =>
                        monthlyPaymentValue = double.parse(value),
                    decoration: InputDecoration(
                      labelText: 'Cuota mensual',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    initialValue:
                        settings.internalInterest.getValue().toString(),
                    onSaved: (value) => internal = value,
                    decoration: InputDecoration(
                      labelText: 'Interes interno',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    initialValue:
                        settings.externalInterest.getValue().toString(),
                    onSaved: (value) => external = value,
                    decoration: InputDecoration(
                      labelText: 'Interes externo',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ListTile(
                  title: RaisedButton(
                    child: Text("Guardar"),
                    onPressed: () {
                      this.key.currentState.save();
                      settings
                          .getInternalInterest()
                          .setValue(int.tryParse(internal));
                      settings
                          .getExternalInterest()
                          .setValue(int.tryParse(external));
                      settings.setMonthlyPaymentValue(monthlyPaymentValue);
                      Provider.of<AppState>(context, listen: false)
                          .setSettings(settings);

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
