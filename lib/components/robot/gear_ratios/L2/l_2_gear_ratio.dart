import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/gear_ratios/gear_ratio.dart';
import 'package:player_move/providers/robot/robot_provider.dart';
part 'l_2_gear_ratio.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class L2GearRatio extends GearRatio {
  static const String kName = "L2";
  static const double kAcceleration = 10;
  static const double kMaximumSpeed = 14;
  static const double kExperience = 5;
  L2GearRatio()
      : super(
            acceleration: kAcceleration,
            maxSpeed: kMaximumSpeed,
            experience: kExperience,
            name: kName);

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

  factory L2GearRatio.fromJson(Map<String, dynamic> json) =>
      _$L2GearRatioFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$L2GearRatioToJson(this);

  @override
  void updateTotalExperience(WidgetRef ref, constants) {
    // TODO: implement updateTotalExperience
  }
}
