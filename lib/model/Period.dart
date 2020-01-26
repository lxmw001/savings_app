import 'package:json_annotation/json_annotation.dart';
import 'package:lombok/lombok.dart';
import 'package:savings_app/constants/LoanInterestTypes.dart';
import 'package:savings_app/model/BasicModel.dart';
import 'package:savings_app/services/SettingsService.dart';

part 'Period.g.dart';

@data
@toString
@JsonSerializable()
class Period extends BasicModel with _$PeriodLombok {
  DateTime from;
  DateTime to;

  Period({this.from, this.to});

  factory Period.fromJson(Map<String, dynamic> json) =>
      _$PeriodFromJson(json);

  Map<String, dynamic> toJson() => _$PeriodToJson(this);

  String getKey() {
    return from.toIso8601String() + '-' + to.toIso8601String();
  }
}
