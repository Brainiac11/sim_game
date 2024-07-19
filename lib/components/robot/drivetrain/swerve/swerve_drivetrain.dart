import 'dart:convert';

import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:forge2d/src/dynamics/body.dart';
import 'package:player_move/components/robot/drivetrain/drivetrain.dart';
import 'package:player_move/components/robot/gear_ratios/gear_ratio.dart';
import 'package:player_move/components/robot/wheels/wheel.dart';

class SwerveDrivetrain extends Drivetrain {
  Wheel wheel;
  GearRatio gearRatio;
  SwerveDrivetrain({
    required super.motors,
    required this.wheel,
    required this.gearRatio,
  });

  @override
  void firstJoystickMovement(Vector2 value, Body body, dynamic constants) {
    body.applyLinearImpulse(value * constants.kTranslationalAccelerationRate);

    if (kDebugMode) {
      print(value.length);
    }
    body.linearVelocity.clampLength(0, constants.kMaxTranslationalSpeed);
    if (body.linearVelocity.length >
        value.length * constants.kTranslationalAccelerationRate) {
      body.linearDamping = constants.kTranslationalDeccelerationRate;
    } else {
      body.linearDamping = constants.kTranslationalIdleDeccelerationRate;
    }
  }

  @override
  void secondJoystickMovement(Vector2 value, Body body, dynamic constants) {
    body.angularVelocity
        .clamp(-constants.kMaxAngularSpeed, constants.kMaxAngularSpeed);
    body.applyAngularImpulse(value.x * constants.kAngularAccelerationRate);

    if (body.angularVelocity >
        value.x.abs() * constants.kAngularAccelerationRate) {
      body.angularDamping = constants.kAngularDeccelerationRate;
    } else {
      body.angularDamping = constants.kAngularIdleDeccelerationRate;
    }
  }

  @override
  String toJson() {
    String json = jsonEncode({
      "drivetrain": "SwerveDrivetrain",
      "motor": motors.toString(),
      "wheel": wheel.toString(),
      "gear ratio": gearRatio.toString()
    });
    if (kDebugMode) {
      print("Swerve Json: " + json);
    }
    return json;
  }
}
