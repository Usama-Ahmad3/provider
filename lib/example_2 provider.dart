import 'package:flutter/cupertino.dart';

// ignore: camel_case_types
class Exmaple_2P with ChangeNotifier {
  double _value = 1.0;
  double get value => _value;
  void setValue(double val) {
    _value = val;
    notifyListeners();
  }
}
