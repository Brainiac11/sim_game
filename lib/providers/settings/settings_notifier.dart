import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/providers/preferences/preferences_notifier.dart';
import 'package:player_move/providers/settings/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'settings_notifier.g.dart';

@riverpod
class SettingsNotifier extends _$SettingsNotifier {
  @override
  Settings build() {
    return Settings();
  }

  void updateHaptics(bool isHapticsEnabled) {
    if (state.haptics != isHapticsEnabled) {
      state.haptics = isHapticsEnabled;
    }
  }

  void updateInfiniteMode(bool isInfiniteModeEnabled) {
    if (state.infiniteMode != isInfiniteModeEnabled) {
      state.infiniteMode = isInfiniteModeEnabled;
    }
  }

  void updateDarkMode(bool isDarkModeEnabled) {
    if (state.isDarkMode != isDarkModeEnabled) {
      state.isDarkMode = isDarkModeEnabled;
    }
  }
}
