import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/motors/falcon/falcon_motor.dart';
import 'package:player_move/components/robot/motors/kraken/kraken_motor.dart';
import 'package:player_move/components/robot/motors/neo1.1/neo_1.1_motor.dart';
import 'package:player_move/components/robot/motors/vortex/neo_vortex_motor.dart';
// part 'motor.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
abstract class Motor {
  double acceleration = 0;
  double maximumSpeed = 0;
  double cost = 0;
  String name = "";

  static const double kMotorDecceleration = 100;

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
    if (kDebugMode) {
      print(json['name'] + " Motor Name " + json.toString());
    }
    switch (json['name']) {
      case "NEO":
        return NeoMotor.fromJson(json);
      case "Vortex":
        return VortexMotor.fromJson(json);
      case "Falcon":
        return FalconMotor.fromJson(json);
      case "Kraken":
        return KrakenMotor.fromJson(json);
      default:
        throw (Error());
    }
  }
  @mustBeOverridden
  Map<String, dynamic> toJson();
}
