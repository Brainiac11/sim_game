import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:player_move/main.dart';
import 'package:player_move/providers/settings/settings_notifier.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SettingsPageState();
}

class SettingsPageState extends ConsumerState<SettingsPage> {
  void onInfiniteModeToggle(bool toggle) {
    setState(() => ref.read(settingsNotifierProvider).infiniteMode = toggle);
  }

  void onHapticsToggle(bool toggle) {
    setState(() => ref.read(settingsNotifierProvider).haptics = toggle);
  }

  @override
  Widget build(BuildContext context) {
    final settings = ref.watch(settingsNotifierProvider);
    final notifier = ref.read(settingsNotifierProvider.notifier);
    void onDarkModeToggle(bool toggle) {
      ThemeMode theme = (toggle ? ThemeMode.dark : ThemeMode.light);
      notifier.updateThemeMode(theme);
    }

    void onInfiniteModeToggle(bool toggle) {
      notifier.updateInfiniteMode(toggle);
    }

    void onHapticsToggle(bool toggle) {
      notifier.updateHaptics(toggle);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        elevation: 0,
        leading: TextButton(
          onPressed: () {
            context.go('/');
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
                initialValue: settings.themeMode == ThemeMode.dark,
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
                initialValue: ref.watch(settingsNotifierProvider).haptics,
              ),
              SettingsTile.switchTile(
                onPressed: (context) {},
                leading: const Icon(Icons.numbers),
                title: const Text('Infinite Mode'),
                onToggle: (bool value) {
                  onInfiniteModeToggle(value);
                },
                initialValue: ref.watch(settingsNotifierProvider).infiniteMode,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
