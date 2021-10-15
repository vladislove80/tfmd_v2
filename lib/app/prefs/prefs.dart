import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class Prefs {
  static const SPLASH_SHOWN_KEY = 'is_splash_shown';

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
}
