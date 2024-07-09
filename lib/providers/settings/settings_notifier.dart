import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:player_move/providers/settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'settings_notifier.g.dart';

@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  @override
  AppSettings build() {
    _loadSettings();
    return AppSettings(
      themeMode: ThemeMode.system,
      haptics: true,
      infiniteMode: true,
      language: "en",
    );
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final themeMode = prefs.getString('themeMode');
    final language = prefs.getString('language') ?? 'en';
    final haptics = prefs.getBool("haptics") ?? true;
    final infiniteMode = prefs.getBool("infiniteMode") ?? false;
    state = state.copyWith(
        themeMode: themeMode == "ThemeMode.system"
            ? ThemeMode.system
            : (themeMode == "ThemeMode.dark"
                ? ThemeMode.dark
                : ThemeMode.light),
        language: language,
        haptics: haptics,
        infiniteMode: infiniteMode);
  }

  void updateThemeMode(ThemeMode themeMode) async {
    state = state.copyWith(themeMode: themeMode);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', state.themeMode.toString());

    if (kDebugMode) {
      print("ThemeMode in Prefs: ${prefs.getString('themeMode')}");
    }
    ref.notifyListeners();
  }

  void updateHaptics(bool haptics) async {
    state = state.copyWith(haptics: haptics);
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('haptics', state.haptics);
    ref.notifyListeners();
  }

  void updateInfiniteMode(bool infiniteMode) async {
    state = state.copyWith(infiniteMode: infiniteMode);
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('infiniteMode', state.infiniteMode);
    ref.notifyListeners();
  }

  void updateLanguage(String language) async {
    state = state.copyWith(language: language);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language', state.language);
    ref.notifyListeners();
  }
}
