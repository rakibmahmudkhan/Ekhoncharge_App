import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static SharedPreferences? prefs;

  static Future<bool> init() async {
    prefs = await SharedPreferences.getInstance();
    return true;
  }

  static String? getString(String key, [String? defValue]) {
    return prefs!.getString(key) ?? defValue ?? '';
  }

  static Future<void> setString(String key, String value) async {
    prefs!.setString(key, value);
  }

  static bool? getBool(String key, [bool? defValue]) {
    return prefs!.getBool(key) ?? defValue ?? false;
  }

  static bool? getBoolOnlyTheme(String key, [bool? defValue]) {
    return prefs!.getBool(key) ?? defValue ?? true;
  }

  static Future<void> setBool(String key, bool value) async {
    prefs!.setBool(key, value);
  }

  static int? getInt(String key, [int? defValue]) {
    return prefs!.getInt(key) ?? defValue ?? 0;
  }

  static Future<void> setInt(String key, int value) async {
    prefs!.setInt(key, value);
  }

  static void clear() {
    prefs!.clear();
  }
}
