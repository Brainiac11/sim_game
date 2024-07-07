import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:player_move/main.dart';
import 'package:player_move/providers/preferences/preferences_notifier.dart';
import 'package:riverpod/src/framework.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:player_move/providers/settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'settings_notifier.g.dart';

@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  @override
  Future<AppSettings> build() {
    SharedPreferences prefs = ref.read(prefsProvider).value;
    return AppSettings.fromSharedPreferences(prefs);
  }

  SharedPreferences? _getPrefs() {
    SharedPreferences.getInstance().then((value) {
      return value;
    });
    return null;
  }

  void updateThemeMode(ThemeMode themeMode) {
    state.themeMode = themeMode;
  }

  void updateHaptics(bool haptics) {
    state.haptics = haptics;
  }

  void updateInfiniteMode(bool infiniteMode) {
    state.infiniteMode = infiniteMode;
  }

  void updateLanguage(String language) {
    state.language = language;
  }
}
