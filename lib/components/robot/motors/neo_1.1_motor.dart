import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:player_move/components/robot/motors/motor.dart';

class NeoMotor extends Motor {
  NeoMotor() : super(acceleration: 14, maximumSpeed: 10, cost: 10);
  @override
  void updateTotalAcceleration(WidgetRef ref, dynamic constants) {}

  @override
  void updateTotalMaxSpeed(WidgetRef ref, dynamic constants) {
    // TODO: implement updateTotalMaxSpeed
  }

  @override
  String toString() {
    return "NEO";
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

  @override
  String toJson() {
    return jsonEncode({"motor": "NEO"});
  }
}
