// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) {
  return Payment(
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    value: (json['value'] as num)?.toDouble(),
    state: json['state'] as String,
  )
    ..id = json['id'] as String
    ..partner = Partner.partnerFromId(json['partner'] as String)
    ..loan = Loan.loanFromId(json['loan'] as String);
}

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date?.toIso8601String(),
      'value': instance.value,
      'state': instance.state,
      'partner': Partner.partnerToId(instance.partner),
      'loan': Loan.loanToId(instance.loan),
    };

// **************************************************************************
// DataGenerator
// **************************************************************************

abstract class _$PaymentLombok {
  /// Field
  DateTime date;
  double value;
  String state;
  Partner partner;
  Loan loan;

  /// Setter

  void setDate(DateTime date) {
    this.date = date;
  }

  void setValue(double value) {
    this.value = value;
  }

  void setState(String state) {
    this.state = state;
  }

  void setPartner(Partner partner) {
    this.partner = partner;
  }

  void setLoan(Loan loan) {
    this.loan = loan;
  }

  /// Getter
  DateTime getDate() {
    return date;
  }

  double getValue() {
    return value;
  }

  String getState() {
    return state;
  }

  Partner getPartner() {
    return partner;
  }

  Loan getLoan() {
    return loan;
  }
}
