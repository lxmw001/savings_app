import 'package:flutter/material.dart';
import 'package:savings_app/modals/PaymentModal.dart';
import 'package:savings_app/model/Payment.dart';
import 'package:savings_app/services/PaymentService.dart';
import 'package:savings_app/services/SavingBankService.dart';
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
      appBar: AppBar(
        title: Text('Cuotas'),
      ),
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
//                Navigator.pushNamed(context, 'payments', arguments: payments);
              });
        },
      ),
    );
  }
}
