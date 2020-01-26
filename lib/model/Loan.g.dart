// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Loan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Loan _$LoanFromJson(Map<String, dynamic> json) {
  return Loan(
    interest: LoanInterest.loanInterestFromType(json['interest'] as String),
  )
    ..id = json['id'] as String
    ..type = json['type'] as String
    ..value = (json['value'] as num)?.toDouble()
    ..valueToPay = (json['valueToPay'] as num)?.toDouble()
    ..paymentsNumber = json['paymentsNumber'] as int
    ..date =
        json['date'] == null ? null : DateTime.parse(json['date'] as String)
    ..debt = (json['debt'] as num)?.toDouble()
    ..paymentValue = (json['paymentValue'] as num)?.toDouble()
    ..interestValue = (json['interestValue'] as num)?.toDouble()
    ..partner = Partner.partnerFromId(json['partner'] as String);
}

Map<String, dynamic> _$LoanToJson(Loan instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'value': instance.value,
      'valueToPay': instance.valueToPay,
      'paymentsNumber': instance.paymentsNumber,
      'date': instance.date?.toIso8601String(),
      'debt': instance.debt,
      'paymentValue': instance.paymentValue,
      'interestValue': instance.interestValue,
      'interest': LoanInterest.loanInterestToType(instance.interest),
      'partner': Partner.partnerToId(instance.partner),
    };

// **************************************************************************
// DataGenerator
// **************************************************************************

abstract class _$LoanLombok {
  /// Field
  String type;
  double value;
  double valueToPay;
  int paymentsNumber;
  DateTime date;
  double debt;
  double paymentValue;
  double interestValue;
  LoanInterest interest;
  Partner partner;

  /// Setter

  void setType(String type) {
    this.type = type;
  }

  void setValue(double value) {
    this.value = value;
  }

  void setValueToPay(double valueToPay) {
    this.valueToPay = valueToPay;
  }

  void setPaymentsNumber(int paymentsNumber) {
    this.paymentsNumber = paymentsNumber;
  }

  void setDate(DateTime date) {
    this.date = date;
  }

  void setDebt(double debt) {
    this.debt = debt;
  }

  void setPaymentValue(double paymentValue) {
    this.paymentValue = paymentValue;
  }

  void setInterestValue(double interestValue) {
    this.interestValue = interestValue;
  }

  void setInterest(LoanInterest interest) {
    this.interest = interest;
  }

  void setPartner(Partner partner) {
    this.partner = partner;
  }

  /// Getter
  String getType() {
    return type;
  }

  double getValue() {
    return value;
  }

  double getValueToPay() {
    return valueToPay;
  }

  int getPaymentsNumber() {
    return paymentsNumber;
  }

  DateTime getDate() {
    return date;
  }

  double getDebt() {
    return debt;
  }

  double getPaymentValue() {
    return paymentValue;
  }

  double getInterestValue() {
    return interestValue;
  }

  LoanInterest getInterest() {
    return interest;
  }

  Partner getPartner() {
    return partner;
  }
}
