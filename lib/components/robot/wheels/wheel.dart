import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/wheels/billet/billet_wheel.dart';
import 'package:player_move/components/robot/wheels/griplock/griplock_wheel.dart';

// part 'wheel.g.dart';
@JsonSerializable(explicitToJson: true, anyMap: true)
abstract class Wheel {
  double acceleration = 0;
  double cost = 0;
  String name = "";
  static const double kWheelDecceleration = 10;
  // will implement later
  final double endurance = 0;

  Wheel({required this.acceleration, required this.cost, required this.name});

  @mustBeOverridden
  void updateTotalAcceleration(WidgetRef ref, dynamic constants) {}

  /// will implement later
  void updateTotalCost(WidgetRef ref, dynamic constants) {}

  static Image toImage(BuildContext context) {
    return Image.asset("");
  }

  factory Wheel.fromJson(Map<String, dynamic> json) {
    switch (json["name"]) {
      case "Billet":
        return BilletWheel.fromJson(json);
      case "Griplock":
        return GriplockWheel.fromJson(json);
      default:
        return BilletWheel.fromJson(json);
    }
  }
  @mustBeOverridden
  Map<String, dynamic> toJson();
}
