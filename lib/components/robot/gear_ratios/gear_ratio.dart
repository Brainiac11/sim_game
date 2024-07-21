import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/gear_ratios/L2/l_2_gear_ratio.dart';
import 'package:player_move/components/robot/gear_ratios/L3/l_3_gear_ratio.dart';
import 'package:player_move/components/robot/gear_ratios/L4/l_4_gear_ratio.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
abstract class GearRatio {
  GearRatio(
      {required this.acceleration,
      required this.maxSpeed,
      required this.experience,
      required this.name});
  final double acceleration;

  final double maxSpeed;

  final double experience;

  final String name;

  void updateTotalAcceleration(WidgetRef ref, dynamic constants) {}

  @mustBeOverridden
  void updateMaxSpeed(WidgetRef ref, dynamic constants) {}

  @mustBeOverridden
  void updateTotalExperience(WidgetRef ref, dynamic constants) {}

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
  Map<String, dynamic> toJson();
}
