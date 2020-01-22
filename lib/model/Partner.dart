import 'package:lombok/lombok.dart';

@data
class Partner {
  String name;
  String phoneNumber;
  String email;

  Partner({this.name = '', this.phoneNumber = '', this.email = ''});

  /*Getters and Setters*/
  void setName(name) {
    this.name = name;
  }

  void setPhoneNumber(phoneNumber) {
    this.phoneNumber = phoneNumber;
  }

  void setEmail(email) {
    this.email = email;
  }
}