import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:player_move/main.dart';
import 'package:player_move/providers/settings/settings.dart';
import 'package:player_move/providers/settings/settings_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SettingsPageState();
}

class SettingsPageState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final Settings settings = ref.watch(settingsProvider).settings;
    void onInfiniteModeToggle(bool toggle) {
      setState(() => ref.read(settingsProvider).updateInfiniteMode(toggle));
      if (kDebugMode) {
        print(
            "infiniteMode: ${ref.read(settingsProvider).settings.infiniteMode.toString()}");
      }
    }

    void onDarkModeToggle(bool toggle) {
      setState(() => ref.read(settingsProvider).updateDarkMode(toggle));
      if (kDebugMode) {
        print(
            "dark mode: ${ref.read(settingsProvider).settings.isDarkMode.toString()}");
      }
    }

    void onHapticsToggle(bool toggle) {
      setState(() => ref.read(settingsProvider).updateHaptics(toggle));
      if (kDebugMode) {
        print(
            "haptics: ${ref.read(settingsProvider).settings.haptics.toString()}");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        elevation: 0,
        leading: TextButton(
          onPressed: () {
            router.go('/');
          },
          child: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
      ),
      body: SettingsList(
        key: const Key("Settings"),
        platform: DevicePlatform.device,
        applicationType: ApplicationType.material,
        sections: [
          SettingsSection(
            title: const Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.switchTile(
                onToggle: (value) {
                  onDarkModeToggle(value);
                },
                initialValue: settings.isDarkMode,
                leading: const Icon(Icons.nightlight_round),
                title: const Text('Dark Mode'),
              ),
              SettingsTile.switchTile(
                onPressed: (context) {},
                leading: const Icon(Icons.vibration_rounded),
                title: const Text('Haptics'),
                onToggle: (bool value) {
                  onHapticsToggle(value);
                },
                initialValue: settings.haptics,
              ),
              SettingsTile.switchTile(
                onPressed: (context) {},
                leading: const Icon(Icons.numbers),
                title: const Text('Infinite Mode'),
                onToggle: (bool value) {
                  onInfiniteModeToggle(value);
                },
                initialValue: settings.infiniteMode,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
