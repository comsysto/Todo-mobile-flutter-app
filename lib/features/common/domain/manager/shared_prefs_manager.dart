abstract class SharedPrefsManager {
  bool? getBoolean(String key);
  Future<void> setBoolean(String key, bool value);
}