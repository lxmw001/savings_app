import 'package:flutter/material.dart';
import 'package:savings_app/constants/LoanTypes.dart';

class MyConstants extends InheritedWidget {
  static MyConstants of(BuildContext context) => context. dependOnInheritedWidgetOfExactType<MyConstants>();

  const MyConstants({Widget child, Key key}): super(key: key, child: child);

  final loanTypes = LoanTypes;

  @override
  bool updateShouldNotify(MyConstants oldWidget) => false;
}