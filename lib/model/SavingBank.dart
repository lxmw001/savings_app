import 'package:json_annotation/json_annotation.dart';
import 'package:lombok/lombok.dart';
import 'package:savings_app/model/BasicModel.dart';

part 'SavingBank.g.dart';

@data
@toString
@JsonSerializable()
class SavingBank extends BasicModel with _$SavingBankLombok {

  double total;

  SavingBank({this.total = 0});

  factory SavingBank.fromJson(Map<String, dynamic> json) =>
    _$SavingBankFromJson(json);

  Map<String, dynamic> toJson() => _$SavingBankToJson(this);
}
