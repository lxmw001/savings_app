import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:savings_app/model/Payment.dart';

class PaymentModal {
  static void show(BuildContext context, Payment payment, int index, Function onConfirm, onCancel) {
    Dialog paymentModal = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
        ),
        height: 300.0,
        width: 300.0,
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            Align(
              // These values are based on trial & error method
              alignment: Alignment.center,
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child:  Form(
                    child: Column(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: FractionalOffset.center,
                            child: ListTile(
                              title: TextFormField(
                                initialValue: payment.getValue().toString(),
                                style: TextStyle(fontSize: 50),
                                onChanged: (value) => payment.setValue(double.tryParse(value)),
                                decoration: InputDecoration(
                                  labelText: 'Valor',
                                  labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                                  prefixText: "\$  ",
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  WhitelistingTextInputFormatter.digitsOnly
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),
                ),
            ),

            Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Confirmar Pago!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 50,
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        onConfirm(payment, index);
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.blue[300],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Confirmar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        onCancel(payment, index);
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 150,
                        decoration: BoxDecoration(
                          color: Colors.red[300],
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Cancelar",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Align(
              // These values are based on trial & error method
              alignment: Alignment(1.05, -1.05),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => paymentModal);
  }
}
