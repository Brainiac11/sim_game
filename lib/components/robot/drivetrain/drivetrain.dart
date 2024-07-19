import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/motors/motor.dart';

abstract class Drivetrain {
  Motor motors;

  Drivetrain({required this.motors});

  @mustBeOverridden
  void firstJoystickMovement(Vector2 value, Body body, dynamic constants) {}

  @mustBeOverridden
  void secondJoystickMovement(Vector2 value, Body body, dynamic constants) {}

  @mustBeOverridden
  String toJson() {
    return "";
  }
}
