import 'package:flutter/material.dart';
import 'package:todo_app/features/common/domain/manager/shared_prefs_manager.dart';

class AppThemeProvider extends ChangeNotifier {
  final SharedPrefsManager _sharedPrefsManager;
  bool _isDarkMode = false;

  AppThemeProvider(this._sharedPrefsManager);

  Future<void> updateAppTheme(final bool isDarkMode) async {
    _isDarkMode = isDarkMode;
    await _sharedPrefsManager.setBoolean('darkModeEnabled', isDarkMode);
    notifyListeners();
  }

  bool get isDarkMode => _sharedPrefsManager.getBoolean('darkModeEnabled') ?? _isDarkMode;
}
