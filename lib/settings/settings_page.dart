import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/main.dart';
import 'package:player_move/prefs.dart';
import 'package:player_move/settings/settings_notifier.dart';
import 'package:player_move/settings_controller.g.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  void onSettingsChanged(String key, Object setting) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                leading: const Icon(Icons.numbers),
                title: const Text('Infinite Mode'),
                onToggle: (value) {},
                initialValue: true,
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
