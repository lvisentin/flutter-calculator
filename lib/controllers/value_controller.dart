import 'package:flutter/cupertino.dart';

class ValueController extends ChangeNotifier {
  static ValueController instance = new ValueController();

  Balance balance = new Balance(123456.78);

  getValue() {
    return this.balance.value;
  }
}

class Balance {
  final double value;

  Balance(this.value);
}
