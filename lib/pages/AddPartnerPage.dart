import 'package:flutter/material.dart';
import 'package:savings_app/model/Partner.dart';
import 'package:savings_app/services/PartnerService.dart';

class AddPartnerPage extends StatefulWidget {
  // TODO: add route name to all pagess
  static const routeName = 'editPartner';

  @override
  _AddPartnerPageState createState() => _AddPartnerPageState();
}

class _AddPartnerPageState extends State<AddPartnerPage> {
  Partner partner;

  final key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    partner = ModalRoute.of(context).settings.arguments;
    bool isNewPartner = partner.getId() == null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isNewPartner ? 'Crear Socio' : 'Editar Socio'),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: key,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: TextFormField(
                    initialValue: partner.getName(),
                    onSaved: (value) => partner.setName(value),
                    decoration: InputDecoration(
                      labelText: 'Nombre',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    initialValue: partner.getPhoneNumber(),
                    onSaved: (value) => partner.setPhoneNumber(value),
                    decoration: InputDecoration(
                      labelText: 'Teléfono',
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    initialValue: partner.getEmail(),
                    onSaved: (value) => partner.setEmail(value),
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
                      PartnerService.createOrUpdate(partner);
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
