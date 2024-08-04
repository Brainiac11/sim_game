import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/gear_ratios/gear_ratio.dart';
import 'package:player_move/providers/robot/robot_provider.dart';
part 'l_3_gear_ratio.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class L3GearRatio extends GearRatio {
  static const String kName = "L3";
  static const double kAcceleration = 14;
  static const double kMaximumSpeed = 10;
  static const double kExperience = 10;
  L3GearRatio()
      : super(
            acceleration: kAcceleration,
            maxSpeed: kMaximumSpeed,
            experience: kExperience,
            name: kName);

  @override
  FutureOr<void> updateTotalAcceleration(
      WidgetRef ref, dynamic constants) async {
    final robot = ref.watch(robotProviderProvider);
    robot.kTranslationalAccelerationRate += kAcceleration;
    robot.kAngularAccelerationRate += kAcceleration / 2;
    if (kDebugMode) {
      print("Updating ${robot.kMaxTranslationalSpeed}");
    }
  }

  @override
  FutureOr<void> updateTotalMaxSpeed(WidgetRef ref, dynamic constants) async {
    final robot = ref.watch(robotProviderProvider);
    robot.kMaxTranslationalSpeed += kMaximumSpeed;
    robot.kMaxAngularSpeed += kMaximumSpeed / 20;
  }

  @override
  FutureOr<void> updateTotalExperience(WidgetRef ref, constants) async {
    // TODO: implement updateTotalExperience
  }

  factory L3GearRatio.fromJson(Map<String, dynamic> json) =>
      _$L3GearRatioFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$L3GearRatioToJson(this);
}
