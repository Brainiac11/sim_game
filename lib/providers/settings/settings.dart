import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'settings.freezed.dart';
part 'settings.g.dart';

@unfreezed
abstract class AppSettings with _$AppSettings {
  factory AppSettings({
    required ThemeMode themeMode,
    required String language,
    required bool haptics,
    required bool infiniteMode,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, Object?> json) =>
      _$AppSettingsFromJson(json);
  factory AppSettings.fromSharedPreferences(SharedPreferences prefs) {
    final themeModeString = prefs.getString('themeMode') ?? 'system';
    final language = prefs.getString('language') ?? 'en';
    final haptics = prefs.getBool('haptics') ?? true;
    final infiniteMode = prefs.getBool("infiniteMode") ?? true;
    return AppSettings(
      themeMode: themeModeString == 'system'
          ? ThemeMode.system
          : themeModeString == 'light'
              ? ThemeMode.light
              : ThemeMode.dark,
      language: language,
      haptics: haptics,
      infiniteMode: infiniteMode,
    );
  }
}
// class Settings {
//   bool infiniteMode;
//   bool haptics;
//   bool isDarkMode;

//   Settings({
//     this.infiniteMode = true,
//     this.haptics = true,
//     this.isDarkMode = false,
//   });

//   factory Settings.fromPreferences(Future<SharedPreferences> preferences) {
//     Settings settings = Settings();
//     preferences.then((prefs) {
//       settings.haptics = prefs.getBool("haptics") ?? true;
//       settings.infiniteMode = prefs.getBool("infiniteMode") ?? true;
//       settings.isDarkMode = prefs.getBool("isDarkMode") ?? false;
//     });

//     return settings;
//   }

//   static Future<SharedPreferences> getSharedPreferences() async {
//     return SharedPreferences.getInstance();
//   }

//   Settings copy({
//     bool? infiniteMode,
//     bool? haptics,
//     bool? isDarkMode,
//   }) =>
//       Settings(
//         infiniteMode: infiniteMode ?? this.infiniteMode,
//         haptics: haptics ?? this.haptics,
//         isDarkMode: isDarkMode ?? this.isDarkMode,
//       );
// }
