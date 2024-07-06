import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/providers/preferences/preferences_notifier.dart';
import 'package:player_move/providers/settings/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class SettingsNotifier extends ChangeNotifier {
  Settings settings = Settings();

  void updateHaptics(bool isHapticsEnabled) {
    if (settings.haptics != isHapticsEnabled) {
      settings.haptics = isHapticsEnabled;
      notifyListeners();
    }
  }

  void updateInfiniteMode(bool isInfiniteModeEnabled) {
    if (settings.infiniteMode != isInfiniteModeEnabled) {
      settings.infiniteMode = isInfiniteModeEnabled;
    }
  }

  void updateDarkMode(bool isDarkModeEnabled) {
    if (settings.isDarkMode != isDarkModeEnabled) {
      settings.isDarkMode = isDarkModeEnabled;
    }
  }
}

final settingsProvider = ChangeNotifierProvider<SettingsNotifier>((ref) {
  return SettingsNotifier();
});
