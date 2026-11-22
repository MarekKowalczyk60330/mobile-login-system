import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const _email = 'test@test.com';
  static const _password = 'Test1234';
  static const _key = 'isLoggedIn';

  static bool checkCredentials(String email, String password) {
    return email.trim() == _email && password == _password;
  }

  static Future<void> setLoggedIn({required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, value);
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }
}