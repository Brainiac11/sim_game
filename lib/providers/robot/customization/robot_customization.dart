import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:player_move/components/robot/drivetrain/drivetrain.dart';
import 'package:player_move/components/robot/drivetrain/tank/tank_drivetrain.dart';
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
  Future<Customization> build() async {
    return await _loadSettings();
    // if (state.value == null) {
    //   state.whenData((Customization cb) {
    //     return cb;
    //   });
    // } else {
    //   return state.value!;
    // }

    // return Customization(
    //   drivetrain: SwerveDrivetrain(
    //     motors: NeoMotor(),
    //     wheel: BilletWheel(),
    //     gearRatio: L2GearRatio(),
    //   ),
    // );
  }

  // SharedPreferences? getPrefs() {
  //   SharedPreferences.getInstance().then((value) {
  //     return value;
  //   });
  //   return null;
  // }

  Future<Customization> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    // Map<String, dynamic> defaultSwerve = SwerveDrivetrain(
    //   motors: NeoMotor(),
    //   wheel: BilletWheel(),
    //   gearRatio: L2GearRatio(),
    // ).toJson();
    Map<String, dynamic> defaultTank =
        TankDrivetrain(motors: NeoMotor()).toJson();
    // Map<String, dynamic> drivetrain = SwerveDrivetrain.fromJson(
    //     json.decode(prefs.getString("drivetrain")!.replaceAll("\n", ""))
    //             as Map<String, dynamic> ??
    //         defaultSwerve) as Map<String, dynamic>;
    // if (kDebugMode) {
    //   print("Drivetrain:  ${prefs.getString('drivetrain') ?? ""}");
    // }
    late Map<String, dynamic> drivetrain;

    String? jsonString = prefs.getString('drivetrain');
    if (jsonString != null) {
      if (kDebugMode) {
        print(jsonString);
      }
      drivetrain = jsonDecode(jsonString);
    } else {
      if (kDebugMode) {
        print("Drivetrain prefs null");
      }
      drivetrain = defaultTank;
    }

    Drivetrain dt = Drivetrain.fromJson(drivetrain);

    if (kDebugMode) {
      print("Drivetrain Config: ${(dt).motors.runtimeType}");
      print("Drivetrain Type: ${dt.runtimeType}");
    }

    // state = state.copyWith(drivetrain: dt);
    // state.value?.drivetrain = dt;

    // ref.notifyListeners();
    return Customization(drivetrain: dt);

    // state.drivetrain = dt;
  }

  void updateDrivetrain(Drivetrain drivetrain) async {
    state.value?.drivetrain = drivetrain;
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('drivetrain', jsonEncode(drivetrain.toJson()));

    if (kDebugMode) {
      print("Drivetrain in Prefs: ${drivetrain.toJson().toString()}");
    }
    ref.notifyListeners();
  }
}
