import 'package:shared_preferences/shared_preferences.dart';

class Settings {
  bool infiniteMode;
  bool haptics;
  bool isDarkMode;

  Settings({
    this.infiniteMode = true,
    this.haptics = true,
    this.isDarkMode = false,
  });

  factory Settings.fromPreferences(Future<SharedPreferences> preferences) {
    Settings settings = Settings();
    preferences.then((prefs) {
      settings.haptics = prefs.getBool("haptics") ?? true;
      settings.infiniteMode = prefs.getBool("infiniteMode") ?? true;
      settings.isDarkMode = prefs.getBool("isDarkMode") ?? false;
    });

    return settings;
  }

  static Future<SharedPreferences> getSharedPreferences() async {
    return SharedPreferences.getInstance();
  }

  Settings copy({
    bool? infiniteMode,
    bool? haptics,
    bool? isDarkMode,
  }) =>
      Settings(
        infiniteMode: infiniteMode ?? this.infiniteMode,
        haptics: haptics ?? this.haptics,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );
}
