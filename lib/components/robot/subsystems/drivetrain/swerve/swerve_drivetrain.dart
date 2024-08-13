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
part 'swerve_drivetrain.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class SwerveDrivetrain extends Drivetrain {
  Wheel wheel;
  GearRatio gearRatio;
  static const String kName = "SwerveDrivetrain";
  static const double kExperience = 30;
  SwerveDrivetrain({
    required super.motors,
    required this.wheel,
    required this.gearRatio,
  }) : super(name: kName, experience: kExperience);

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
    // body.applyForce(
    //   value * constants.kTranslationalAccelerationRate * body.inertia,
    // );
    body.applyForce(value *
        constants.kTranslationalAccelerationRate *
        body.inertia *
        (body.mass / (constants.kDensity * 2)));

    body.linearVelocity.clampLength(0, constants.kMaxTranslationalSpeed / 2);
    if (kDebugMode) {
      print(body.linearVelocity.length);
    }
    if (body.linearVelocity.length >
        value.length * constants.kTranslationalAccelerationRate) {
      body.linearDamping = constants.kTranslationalDeccelerationRate;
    } else {
      body.linearDamping = constants.kTranslationalIdleDeccelerationRate;
    }
  }

  @override
  FutureOr<void> secondJoystickMovement(
      Vector2 value, Body body, RobotConstants constants) async {
    body.applyAngularImpulse(value.x * constants.kAngularAccelerationRate * 3);
    body.angularVelocity
        .clamp(-constants.kMaxAngularSpeed, constants.kMaxAngularSpeed);
    if (body.angularVelocity.abs() >
        value.x.abs() * constants.kAngularAccelerationRate) {
      body.angularDamping = constants.kAngularDeccelerationRate;
    } else {
      body.angularDamping = constants.kAngularIdleDeccelerationRate / 2;
    }
    if (kDebugMode) {
      // print(constants.kAngularIdleDeccelerationRate);
      print(body.angularVelocity);
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
