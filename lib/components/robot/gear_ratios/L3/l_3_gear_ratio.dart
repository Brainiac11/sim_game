import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/gear_ratios/gear_ratio.dart';
part 'l_3_gear_ratio.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class L3GearRatio extends GearRatio {
  static const String kName = "L3";
  L3GearRatio()
      : super(acceleration: 10, maxSpeed: 14, experience: 5, name: kName);

  @override
  void updateMaxSpeed(WidgetRef ref, constants) {
    // TODO: implement updateMaxSpeed
  }

  @override
  void updateTotalAcceleration(WidgetRef ref, constants) {
    // TODO: implement updateTotalAcceleration
  }

  @override
  void updateTotalExperience(WidgetRef ref, constants) {
    // TODO: implement updateTotalExperience
  }

  factory L3GearRatio.fromJson(Map<String, dynamic> json) =>
      _$L3GearRatioFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$L3GearRatioToJson(this);
}
