import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/gear_ratios/gear_ratio.dart';
part 'l_4_gear_ratio.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class L4GearRatio extends GearRatio {
  static const String kName = "L4";
  L4GearRatio()
      : super(acceleration: 10, maxSpeed: 14, experience: 15, name: kName);

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

  factory L4GearRatio.fromJson(Map<String, dynamic> json) =>
      _$L4GearRatioFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$L4GearRatioToJson(this);
}
