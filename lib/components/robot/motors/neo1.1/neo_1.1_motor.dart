import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/providers/robot/robot_provider.dart';
part 'neo_1.1_motor.g.dart';

@JsonSerializable(explicitToJson: true)
class NeoMotor extends Motor {
  static const double kAcceleration = 8;
  static const double kMaximumSpeed = 7;
  static const double kCost = 10;
  static const String kName = "NEO";
  NeoMotor()
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
    robot.kAngularIdleDeccelerationRate +=
        Motor.kMotorDecceleration / (kAcceleration * 2);
  }

  @override
  FutureOr<void> updateTotalMaxSpeed(WidgetRef ref, dynamic constants) async {
    final robot = ref.watch(robotProviderProvider);
    robot.kMaxTranslationalSpeed += kMaximumSpeed;
    robot.kMaxAngularSpeed += kMaximumSpeed / 100;
  }

  static Image toImage(BuildContext context) {
    return Image.asset(
      "assets/images/NEO_11_motor.png",
      height: MediaQuery.of(context).size.shortestSide / 7,
      width: MediaQuery.of(context).size.shortestSide / 7,
    );
  }

  @override
  void updateTotalCost(WidgetRef ref, constants) {
    // TODO: implement updateTotalCost
  }

  factory NeoMotor.fromJson(Map<String, dynamic> json) =>
      _$NeoMotorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$NeoMotorToJson(this);
}
