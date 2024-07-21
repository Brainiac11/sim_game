import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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

  factory GearRatio.fromJson(Map<String, dynamic> json) =>
      _$GearRatioFromJson(json);
  @mustBeOverridden
  Map<String, dynamic> toJson() => _$GearRatioToJson(this);
}
