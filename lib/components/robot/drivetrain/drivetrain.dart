import 'dart:convert';

import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/motors/motor.dart';

@JsonSerializable()
abstract class Drivetrain {
  Motor motors;

  Drivetrain({required this.motors});

  @mustBeOverridden
  void firstJoystickMovement(Vector2 value, Body body, dynamic constants) {}

  @mustBeOverridden
  void secondJoystickMovement(Vector2 value, Body body, dynamic constants) {}

  @mustBeOverridden
  String toJson() {
    return jsonEncode("");
  }
}

class DrivetrainConvertable extends JsonConverter<String, Object?> {
  @override
  String fromJson(Object? json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Object? toJson(String object) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
