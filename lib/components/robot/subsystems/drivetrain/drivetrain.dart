import 'dart:async';

import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/constants/robot_constants.dart';
import 'package:player_move/components/robot/robot.dart';
import 'package:player_move/components/robot/subsystems/drivetrain/swerve/swerve_drivetrain.dart';
import 'package:player_move/components/robot/subsystems/drivetrain/tank/tank_drivetrain.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/constants.dart';
import 'package:player_move/providers/robot/robot_provider.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
abstract class Drivetrain {
  Motor motors;
  String name;

  Drivetrain({required this.motors, required this.name});

  @mustBeOverridden
  FutureOr<void> firstJoystickMovement(
      Vector2 value, Body body, RobotConstants constants);

  @mustBeOverridden
  FutureOr<void> secondJoystickMovement(
      Vector2 value, Body body, RobotConstants constants);

  @mustBeOverridden
  @mustCallSuper
  FutureOr<void> updateRobotConstants(WidgetRef ref) async {
    // final robotConstants = ref.watch(robotProviderProvider)
    //   ..kHalfHeight = kWorldSize.x / 51
    //   ..kHalfWidth = kWorldSize.x / 51;
    // robotConstants.kMultiplier =
    //     (robotConstants.kHalfHeight * 2 * robotConstants.kHalfWidth * 2) *
    //         const MediaQueryData().size.width *
    //         const MediaQueryData().size.height /
    //         kRobotMass.mass;
  }

  factory Drivetrain.fromJson(Map<String, dynamic> json) {
    switch (json["name"]) {
      case "SwerveDrivetrain":
        return SwerveDrivetrain.fromJson(json);
      case "TankDrivetrain":
        return TankDrivetrain.fromJson(json);
      default:
        throw (Exception("Drivetrain not recognized"));
    }
  }
  Map<String, dynamic> toJson();

  // @mustBeOverridden
  // Map<String, dynamic> toJson() {
  //   switch (name) {
  //     case "SwerveDrivetrain":
  //       return SwerveDrivetrain().toJson();
  //     default:
  //       return SwerveDrivetrain().toJson();
  //   }
  // }
}
