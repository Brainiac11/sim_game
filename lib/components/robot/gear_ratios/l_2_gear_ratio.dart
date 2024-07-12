import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/components/robot/gear_ratios/gear_ratio.dart';

class L2GearRatio extends GearRatio {
  @override
  double get acceleration => 10;

  @override
  double get experience => 14;

  @override
  double get maxSpeed => 5;

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
    return "L2";
  }
}
