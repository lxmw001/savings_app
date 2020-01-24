import 'package:lombok/lombok.dart';

@data
class LoanInterest {
  String type;
  int value;

  LoanInterest(this.type, this.value);

  void setValue(value) {
    this.value = value;
  }

  int getValue(){
    return this.value;
  }
}