import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge2d/src/dynamics/body.dart';
import 'package:player_move/components/robot/drivetrain/drivetrain.dart';
import 'package:player_move/components/robot/wheels/wheel.dart';

class SwerveDrivetrain extends Drivetrain {
  Wheel wheel;
  SwerveDrivetrain({
    required super.motors,
    required this.wheel,
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
  String toString() {
    return ["SwerveDrivetrain", wheel.toString()].toString();
  }
}
