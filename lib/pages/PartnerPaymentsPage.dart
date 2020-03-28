import 'package:flutter/material.dart';
import 'package:savings_app/model/Partner.dart';
import 'package:savings_app/services/PartnerService.dart';
import 'package:savings_app/services/PaymentService.dart';
import 'package:savings_app/widgets/MyAppBar.dart';
import 'package:savings_app/widgets/PartnerPaymentItem.dart';

import '../widgets/SideMenu.dart';

class PartnerPaymentsPage extends StatefulWidget {
  @override
  _PartnerPaymentsPageState createState() => _PartnerPaymentsPageState();
}

class _PartnerPaymentsPageState extends State<PartnerPaymentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(text: 'Cuotas por Socio'),
      drawer: SideMenu(),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: PartnerService.partners.length,
        itemBuilder: (context, index) {
          List<Partner> partners = PartnerService.partners;
          Partner partner = partners.elementAt(index);
          var payments = PaymentService.getCurrentPayments(partner);
          return PartnerPaymentItem(
              partner: partner,
              payments: payments,
              onTap: () {
                Navigator.pushNamed(context, 'payments', arguments: payments);
              });
        },
      ),
    );
  }
}
