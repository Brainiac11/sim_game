import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/motors/neo1.1/neo_1.1_motor.dart';
// part 'motor.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
abstract class Motor {
  double acceleration = 0;
  double maximumSpeed = 0;
  double cost = 0;
  String name = "";

  /// Optional for now, will integrate down the line
  final double energy = 0;

  Motor({
    required this.acceleration,
    required this.maximumSpeed,
    required this.cost,
    required this.name,
  });

  @mustBeOverridden
  void updateTotalAcceleration(WidgetRef ref, dynamic constants) {
    // TODO: implement updateTotalAcceleration
  }

  @mustBeOverridden
  void updateTotalMaxSpeed(WidgetRef ref, dynamic constants) {
    // TODO: implement updateTotalMaxSpeed
  }

  /// Will integrate later
  void updateTotalCost(WidgetRef ref, dynamic constants) {
    // TODO: implement updateTotalCost
  }

  static Image toImage() {
    return Image.asset("");
  }

  factory Motor.fromJson(Map<String, dynamic> json) {
    switch (json["name"]) {
      case "NEO":
        return NeoMotor.fromJson(json);
      default:
        return NeoMotor.fromJson(json);
    }
  }
  @mustBeOverridden
  Map<String, dynamic> toJson();
}
