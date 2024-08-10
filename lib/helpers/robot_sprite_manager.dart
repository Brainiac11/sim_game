import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:player_move/components/robot/subsystems/drivetrain/drivetrain.dart';
import 'package:player_move/components/robot/subsystems/drivetrain/swerve/swerve_drivetrain.dart';
import 'package:player_move/components/robot/subsystems/drivetrain/tank/tank_drivetrain.dart';

class RobotSpriteManager extends SpriteComponent {
  Drivetrain drivetrain;
  String themeMode = "dark";

  RobotSpriteManager({required this.drivetrain});

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

  @override
  FutureOr<void> onMount() async {
    scale = Vector2(1, 1);
    setThemeModeName();
    await _setCurrentSprite();
    anchor = Anchor.center;
    super.onMount();
  }

  // @override
  // Future<void> onLoad() async {
  //   setThemeModeName();
  //   _setCurrentSprite();
  // }

  void setThemeModeName() {
    // if (super.key == ThemeMode.dark) {
    themeMode = "dark";
    // } else {
    // themeMode = "light";
    // }
  }
}
