import 'package:flutter/material.dart';
import 'package:savings_app/model/Settings.dart';
import 'package:savings_app/services/SettingsService.dart';
import 'package:savings_app/widgets/MyAppBar.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Settings settings;

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    settings = SettingsService.settings;

    return Scaffold(
      appBar: MyAppBar(text: 'Ajustes'),
      body: SingleChildScrollView(
        child: Form(
            key: key,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: TextFormField(
                    initialValue: settings.monthlyPaymentValue.toString(),
                    onSaved: (value) =>
                        settings.setMonthlyPaymentValue(double.parse(value)),
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
                    onSaved: (value) => settings
                        .getInternalInterest()
                        .setValue(int.tryParse(value)),
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
                    onSaved: (value) => settings
                        .getExternalInterest()
                        .setValue(int.tryParse(value)),
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
                      SettingsService.updateSettings(settings);
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
