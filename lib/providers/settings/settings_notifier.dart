import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/providers/preferences/preferences_notifier.dart';
import 'package:player_move/providers/settings/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsNotifier extends ChangeNotifier {
  Settings settings = Settings.fromPreferences(Settings.getSharedPreferences());

  void updateHaptics(bool isHapticsEnabled) {
    if (settings.haptics != isHapticsEnabled) {
      settings.haptics = isHapticsEnabled;
      Settings.getSharedPreferences().then(
        (value) {
          value.setBool("haptics", isHapticsEnabled);
        },
      );
      notifyListeners();
    }
  }

  void updateInfiniteMode(bool isInfiniteModeEnabled) {
    if (settings.infiniteMode != isInfiniteModeEnabled) {
      settings.infiniteMode = isInfiniteModeEnabled;
      Settings.getSharedPreferences().then((value) {
        value.setBool("infiniteMode", isInfiniteModeEnabled);
      });
      notifyListeners();
    }
  }

  void updateDarkMode(bool isDarkModeEnabled) {
    if (settings.isDarkMode != isDarkModeEnabled) {
      settings.isDarkMode = isDarkModeEnabled;
      Settings.getSharedPreferences().then((value) {
        value.setBool("isDarkMode", isDarkModeEnabled);
      });
      notifyListeners();
    }
  }
}

final settingsProvider = ChangeNotifierProvider<SettingsNotifier>((ref) {
  return SettingsNotifier();
});
