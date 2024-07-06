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
