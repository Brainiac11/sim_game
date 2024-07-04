import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/settings/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'settings_notifier.g.dart';

// final settingsProvider =
//     StateNotifierProvider<SettingsNotifier>((ref) => SettingsNotifier());

@riverpod
SettingsNotifier<Settings> settings(
  SettingsRef ref,
) {
  return ref.state;
}

class SettingsNotifier extends StateNotifier<Settings> {
  SettingsNotifier() : super(Settings());

  void updateInfiniteMode(bool isInfiniteModeEnabled) {
    state = state.copy(infiniteMode: isInfiniteModeEnabled);
  }

  void updateHaptics(bool isHapticsEnabled) {
    state = state.copy(haptics: isHapticsEnabled);
  }
}
