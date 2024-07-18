import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/components/robot/gear_ratios/gear_ratio.dart';

class L4GearRatio extends GearRatio {
  @override
  double get acceleration => 13;

  @override
  double get experience => 30;

  @override
  double get maxSpeed => 10;

  @override
  void updateMaxSpeed(WidgetRef ref, constants) {
    // TODO: implement updateMaxSpeed
  }

  @override
  void updateTotalAcceleration(WidgetRef ref, constants) {
    // TODO: implement updateTotalAcceleration
  }

  @override
  void updateTotalExperience(WidgetRef ref, constants) {
    // TODO: implement updateTotalExperience
  }

  @override
  String toString() {
    return "L4";
  }
}
