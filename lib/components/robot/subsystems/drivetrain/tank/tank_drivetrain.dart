import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge2d/src/dynamics/body.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/constants/robot_constants.dart';
import 'package:player_move/components/robot/subsystems/drivetrain/drivetrain.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/providers/robot/robot_provider.dart';
part 'tank_drivetrain.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class TankDrivetrain extends Drivetrain {
  static const String kName = "TankDrivetrain";
  TankDrivetrain({
    required super.motors,
  }) : super(name: kName, experience: 0);

  // @override
  // FutureOr<void> firstJoystickMovement(
  //     Vector2 value, Body body, RobotConstants constants) async {
  //   Vector2 robotRelativeTranslation = Vector2(0, value.y);
  //   // robotRelativeTranslation.length = value.y;
  //   robotRelativeTranslation.rotate(body.angle);
  //   body.applyLinearImpulse(robotRelativeTranslation *
  //       constants.kTranslationalAccelerationRate *
  //       constants.kMultiplier);

  //   if (kDebugMode) {
  //     print(body.linearVelocity.length);

  //     // print(constants.kMultiplier);
  //   }
  //   body.linearVelocity.clampLength(0, constants.kMaxTranslationalSpeed);
  //   if (body.linearVelocity.length >
  //       value.y.abs() * constants.kTranslationalAccelerationRate) {
  //     body.linearDamping = constants.kTranslationalDeccelerationRate;
  //   } else {
  //     body.linearDamping = constants.kTranslationalIdleDeccelerationRate *
  //         2.2 *
  //         constants.kMultiplier /
  //         (constants.kHalfHeight * constants.kHalfWidth);
  //   }
  // }

  @override
  FutureOr<void> firstJoystickMovement(
      Vector2 value, Body body, RobotConstants constants) async {
    // body.applyForce(
    //   value * constants.kTranslationalAccelerationRate * body.inertia,
    // );
    value.x = 0;
    body.applyForce((value..rotate(body.angle)) *
        constants.kTranslationalAccelerationRate *
        body.inertia *
        (body.mass / (constants.kDensity * 4)));

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
    body.applyAngularImpulse(value.x * constants.kAngularAccelerationRate * 2);
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
  // @override
  // FutureOr<void> secondJoystickMovement(
  //     Vector2 value, Body body, RobotConstants constants) async {
  //   body.angularVelocity
  //       .clamp(-constants.kMaxAngularSpeed, constants.kMaxAngularSpeed);
  //   body.applyAngularImpulse(
  //       value.x * constants.kAngularAccelerationRate * constants.kMultiplier);

  //   if (body.angularVelocity.abs() >
  //       value.x.abs() * constants.kAngularAccelerationRate) {
  //     body.angularDamping =
  //         constants.kAngularDeccelerationRate * constants.kMultiplier;
  //   } else {
  //     body.angularDamping = constants.kAngularIdleDeccelerationRate *
  //         1.2 *
  //         constants.kMultiplier /
  //         (constants.kHalfHeight * constants.kHalfWidth);
  //   }
  // }

  factory TankDrivetrain.fromJson(Map<String, dynamic> json) =>
      _$TankDrivetrainFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TankDrivetrainToJson(this);

  @override
  FutureOr<void> updateRobotConstants(WidgetRef ref) async {
    await super.updateRobotConstants(ref);
    // ref.read(robotProviderProvider.notifier).clear();
    if (kDebugMode) {
      print("Called Updated Robot Constants");
      print(toJson());
    }
    await super.motors.updateTotalAcceleration(ref, "");
    await super.motors.updateTotalMaxSpeed(ref, "");
    _tankDriveMultiplier(ref);
    // gearRatio.updateTotalAcceleration(ref, constants);
  }

  void _tankDriveMultiplier(WidgetRef ref) {
    ref.read(robotProviderProvider)
      ..kAngularAccelerationRate += 10
      ..kAngularDeccelerationRate += 2
      ..kAngularIdleDeccelerationRate += 0.4
      ..kMaxAngularSpeed += 5
      ..kTranslationalAccelerationRate += 15
      ..kTranslationalDeccelerationRate += 4
      ..kTranslationalIdleDeccelerationRate += 1
      ..kMaxTranslationalSpeed += 15;
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
