// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Loan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Loan _$LoanFromJson(Map<String, dynamic> json) {
  return Loan(
    interest: LoanInterest.loanInterestFromInt(json['interest'] as int),
  )
    ..id = json['id'] as String
    ..type = json['type'] as String
    ..value = (json['value'] as num)?.toDouble()
    ..paymentsNumber = json['paymentsNumber'] as int
    ..date =
        json['date'] == null ? null : DateTime.parse(json['date'] as String)
    ..debt = (json['debt'] as num)?.toDouble()
    ..paymentValue = (json['paymentValue'] as num)?.toDouble()
    ..partner = json['partner'] == null
        ? null
        : Partner.fromJson(json['partner'] as Map<String, dynamic>);
}

Map<String, dynamic> _$LoanToJson(Loan instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'value': instance.value,
      'paymentsNumber': instance.paymentsNumber,
      'date': instance.date?.toIso8601String(),
      'debt': instance.debt,
      'paymentValue': instance.paymentValue,
      'interest': LoanInterest.loanInterestToInt(instance.interest),
      'partner': instance.partner,
    };

// **************************************************************************
// DataGenerator
// **************************************************************************

abstract class _$LoanLombok {
  /// Field
  String type;
  double value;
  int paymentsNumber;
  DateTime date;
  double debt;
  double paymentValue;
  LoanInterest interest;
  Partner partner;

  /// Setter

  void setType(String type) {
    this.type = type;
  }

  void setValue(double value) {
    this.value = value;
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

  LoanInterest getInterest() {
    return interest;
  }

  Partner getPartner() {
    return partner;
  }
}
