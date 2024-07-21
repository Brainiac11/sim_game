import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/gear_ratios/L2/l_2_gear_ratio.dart';
import 'package:player_move/components/robot/gear_ratios/L3/l_3_gear_ratio.dart';
import 'package:player_move/components/robot/gear_ratios/L4/l_4_gear_ratio.dart';
part 'gear_ratio.g.dart';

@JsonSerializable()
class GearRatio {
  GearRatio();
  @mustBeOverridden
  final double acceleration = 0;

  @mustBeOverridden
  final double maxSpeed = 0;

  @mustBeOverridden
  final double experience = 0;

  @mustBeOverridden
  void updateTotalAcceleration(WidgetRef ref, dynamic constants) {}

  @mustBeOverridden
  void updateMaxSpeed(WidgetRef ref, dynamic constants) {}

  @mustBeOverridden
  void updateTotalExperience(WidgetRef ref, dynamic constants) {}

  @mustBeOverridden
  @override
  String toString() {
    return "";
  }

  factory GearRatio.fromJson(Map<String, dynamic> json) {
    switch (json["name"]) {
      case "L2":
        return L2GearRatio.fromJson(json);
      case "L3":
        return L3GearRatio.fromJson(json);
      case "L4":
        return L4GearRatio.fromJson(json);

      default:
        return L2GearRatio.fromJson(json);
    }
  }
  @mustBeOverridden
  Map<String, dynamic> toJson() => _$GearRatioToJson(this);
}
