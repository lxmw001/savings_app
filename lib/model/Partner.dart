import 'package:json_annotation/json_annotation.dart';
import 'package:lombok/lombok.dart';
import 'package:savings_app/model/BasicModel.dart';

part 'Partner.g.dart';

@data
@toString
@JsonSerializable()
class Partner extends BasicModel with _$PartnerLombok {
  String name;
  String phoneNumber;
  String email;

  Partner({this.name = '', this.phoneNumber = '', this.email = ''});

  factory Partner.fromJson(Map<String, dynamic> json) =>
    _$PartnerFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerToJson(this);

  static Partner partnerFromId(String id) {
    Partner partner = new Partner();
    partner.setId(id);
    return partner;
}

  static String partnerToId(Partner partner) => partner?.getId();
}
