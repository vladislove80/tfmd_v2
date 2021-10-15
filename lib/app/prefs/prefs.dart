import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class Prefs {
  static const SPLASH_SHOWN_KEY = 'is_splash_shown';
  static const COUNTRY_CODE_KEY = 'country_code';

  Future<bool> setSplashPageIsShown() async {
    final _prefs = await SharedPreferences.getInstance();
    try {
      return await _prefs.setBool(SPLASH_SHOWN_KEY, true);
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> isSplashPageShown() async {
    try {
      final _prefs = await SharedPreferences.getInstance();
      return _prefs.getBool(SPLASH_SHOWN_KEY) ?? false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> setCountryCode(String countryCode) async {
    try {
      final _prefs = await SharedPreferences.getInstance();
      return _prefs.setString(COUNTRY_CODE_KEY, countryCode);
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<String?> getCountryCode() async {
    try {
      final _prefs = await SharedPreferences.getInstance();
      return _prefs.getString(COUNTRY_CODE_KEY);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
