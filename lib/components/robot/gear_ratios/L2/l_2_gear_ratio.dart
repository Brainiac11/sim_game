import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/gear_ratios/gear_ratio.dart';
import 'package:player_move/providers/robot/robot_provider.dart';
part 'l_2_gear_ratio.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class L2GearRatio extends GearRatio {
  static const String kName = "L2";
  static const double kAcceleration = 8;
  static const double kMaximumSpeed = 10;
  static const double kExperience = 8;
  L2GearRatio()
      : super(
            acceleration: kAcceleration,
            maxSpeed: kMaximumSpeed,
            experience: kExperience,
            name: kName);

  @override
  void updateTotalAcceleration(WidgetRef ref, dynamic constants) {
    final robot = ref.watch(robotProviderProvider);
    robot.kTranslationalAccelerationRate += kAcceleration;
    robot.kAngularAccelerationRate += kAcceleration / 2;
    if (kDebugMode) {
      print("Updating ${robot.kMaxTranslationalSpeed}");
    }
  }

  @override
  void updateTotalMaxSpeed(WidgetRef ref, dynamic constants) {
    final robot = ref.watch(robotProviderProvider);
    robot.kMaxTranslationalSpeed += kMaximumSpeed;
    robot.kMaxAngularSpeed += kMaximumSpeed / 10;
  }

  factory L2GearRatio.fromJson(Map<String, dynamic> json) =>
      _$L2GearRatioFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$L2GearRatioToJson(this);

  @override
  void updateTotalExperience(WidgetRef ref, constants) {
    // TODO: implement updateTotalExperience
  }
}
