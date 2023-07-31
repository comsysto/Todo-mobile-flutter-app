import 'package:todo_app/features/common/domain/manager/shared_prefs_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsManagerImpl implements SharedPrefsManager {
  final SharedPreferences _instance;

  const SharedPrefsManagerImpl(this._instance);

  @override
  bool? getBoolean(final String key) => _instance.getBool(key);

  @override
  Future<void> setBoolean(final String key, final bool value) async =>
      await _instance.setBool(key, value);
}
