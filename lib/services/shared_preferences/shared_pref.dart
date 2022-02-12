import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static Future<void> setStringPref({
    required String key,
    required String value,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
}
