import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  late SharedPreferences prefs;
  void loadPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }
}
