import 'package:flutter/material.dart';
import '../widgets/SideMenu.dart';
import '../widgets/PartnerItem.dart';

class PartnerPage extends StatefulWidget {
  @override
  _PartnerPageState createState() => _PartnerPageState();
}

class _PartnerPageState extends State<PartnerPage> {

  var items = new List<int>.generate(10, (i) => i + 1);
  //Change for Partner class

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Socios'),
      ),
      drawer: SideMenu(),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return PartnerItem(name: 'Luis', position: 'Presidente', onTap: () => {});
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Nuevo Socio',
        child: Icon(Icons.add),
      ),
    );
  }
}
