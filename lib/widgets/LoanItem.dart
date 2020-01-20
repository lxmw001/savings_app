import 'package:flutter/material.dart';

class LoanItem extends StatelessWidget {
  final double value;
  final int interest;
  final int paymentsNumber;
  final Function onTap;

  LoanItem({this.value, this.interest, this.paymentsNumber, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 8.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
        child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          right: new BorderSide(
                              width: 1.0, color: Colors.white24))),
                  child: Icon(Icons.attach_money, color: Colors.white),
                ),
                title: Text(
                  "Valor: " + this.value.toString(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Interés: " + this.interest.toString() + "%",
                        style: TextStyle(color: Colors.white)),
                    Text("Número de cuotas: " + this.paymentsNumber.toString(),
                        style: TextStyle(color: Colors.white))
                  ],
                ),
                trailing: Icon(Icons.keyboard_arrow_right,
                    color: Colors.white, size: 30.0))));
  }
}
