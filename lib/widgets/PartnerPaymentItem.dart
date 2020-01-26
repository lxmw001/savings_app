import 'package:flutter/material.dart';
import 'package:savings_app/model/Partner.dart';
import 'package:savings_app/model/Payment.dart';
import 'package:savings_app/services/PaymentService.dart';

class PartnerPaymentItem extends StatelessWidget {
  final Partner partner;
  final List<Payment> payments;
  final Function onTap;

  PartnerPaymentItem({this.partner, this.payments, this.onTap});

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
            this.partner.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: <Widget>[
              Text("Cuotas: ", style: TextStyle(color: Colors.white)),
              Text(PaymentService.getStatePayments(payments), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))
            ],
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          onTap: onTap,
        ),
      ),
    );
  }
}
