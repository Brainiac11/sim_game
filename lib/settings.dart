import 'package:flutter/material.dart';
import 'package:player_move/setting.dart';

class Settings {
  List<Setting> settings = List.from(<Setting>[
    Setting(settingKey: "brightness", settingValue: Brightness.dark)
  ]);
  late Brightness brightness;
  late ThemeData theme;
  late bool haptics;
  late bool infiniteMode;
  List<String> prefsSettingsNames = List<String>.from(
    ["brightness", "theme", "haptics", "infinite"],
    growable: false,
  );
}
