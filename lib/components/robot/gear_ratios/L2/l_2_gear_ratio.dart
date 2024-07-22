import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/gear_ratios/gear_ratio.dart';
part 'l_2_gear_ratio.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class L2GearRatio extends GearRatio {
  static const String kName = "L2";
  static const double kAcceleration = 10;
  static const double kMaxSpeed = 14;
  static const double kExperience = 5;
  L2GearRatio()
      : super(
            acceleration: kAcceleration,
            maxSpeed: kMaxSpeed,
            experience: kExperience,
            name: kName);

  @override
  void updateMaxSpeed(WidgetRef ref, constants) {}

  @override
  void updateTotalAcceleration(WidgetRef ref, constants) {
    // TODO: implement updateTotalAcceleration
  }

  @override
  void updateTotalExperience(WidgetRef ref, constants) {
    // TODO: implement updateTotalExperience
  }

  factory L2GearRatio.fromJson(Map<String, dynamic> json) =>
      _$L2GearRatioFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$L2GearRatioToJson(this);
}
