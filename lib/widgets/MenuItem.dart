import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onTap;

  MenuItem({this.text, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: new ListTile(leading: Icon(this.icon), title: Text(this.text)),
      onTap: this.onTap,
    );
  }
}
