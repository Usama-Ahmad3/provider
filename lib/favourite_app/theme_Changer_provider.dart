import 'package:flutter/material.dart';

class ThemeChangerProvider with ChangeNotifier {
  var _themeChanger = ThemeMode.light;

  ThemeMode get thememode => _themeChanger;

  void setTheme(themeMode) {
    _themeChanger = themeMode;
    notifyListeners();
  }
}
