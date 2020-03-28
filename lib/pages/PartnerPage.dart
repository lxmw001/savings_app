import 'package:flutter/material.dart';
import 'package:savings_app/design/PaletteColors.dart';
import 'package:savings_app/model/Partner.dart';
import 'package:savings_app/services/PartnerService.dart';
import 'package:savings_app/widgets/MyAppBar.dart';

import '../widgets/PartnerItem.dart';
import '../widgets/SideMenu.dart';

class PartnerPage extends StatefulWidget {
  @override
  _PartnerPageState createState() => _PartnerPageState();
}

class _PartnerPageState extends State<PartnerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(text: 'Socios'),
      drawer: SideMenu(),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: PartnerService.partners.length,
        itemBuilder: (context, index) {
          Partner partner = PartnerService.partners.elementAt(index);
          return PartnerItem(
              partner: partner,
              onTap: () {
                Navigator.pushNamed(context, 'addPartner', arguments: partner);
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'addPartner',
            arguments: new Partner()),
        tooltip: 'Nuevo Socio',
        child: Icon(Icons.add),
      ),
    );
  }
}
