import 'package:flutter_riverpod/src/consumer.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:riverpod/src/provider.dart';

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
}
