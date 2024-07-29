import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:player_move/components/robot/drivetrain/drivetrain.dart';
import 'package:player_move/components/robot/drivetrain/swerve/swerve_drivetrain.dart';
import 'package:player_move/components/robot/drivetrain/tank/tank_drivetrain.dart';
import 'package:player_move/providers/settings/settings_notifier.dart';

class RobotSpriteManager {
  Sprite? sprite;
  Drivetrain drivetrain;
  String themeMode = "dark";
  ComponentRef ref;

  RobotSpriteManager({required this.ref, required this.drivetrain});

  Future<Sprite> getCurrentSprite() async {
    await _setCurrentSprite();
    return sprite!;
  }

  FutureOr<void> _setCurrentSprite() async {
    setThemeModeName();
    if (kDebugMode) {
      print("Sprite drivetrain type: ${drivetrain.runtimeType}");
    }
    if (drivetrain.runtimeType == SwerveDrivetrain) {
      sprite = await Sprite.load("robot_${themeMode}_swerve.png");
    } else if (drivetrain.runtimeType == TankDrivetrain) {
      sprite = await Sprite.load("robot_${themeMode}_tank.png");
    } else {
      sprite = await Sprite.load("robot_$themeMode.png");
      throw (Exception("Unknown Drivetrain"));
    }
  }

  void setThemeModeName() {
    if (ref.read(settingsNotifierProvider).themeMode == ThemeMode.dark) {
      themeMode = "dark";
    } else {
      themeMode = "light";
    }
  }
}
