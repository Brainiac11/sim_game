import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/main.dart';
import 'package:player_move/prefs.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => SettingsPageState();
}

class SettingsPageState extends ConsumerState<SettingsPage> {
  void onSettingsChanged(String key, Object setting) async {
    // Preferences().prefs.setStringList(key);
  }

  @override
  Widget build(BuildContext context) {
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
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: const Text('Language'),
                value: const Text('English'),
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
