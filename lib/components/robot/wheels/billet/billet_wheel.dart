import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/wheels/wheel.dart';
import 'package:player_move/providers/robot/robot_provider.dart';
part 'billet_wheel.g.dart';

@JsonSerializable(explicitToJson: true)
class BilletWheel extends Wheel {
  static const String kName = "Billet";
  static const double kAcceleration = 8;
  static const double kCost = 4;
  BilletWheel() : super(acceleration: kAcceleration, cost: kCost, name: kName);

  /// Need to update
  @override
  void updateTotalAcceleration(WidgetRef ref, dynamic provider) {
    final robot = ref.watch(robotProviderProvider);
    robot.kTranslationalAccelerationRate += kAcceleration;
    robot.kTranslationalDeccelerationRate += kAcceleration / 4;
    robot.kTranslationalIdleDeccelerationRate += kAcceleration / 2;
    robot.kAngularIdleDeccelerationRate += kAcceleration / 20;
    robot.kAngularAccelerationRate += kAcceleration / 4;
    robot.kAngularDeccelerationRate += kAcceleration / 10;
  }

  factory BilletWheel.fromJson(Map<String, dynamic> json) =>
      _$BilletWheelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BilletWheelToJson(this);

  static Image toImage(BuildContext context) {
    return Image.asset(
      "assets/images/billet_wheel.png",
      height: MediaQuery.of(context).size.shortestSide / 9,
      width: MediaQuery.of(context).size.shortestSide / 9,
    );
  }

  @override
  void updateTotalCost(WidgetRef ref, constants) {
    // TODO: implement updateTotalCost
  }
}
