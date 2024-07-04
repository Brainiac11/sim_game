import 'package:flutter/material.dart';
import 'package:player_move/settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'settings.g.dart';

@riverpod
class SettingsController extends _$SettingsController {
  late SharedPreferences _prefs;

  @override
  Future<Settings> build() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Settings getSettingsFromPreferences(SharedPreferences prefs) {
    Settings settings = Settings();
    prefs.get()
  }
}
