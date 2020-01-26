import 'package:json_annotation/json_annotation.dart';
import 'package:lombok/lombok.dart';
import 'package:savings_app/constants/LoanInterestTypes.dart';
import 'package:savings_app/services/SettingsService.dart';

part 'Payment.g.dart';

@data
@toString
@JsonSerializable()
class Payment with _$PaymentLombok {
  DateTime date;
  int value;

  Payment({this.date, this.value = 0});

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}
