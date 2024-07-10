import 'package:flutter_riverpod/src/consumer.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:riverpod/src/provider.dart';

class NeoMotor extends Motor {
  WidgetRef ref;
  Provider provider;
  NeoMotor({required this.ref, required this.provider})
      : super(acceleration: 14, maximumSpeed: 10, cost: 10);
  @override
  void updateTotalAcceleration(WidgetRef ref, Provider provider) {}

  @override
  void updateTotalMaxSpeed(WidgetRef ref, Provider provider) {
    // TODO: implement updateTotalMaxSpeed
  }
}
