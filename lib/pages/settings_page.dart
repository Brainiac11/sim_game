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
      ref.read(settingsProvider).updateInfiniteMode(toggle);
      if (kDebugMode) {
        print(
            "infiniteMode: ${ref.read(settingsProvider).settings.infiniteMode.toString()}");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        elevation: 0,
        leading: TextButton(
          onPressed: () {
            router.go('/');
            super.deactivate();
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
                  onInfiniteModeToggle(value);
                },
                initialValue: settings.infiniteMode,
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
