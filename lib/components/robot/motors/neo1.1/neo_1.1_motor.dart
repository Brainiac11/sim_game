import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/providers/robot/robot_provider.dart';
part 'neo_1.1_motor.g.dart';

@JsonSerializable(explicitToJson: true)
class NeoMotor extends Motor {
  static const double kAcceleration = 14;
  static const double kMaximumSpeed = 10;
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
  void updateTotalAcceleration(WidgetRef ref, dynamic constants) {
    final robot = ref.read(robotProviderProvider);
    robot.kTranslationalAccelerationRate += kAcceleration;
    robot.kTranslationalDeccelerationRate += kAcceleration / 10;
    robot.kTranslationalIdleDeccelerationRate += 1 / kAcceleration;
    robot.kAngularAccelerationRate += kAcceleration / 10;
    robot.kAngularDeccelerationRate += kAcceleration;
    robot.kAngularIdleDeccelerationRate += kAcceleration / 4;
  }

  @override
  void updateTotalMaxSpeed(WidgetRef ref, dynamic constants) {
    final robot = ref.read(robotProviderProvider);
    robot.kMaxTranslationalSpeed += kMaximumSpeed;
    robot.kMaxAngularSpeed += kMaximumSpeed / 10;
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
