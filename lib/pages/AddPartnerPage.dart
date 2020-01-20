import 'package:flutter/material.dart';

class AddPartnerPage extends StatefulWidget {
  @override
  _AddPartnerPageState createState() => _AddPartnerPageState();
}

class _AddPartnerPageState extends State<AddPartnerPage> {
  String name = "";
  String phoneNumber = "";
  String email = "";

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Socio'),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: key,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: TextFormField(
                    onSaved: (value) => name = value,
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    onSaved: (value) => phoneNumber = value,
                    decoration: InputDecoration(
                      labelText: 'Teléfono',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    onSaved: (value) => email = value,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
