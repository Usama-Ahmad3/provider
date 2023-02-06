import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier{
  int _count = 0;
  int get count => _count;
  int _ginti = 0;
  int get ginti => _ginti;
  void setCount(){
    _count++;
    notifyListeners();
  }
  void setGinti(){
    _ginti++;
    notifyListeners();
  }
}