import 'package:flutter/material.dart';
import 'package:savings_app/modals/PaymentModal.dart';
import 'package:savings_app/model/Payment.dart';
import 'package:savings_app/services/PaymentService.dart';
import 'package:savings_app/services/SavingBankService.dart';
import 'package:savings_app/widgets/MyAppBar.dart';
import 'package:savings_app/widgets/PaymentItem.dart';

class PaymentsPage extends StatefulWidget {
  @override
  _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  List<Payment> payments = [];

  confirmPayment(Payment payment, index) {
    payments[index] = payment;
    PaymentService.updatePayment(payment);
    SavingBankService.updateSavingBank(payment.getValue());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    payments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: MyAppBar(text: 'Cuotas de ' + payments[0].getPartner().getName()),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: payments.length,
        itemBuilder: (context, index) {
          var payment = payments[index];
          return PaymentItem(
              payment: payment,
              onTap: () {
                print('id: ' + payment.getId());
                PaymentModal.show(context, payment, index, confirmPayment);
              });
        },
      ),
    );
  }
}
