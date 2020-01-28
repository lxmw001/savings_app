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
      body: StreamBuilder(
        stream: PartnerService.getPartners(),
        builder: (context, snapshot1) {
          if (!snapshot1.hasData) return const Text('Cargando...');
          return StreamBuilder(
              stream: PaymentService.getPayments(),
              builder: (context, snapshot2) {
                if (!snapshot2.hasData) return const Text('Cargando...');
                PaymentService.loadFromDocumentList(snapshot2.data.documents);
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot1.data.documents.length,
                  itemBuilder: (context, index) {
                    Partner partner =
                        Partner.fromJson(snapshot1.data.documents[index].data);
                    partner.setId(snapshot1.data.documents[index].documentID);
                    var payments =
                        PaymentService.getCurrentPayments(partner);
                    return PartnerPaymentItem(
                        partner: partner,
                        payments: payments,
                        onTap: () {
                          Navigator.pushNamed(context, 'payments',
                              arguments: payments);
                        });
                  },
                );
              });
        },
      ),
    );
  }
}
