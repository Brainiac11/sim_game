import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/drivetrain/swerve/swerve_drivetrain.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/constants.dart';
import 'package:player_move/providers/robot/robot_provider.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
abstract class Drivetrain {
  Motor motors;
  String name;

  Drivetrain({required this.motors, required this.name});

  @mustBeOverridden
  void firstJoystickMovement(Vector2 value, Body body, dynamic constants);

  @mustBeOverridden
  void secondJoystickMovement(Vector2 value, Body body, dynamic constants);

  @mustBeOverridden
  @mustCallSuper
  void updateRobotConstants(WidgetRef ref) {
    ref.watch(robotProviderProvider)
      ..kHalfHeight = kWorldSize.x / 51
      ..kHalfWidth = kWorldSize.x / 51;
  }

  factory Drivetrain.fromJson(Map<String, dynamic> json) {
    switch (json["name"]) {
      case "SwerveDrivetrain":
        return SwerveDrivetrain.fromJson(json);
      default:
        return SwerveDrivetrain.fromJson(json);
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
