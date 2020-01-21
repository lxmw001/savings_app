import 'package:lombok/lombok.dart';

@data
class LoanInterest {
  String type;
  int value;

  LoanInterest(this.type, this.value);
}