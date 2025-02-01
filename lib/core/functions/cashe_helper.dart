import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    return await sharedPreferences.setDouble(key, value);
  }
  static Future<void> saveThemeMode(String mode) async {
    await saveData(key: 'theme_mode', value: mode);
  }
  // Method to get theme mode
  static String? getThemeMode() {
    return getData(key: 'theme_mode') as String?;
  }
  static Future<bool> removeData({required String key}) async {
    return sharedPreferences.remove(key);
  }
}