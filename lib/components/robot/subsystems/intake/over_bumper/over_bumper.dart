import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:player_move/components/robot/subsystems/intake/intake.dart';

class OverBumperIntake extends Intake with RiverpodComponentMixin {
  static const String kName = "OverBumperIntake";

  OverBumperIntake() : super(name: kName);

  @override
  FutureOr<void> onLoad() {
    // TODO: implement onLoad
    throw UnimplementedError();
  }

  @override
  FutureOr<void> onMount() {
    super.onMount();
  }

  @override
  void whenActive() {
    // TODO: implement whenActive
  }

  @override
  void whenInactive() {
    // TODO: implement whenInactive
  }
}
