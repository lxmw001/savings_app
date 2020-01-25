// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Partner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Partner _$PartnerFromJson(Map<String, dynamic> json) {
  return Partner(
    name: json['name'] as String,
    phoneNumber: json['phoneNumber'] as String,
    email: json['email'] as String,
  )..id = json['id'] as String;
}

Map<String, dynamic> _$PartnerToJson(Partner instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
    };

// **************************************************************************
// DataGenerator
// **************************************************************************

abstract class _$PartnerLombok {
  /// Field
  String name;
  String phoneNumber;
  String email;

  /// Setter

  void setName(String name) {
    this.name = name;
  }

  void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  void setEmail(String email) {
    this.email = email;
  }

  /// Getter
  String getName() {
    return name;
  }

  String getPhoneNumber() {
    return phoneNumber;
  }

  String getEmail() {
    return email;
  }
}
