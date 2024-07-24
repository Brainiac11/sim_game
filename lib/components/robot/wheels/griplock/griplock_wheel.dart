import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/wheels/wheel.dart';
import 'package:player_move/providers/robot/robot_provider.dart';
part 'griplock_wheel.g.dart';

@JsonSerializable(explicitToJson: true)
class GriplockWheel extends Wheel {
  static const String kName = "Griplock";
  static const double kAcceleration = 9;
  static const double kCost = 4;
  GriplockWheel()
      : super(acceleration: kAcceleration, cost: kCost, name: kName);

  /// Need to update
  @override
  void updateTotalAcceleration(WidgetRef ref, dynamic provider) {
    final robot = ref.watch(robotProviderProvider);
    robot.kTranslationalAccelerationRate += kAcceleration;
    robot.kTranslationalDeccelerationRate += Wheel.kWheelDecceleration;
    robot.kTranslationalIdleDeccelerationRate +=
        Wheel.kWheelDecceleration / kAcceleration;
    robot.kAngularAccelerationRate += kAcceleration / 4;
    robot.kAngularDeccelerationRate += Wheel.kWheelDecceleration;
    robot.kAngularIdleDeccelerationRate +=
        Wheel.kWheelDecceleration / kAcceleration;
  }

  factory GriplockWheel.fromJson(Map<String, dynamic> json) =>
      _$GriplockWheelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GriplockWheelToJson(this);

  static Image toImage(BuildContext context) {
    return Image.asset(
      "assets/images/vex_griplock_wheel.png",
      height: MediaQuery.of(context).size.shortestSide / 8,
      width: MediaQuery.of(context).size.shortestSide / 8,
    );
  }

  @override
  void updateTotalCost(WidgetRef ref, constants) {
    // TODO: implement updateTotalCost
  }
}
