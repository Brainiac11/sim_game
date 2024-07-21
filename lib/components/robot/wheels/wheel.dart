import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'wheel.g.dart';

@JsonSerializable()
class Wheel {
  double acceleration = 0;
  double cost = 0;

  // will implement later
  final double endurance = 0;

  Wheel({required this.acceleration, required this.cost});

  @mustBeOverridden
  void updateTotalAcceleration(WidgetRef ref, dynamic constants) {}

  /// will implement later
  void updateTotalCost(WidgetRef ref, dynamic constants) {}

  static Image toImage(BuildContext context) {
    return Image.asset("");
  }

  @mustBeOverridden
  @override
  String toString();

  factory Wheel.fromJson(Map<String, dynamic> json) => _$WheelFromJson(json);
  @mustBeOverridden
  Map<String, dynamic> toJson() => _$WheelToJson(this);
}
