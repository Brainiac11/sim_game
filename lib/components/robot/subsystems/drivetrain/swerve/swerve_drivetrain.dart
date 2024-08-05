import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge2d/src/dynamics/body.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/constants/robot_constants.dart';
import 'package:player_move/components/robot/subsystems/drivetrain/drivetrain.dart';
import 'package:player_move/components/robot/gear_ratios/gear_ratio.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/components/robot/wheels/wheel.dart';
import 'package:player_move/constants.dart';
part 'swerve_drivetrain.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class SwerveDrivetrain extends Drivetrain {
  Wheel wheel;
  GearRatio gearRatio;
  static const String kName = "SwerveDrivetrain";
  SwerveDrivetrain({
    required super.motors,
    required this.wheel,
    required this.gearRatio,
  }) : super(name: kName);

  // @override
  // FutureOr<void> firstJoystickMovement(
  //     Vector2 value, Body body, RobotConstants constants) async {
  //   body.applyLinearImpulse(value *
  //       constants.kTranslationalAccelerationRate *
  //       constants.kMultiplier);

  //   if (kDebugMode) {
  //     print(body.linearVelocity.length);

  //     // print(constants.kMultiplier);
  //   }
  //   body.linearVelocity.clampLength(
  //       0, constants.kMaxTranslationalSpeed * constants.kMultiplier);
  //   if (body.linearVelocity.length >
  //       value.length * constants.kTranslationalAccelerationRate) {
  //     body.linearDamping = constants.kTranslationalDeccelerationRate;
  //   } else {
  //     body.linearDamping = constants.kTranslationalIdleDeccelerationRate /
  //         (constants.kMultiplier *
  //             (constants.kHalfHeight * 2 * constants.kHalfWidth * 2));
  //   }
  // }

  // @override
  // FutureOr<void> secondJoystickMovement(
  //     Vector2 value, Body body, RobotConstants constants) async {
  //   body.angularVelocity
  //       .clamp(-constants.kMaxAngularSpeed, constants.kMaxAngularSpeed);
  //   body.applyAngularImpulse(
  //       value.x * constants.kAngularAccelerationRate * constants.kMultiplier);

  //   if (body.angularVelocity.abs() >
  //       value.x.abs() * constants.kAngularAccelerationRate) {
  //     body.angularDamping = constants.kAngularDeccelerationRate;
  //   } else {
  //     body.angularDamping = constants.kAngularIdleDeccelerationRate /
  //         (constants.kMultiplier *
  //             (constants.kHalfHeight * 2 * constants.kHalfWidth * 2));
  //   }
  // }

  @override
  FutureOr<void> firstJoystickMovement(
      Vector2 value, Body body, RobotConstants constants) async {
    body.applyForce(value *
        constants.kTranslationalAccelerationRate *
        constants.kTranslationalAccelerationRate *
        constants.kMultiplier *
        2);
    // body.applyLinearImpulse(value *
    //     constants.kTranslationalAccelerationRate *
    //     constants.kMultiplier);

    if (kDebugMode) {
      print(body.linearVelocity.length);

      // print(constants.kMultiplier);
    }
    body.linearVelocity.clampLength(0, constants.kMaxTranslationalSpeed);
    if (body.linearVelocity.length >
        value.length * constants.kTranslationalAccelerationRate) {
      body.linearDamping = constants.kTranslationalDeccelerationRate;
    } else {
      body.linearDamping = constants.kTranslationalIdleDeccelerationRate / 10;
      //   // 2.2 *
      //   // constants.kMultiplier /
      //   // (constants.kHalfHeight * constants.kHalfWidth);
    }
  }

  @override
  FutureOr<void> secondJoystickMovement(
      Vector2 value, Body body, RobotConstants constants) async {
    body.angularVelocity.clamp(
        -constants.kMaxAngularSpeed / 10, constants.kMaxAngularSpeed / 10);
    body.applyAngularImpulse(
        value.x * constants.kAngularAccelerationRate * constants.kMultiplier);
    // body.applyTorque(value.x *
    //     constants.kAngularAccelerationRate *
    //     constants.kAngularAccelerationRate *
    //     constants.kMultiplier);

    // body.applyForce(
    //     -value *
    //         constants.kAngularAccelerationRate *
    //         constants.kAngularAccelerationRate *
    //         constants.kMultiplier /
    //         2,
    //     point: body.position
    //       ..x += constants.kHalfHeight * 2
    //       ..y = constants.kHalfWidth * 2);

    if (kDebugMode) {
      print(body.angularVelocity);
    }
    if (body.angularVelocity.abs() >
        value.x.abs() * constants.kAngularAccelerationRate) {
      body.angularDamping = constants.kAngularDeccelerationRate;
    } else if (body.angularVelocity.abs() >= constants.kMaxAngularSpeed * 5) {
      body.angularDamping = constants.kAngularDeccelerationRate / 15;
    } else {
      body.angularDamping =
          constants.kMultiplier / constants.kAngularIdleDeccelerationRate;
    }
  }

  factory SwerveDrivetrain.fromJson(Map<String, dynamic> json) =>
      _$SwerveDrivetrainFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SwerveDrivetrainToJson(this);

  @override
  FutureOr<void> updateRobotConstants(WidgetRef ref) async {
    await super.updateRobotConstants(ref);
    // ref.read(robotProviderProvider.notifier).clear();
    if (kDebugMode) {
      print("Called Updated Robot Constants");
    }
    await super.motors.updateTotalAcceleration(ref, "");
    await super.motors.updateTotalMaxSpeed(ref, "");
    await gearRatio.updateTotalAcceleration(ref, "");
    await gearRatio.updateTotalMaxSpeed(ref, "");
    await wheel.updateTotalAcceleration(ref, "");

    // gearRatio.updateTotalAcceleration(ref, constants);
  }

  // @override
  // dynamic toJson() {
  //   final json = jsonEncode({
  //     "drivetrain": "SwerveDrivetrain",
  //     "motor": motors.toString(),
  //     "wheel": wheel.toString(),
  //     "gear ratio": gearRatio.toString()
  //   });
  //   if (kDebugMode) {
  //     print("Swerve Json: ${jsonDecode(json).runtimeType}");
  //   }
  //   return json;
  // }
}
