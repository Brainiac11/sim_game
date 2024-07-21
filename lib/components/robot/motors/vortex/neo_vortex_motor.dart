
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/motors/motor.dart';
part 'neo_vortex_motor.g.dart';

@JsonSerializable()
class VortexMotor extends Motor {
  VortexMotor() : super(acceleration: 14, maximumSpeed: 10, cost: 10);
  @override
  void updateTotalAcceleration(WidgetRef ref, dynamic constants) {}

  @override
  void updateTotalMaxSpeed(WidgetRef ref, dynamic constants) {
    // TODO: implement updateTotalMaxSpeed
  }

  @override
  String toString() {
    return "Vortex";
  }

  static Image toImage(BuildContext context) {
    return Image.asset(
      "assets/images/NEO_11_motor.png",
      height: MediaQuery.of(context).size.shortestSide / 7,
      width: MediaQuery.of(context).size.shortestSide / 7,
    );
  }

  @override
  void updateTotalCost(WidgetRef ref, constants) {
    // TODO: implement updateTotalCost
  }

  factory VortexMotor.fromJson(Map<String, dynamic> json) =>
      _$VortexMotorFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$VortexMotorToJson(this);
}
