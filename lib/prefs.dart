import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences prefs;
  static void loadPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }
}
