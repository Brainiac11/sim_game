import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:player_move/components/robot/drivetrain/drivetrain.dart';
import 'package:player_move/components/robot/gear_ratios/L2/l_2_gear_ratio.dart';
import 'package:player_move/components/robot/drivetrain/swerve/swerve_drivetrain.dart';
import 'package:player_move/components/robot/motors/neo1.1/neo_1.1_motor.dart';
import 'package:player_move/components/robot/wheels/billet/billet_wheel.dart';
import 'package:player_move/providers/robot/customization/customization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'robot_customization.g.dart';

@riverpod
class RobotCustomization extends _$RobotCustomization {
  @override
  Customization build() {
    _loadSettings();
    return Customization(
      drivetrain: SwerveDrivetrain(
          motors: NeoMotor(), wheel: BilletWheel(), gearRatio: L2GearRatio()),
    );
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final Map<String, dynamic> drivetrain = SwerveDrivetrain(
      motors: NeoMotor(),
      wheel: BilletWheel(),
      gearRatio: L2GearRatio(),
    ).toJson();

    if (kDebugMode) {
      print("Decoded Json  ${drivetrain.toString()}");
      print("Json runtime type ${drivetrain.runtimeType}");
    }
    Drivetrain dt = SwerveDrivetrain.fromJson(drivetrain);
    // switch (dtL[0]) {
    //   case "SwerveDrivetrain":
    //     dt = SwerveDrivetrain(
    //         motors: NeoMotor(), wheel: BilletWheel(), gearRatio: L2GearRatio());
    //     break;
    //   default:
    //     if (kDebugMode) {
    //       print("defaulting drivetrain");
    //     }
    //     dt = SwerveDrivetrain(
    //         motors: NeoMotor(), wheel: BilletWheel(), gearRatio: L2GearRatio());
    // }
    // switch (dtL[1]) {
    //   case "NEO":
    //     dt.motors = NeoMotor();
    //     break;
    //   default:
    //     dt.motors = NeoMotor();
    // }

    // if (dt.runtimeType == SwerveDrivetrain) {
    //   switch (dtL[2]) {
    //     case "Billet":
    //       dt = SwerveDrivetrain(
    //         motors: dt.motors,
    //         wheel: BilletWheel(),
    //         gearRatio: (dt as SwerveDrivetrain).gearRatio,
    //       );
    //   }
    //   switch (dtL[3]) {
    //     case "L2":
    //       if (kDebugMode) {
    //         print("Boo");
    //       }
    //       dt = SwerveDrivetrain(
    //         motors: dt.motors,
    //         wheel: (dt as SwerveDrivetrain).wheel,
    //         gearRatio: L2GearRatio(),
    //       );
    //       break;
    //     case "L3":
    //       dt = SwerveDrivetrain(
    //         motors: dt.motors,
    //         wheel: (dt as SwerveDrivetrain).wheel,
    //         gearRatio: L3GearRatio(),
    //       );
    //       break;
    //     case "L4":
    //       dt = SwerveDrivetrain(
    //         motors: dt.motors,
    //         wheel: (dt as SwerveDrivetrain).wheel,
    //         gearRatio: L4GearRatio(),
    //       );
    //       break;
    //     default:
    //       print(dtL[3]);
    //       dt = SwerveDrivetrain(
    //         motors: dt.motors,
    //         wheel: (dt as SwerveDrivetrain).wheel,
    //         gearRatio: L2GearRatio(),
    //       );
    //       break;
    //   }
    // }

    if (kDebugMode) {
      print(
          "Drivetrain Config: ${(dt as SwerveDrivetrain).gearRatio.toString()}");
      print("Gear Ratio Config: ${dt.runtimeType}");
    }

    state = state.copyWith(drivetrain: dt);

    // state.drivetrain = dt;
  }

  void updateDrivetrain(Drivetrain drivetrain) async {
    state = state.copyWith(drivetrain: drivetrain);
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('drivetrain', jsonEncode(state.drivetrain));

    if (kDebugMode) {
      print("Drivetrain in Prefs: ${prefs.getString('drivetrain')}");
    }
    ref.notifyListeners();
  }
}
