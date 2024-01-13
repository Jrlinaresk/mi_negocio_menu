import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const String keyLastLogin = 'lastLogin';

  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  static SharedPreferences get preferences {
    if (_preferences == null) {
      throw Exception("Preferences not initialized. Call 'init()' first.");
    }
    return _preferences!;
  }

  static String get lastLogin {
    return preferences.getString(keyLastLogin) ?? '';
  }

  static setLastLogin(String lastLogin) {
    preferences.setString(keyLastLogin, lastLogin);
  }
}
