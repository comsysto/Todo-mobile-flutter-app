import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  void updateAppTheme(final bool isDarkMode) {
    _isDarkMode = isDarkMode;
    notifyListeners();
  }

  bool get isDarkMode => _isDarkMode;
}