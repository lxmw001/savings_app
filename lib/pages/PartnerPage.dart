import 'package:flutter/material.dart';
import '../widgets/SideMenu.dart';
import '../widgets/PartnerItem.dart';

class PartnerPage extends StatefulWidget {
  @override
  _PartnerPageState createState() => _PartnerPageState();
}

class _PartnerPageState extends State<PartnerPage> {

  List<ListItem> items = List<ListItem>.generate(
  10,
  (i) => i % 6 == 0
  ? HeadingItem("Heading $i")
      : MessageItem("Sender $i", "Message body $i"),
  );
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
          return PartnerItem();
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

abstract class ListItem {}

// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}
