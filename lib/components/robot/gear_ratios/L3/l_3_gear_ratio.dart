import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/gear_ratios/gear_ratio.dart';
part 'l_3_gear_ratio.g.dart';

@JsonSerializable()
class L3GearRatio extends GearRatio {
  L3GearRatio() : super();
  @override
  double get acceleration => 10;

  @override
  double get experience => 14;

  @override
  double get maxSpeed => 5;

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

  @override
  String toString() {
    return "L3";
  }

  factory L3GearRatio.fromJson(Map<String, dynamic> json) =>
      _$L3GearRatioFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$L3GearRatioToJson(this);
}
