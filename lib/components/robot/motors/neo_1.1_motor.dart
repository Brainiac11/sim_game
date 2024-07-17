import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/image.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/constants.dart';

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

  static ImageIcon toImage() {
    return ImageIcon(
      Image.asset(
        "assets/images/NEO_11_motor.png",
        fit: BoxFit.contain,
        color: null,
      ).image,
      color: null,
    );
  }
}
