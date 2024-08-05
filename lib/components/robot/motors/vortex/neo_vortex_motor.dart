import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/providers/robot/robot_provider.dart';
part 'neo_vortex_motor.g.dart';

@JsonSerializable(explicitToJson: true)
class VortexMotor extends Motor {
  static const double kAcceleration = 12;
  static const double kMaximumSpeed = 14;
  static const double kCost = 15;
  static const String kName = "Vortex";
  VortexMotor()
      : super(
          acceleration: kAcceleration,
          maximumSpeed: kMaximumSpeed,
          cost: kCost,
          name: kName,
        );

  @override
  FutureOr<void> updateTotalAcceleration(
      WidgetRef ref, dynamic constants) async {
    final robot = ref.watch(robotProviderProvider);
    robot.kTranslationalAccelerationRate += kAcceleration * 2;
    robot.kTranslationalDeccelerationRate +=
        Motor.kMotorDecceleration / kAcceleration;
    robot.kTranslationalIdleDeccelerationRate +=
        Motor.kMotorDecceleration / (kAcceleration * 2);
    robot.kAngularAccelerationRate += kAcceleration / 2;
    robot.kAngularDeccelerationRate += Motor.kMotorDecceleration / 2;
    robot.kAngularIdleDeccelerationRate -=
        Motor.kMotorDecceleration / (kAcceleration * 2);
  }

  @override
  FutureOr<void> updateTotalMaxSpeed(WidgetRef ref, dynamic constants) async {
    final robot = ref.watch(robotProviderProvider);
    robot.kMaxTranslationalSpeed += kMaximumSpeed;
    robot.kMaxAngularSpeed += kMaximumSpeed / 20;
  }

  static Image toImage(BuildContext context) {
    return Image.asset(
      "assets/images/neo_vortex_motor.png",
      height: MediaQuery.of(context).size.shortestSide / 8,
      width: MediaQuery.of(context).size.shortestSide / 8,
    );
  }

  @override
  void updateTotalCost(WidgetRef ref, constants) {
    // TODO: implement updateTotalCost
  }

  factory VortexMotor.fromJson(Map<String, dynamic> json) =>
      _$VortexMotorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VortexMotorToJson(this);
}
