import 'package:flutter/material.dart';
import 'package:savings_app/constants/PaymentState.dart';
import 'package:savings_app/model/Payment.dart';

class PaymentItem extends StatelessWidget {
  final Payment payment;
  final Function onTap;

  PaymentItem({this.payment, this.onTap});

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
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Icon(Icons.attach_money, color: Colors.white),
          ),
          title: Text(
            "\$ " + payment.getValue().toString(),
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          subtitle: Row(
            children: <Widget>[
              Text("Estado: ", style: TextStyle(color: Colors.white)),
              Text(payment.getState(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: () {
//            if (payment.getState() == PaymentState.PENDING) {
              onTap();
//            }
          },
        ),
      ),
    );
  }
}
