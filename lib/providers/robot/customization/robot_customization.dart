import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:player_move/components/robot/drivetrain/drivetrain.dart';
import 'package:player_move/components/robot/drivetrain/swerve_drivetrain.dart';
import 'package:player_move/components/robot/motors/neo_1.1_motor.dart';
import 'package:player_move/components/robot/wheels/billet_wheel.dart';
import 'package:player_move/providers/robot/customization/customization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'robot_customization.g.dart';

@riverpod
class RobotCustomization extends _$RobotCustomization {
  @override
  Customization build() {
    return Customization(
      drivetrain: SwerveDrivetrain(motors: NeoMotor(), wheel: BilletWheel()),
    );
  }

  void updateDrivetrain(Drivetrain drivetrain) async {
    state = state.copyWith(drivetrain: drivetrain);
    final prefs = await SharedPreferences.getInstance();

    prefs.setStringList('drivetrain', [
      state.drivetrain
          .toString()
          .split(',')
          .join(state.drivetrain.motors.toString())
    ]);

    if (kDebugMode) {
      print(
          "Drivetrain in Prefs: ${prefs.getStringList('drivetrain').toString()}");
    }
    ref.notifyListeners();
  }
}
