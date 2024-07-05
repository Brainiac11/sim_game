import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:player_move/main.dart';
import 'package:player_move/providers/settings/settings.dart';
import 'package:player_move/providers/settings/settings_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool infiniteMode = ref.watch(settingsNotifierProvider).infiniteMode;
    void onInfiniteModeToggle(Settings? settings, Settings settings2) {
      if (kDebugMode) {
        print("infiniteMode: ${settings!.infiniteMode.toString()}");
      }
      infiniteMode = settings!.infiniteMode;
    }

    final provider = ref.listen(settingsNotifierProvider, onInfiniteModeToggle);

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
                onPressed: (context) {},
                leading: const Icon(Icons.numbers),
                title: const Text('Infinite Mode'),
                onToggle: (bool value) {
                  // return value;
                  // ref.read(settingsNotifierProvider).infiniteMode = value;
                  ref.read(settingsNotifierProvider).infiniteMode = value;
                },
                initialValue: infiniteMode,
              ),
              SettingsTile.switchTile(
                onToggle: (value) {},
                initialValue: true,
                leading: const Icon(Icons.format_paint),
                title: const Text('Enable custom theme'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
