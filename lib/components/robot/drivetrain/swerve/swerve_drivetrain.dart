import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forge2d/src/dynamics/body.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/constants/robot_constants.dart';
import 'package:player_move/components/robot/drivetrain/drivetrain.dart';
import 'package:player_move/components/robot/gear_ratios/gear_ratio.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/components/robot/wheels/wheel.dart';
import 'package:player_move/constants.dart';
import 'package:player_move/providers/robot/customization/robot_customization.dart';
import 'package:player_move/providers/robot/robot_provider.dart';
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

  @override
  void firstJoystickMovement(
      Vector2 value, Body body, RobotConstants constants) {
    body.applyLinearImpulse(value *
        constants.kTranslationalAccelerationRate *
        constants.kMultiplier);

    if (kDebugMode) {
      // print(body.linearVelocity.length);

      print(constants.kDensity);
    }
    body.linearVelocity.clampLength(0, constants.kMaxTranslationalSpeed);
    if (body.linearVelocity.length >
        value.length * constants.kTranslationalAccelerationRate) {
      body.linearDamping =
          constants.kTranslationalDeccelerationRate * constants.kMultiplier;
    } else {
      body.linearDamping = constants.kTranslationalIdleDeccelerationRate *
          constants.kMultiplier /
          4;
    }
  }

  @override
  void secondJoystickMovement(
      Vector2 value, Body body, RobotConstants constants) {
    body.angularVelocity
        .clamp(-constants.kMaxAngularSpeed, constants.kMaxAngularSpeed);
    body.applyAngularImpulse(
        value.x * constants.kAngularAccelerationRate * constants.kMultiplier);

    if (body.angularVelocity >
        value.x.abs() * constants.kAngularAccelerationRate) {
      body.angularDamping = constants.kAngularDeccelerationRate;
    } else {
      body.angularDamping =
          constants.kAngularIdleDeccelerationRate * constants.kMultiplier / 6;
    }
  }

  factory SwerveDrivetrain.fromJson(Map<String, dynamic> json) =>
      _$SwerveDrivetrainFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SwerveDrivetrainToJson(this);

  @override
  void updateRobotConstants(WidgetRef ref) {
    super.updateRobotConstants(ref);
    // ref.read(robotProviderProvider.notifier).clear();
    if (kDebugMode) {
      print("Called Updated Robot Constants");
      print(toJson());
    }
    super.motors.updateTotalAcceleration(ref, "");
    super.motors.updateTotalMaxSpeed(ref, "");
    gearRatio.updateTotalAcceleration(ref, "");
    gearRatio.updateTotalMaxSpeed(ref, "");
    wheel.updateTotalAcceleration(ref, "");

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
