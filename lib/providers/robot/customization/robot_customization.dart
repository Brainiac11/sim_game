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
    Map<String, dynamic> defaultSwerve = SwerveDrivetrain(
      motors: NeoMotor(),
      wheel: BilletWheel(),
      gearRatio: L2GearRatio(),
    ).toJson();
    // Map<String, dynamic> drivetrain = SwerveDrivetrain.fromJson(
    //     json.decode(prefs.getString("drivetrain")!.replaceAll("\n", ""))
    //             as Map<String, dynamic> ??
    //         defaultSwerve) as Map<String, dynamic>;
    if (kDebugMode) {
      print("Drivetrain:  ${prefs.getString('drivetrain') ?? ""}");
    }
    late Map<String, dynamic> drivetrain;

    String? jsonString = prefs.getString('drivetrain');
    if (jsonString != null) {
      drivetrain = jsonDecode(jsonString);
    } else {
      drivetrain = defaultSwerve;
    }

    Drivetrain dt = SwerveDrivetrain.fromJson(drivetrain);

    if (kDebugMode) {
      print(
          "Drivetrain Config: ${(dt as SwerveDrivetrain).motors.runtimeType}");
      print("Gear Ratio Config: ${dt.runtimeType}");
    }

    state = state.copyWith(drivetrain: dt);

    // state.drivetrain = dt;
  }

  void updateDrivetrain(Drivetrain drivetrain) async {
    state = state.copyWith(drivetrain: drivetrain);
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('drivetrain', jsonEncode(drivetrain.toJson()));

    if (kDebugMode) {
      print("Drivetrain in Prefs: ${drivetrain.toJson().toString()}");
    }
    ref.notifyListeners();
  }
}
