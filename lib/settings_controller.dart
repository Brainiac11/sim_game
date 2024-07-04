import 'package:flutter/material.dart';
import 'package:player_move/constants.dart';
import 'package:player_move/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'settings_controller.g.dart';

@riverpod
class SettingsController extends _$SettingsController {
  late SharedPreferences _prefs;

  @override
  Future<Settings> build() async {
    _prefs = await SharedPreferences.getInstance();
    return getSettingsFromPreferences(_prefs);
  }

  Settings getSettingsFromPreferences(SharedPreferences prefs) {
    Settings settings = Settings();
    settings.brightness =
        prefs.get(settings.prefsSettingsNames.elementAt(0)) == null
            ? Brightness.dark
            : prefs.get(settings.prefsSettingsNames.elementAt(0)) as Brightness;
    settings.theme = prefs.get(settings.prefsSettingsNames.elementAt(1)) == null
        ? kTheme
        : prefs.get(settings.prefsSettingsNames.elementAt(1)) as ThemeData;
    settings.haptics =
        (prefs.getBool(settings.prefsSettingsNames.elementAt(2)) ?? true);
    settings.infiniteMode =
        (prefs.getBool(settings.prefsSettingsNames.elementAt(3)) ?? true);
    return settings;
  }
}
