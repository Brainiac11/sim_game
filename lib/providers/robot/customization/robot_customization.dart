import 'package:flutter/foundation.dart';
import 'package:player_move/components/robot/drivetrain/drivetrain.dart';
import 'package:player_move/components/robot/gear_ratios/l_2_gear_ratio.dart';
import 'package:player_move/components/robot/drivetrain/swerve/swerve_drivetrain.dart';
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
    _loadSettings();
    return Customization(
      drivetrain: SwerveDrivetrain(
          motors: NeoMotor(), wheel: BilletWheel(), gearRatio: L2GearRatio()),
    );
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> drivetrain = prefs.getStringList("drivetrain") ??
        SwerveDrivetrain(
                motors: NeoMotor(),
                wheel: BilletWheel(),
                gearRatio: L2GearRatio())
            .toString()
            .split(',');
    List<String> dtL = drivetrain.toList(growable: false);
    Drivetrain dt;
    switch (dtL[0]) {
      case "SwerveDrivetrain":
        dt = SwerveDrivetrain(
            motors: NeoMotor(), wheel: BilletWheel(), gearRatio: L2GearRatio());
        break;
      default:
        dt = SwerveDrivetrain(
            motors: NeoMotor(), wheel: BilletWheel(), gearRatio: L2GearRatio());
    }
    switch (dtL[1]) {
      case "NEO":
        dt.motors = NeoMotor();
        break;
      default:
        dt.motors = NeoMotor();
    }

    if (dt.runtimeType == SwerveDrivetrain) {
      switch (dtL[2]) {
        case "Billet":
          dt = SwerveDrivetrain(
            motors: dt.motors,
            wheel: BilletWheel(),
            gearRatio: L2GearRatio(),
          );
      }
      switch (dtL[3]) {
        case "L2":
          dt = SwerveDrivetrain(
            motors: dt.motors,
            wheel: BilletWheel(),
            gearRatio: L2GearRatio(),
          );
      }
    }

    if (kDebugMode) {
      print("Drivetrain Config: ${dt.toString()}");
    }

    state = state.copyWith(drivetrain: dt);
  }

  void updateDrivetrain(Drivetrain drivetrain) async {
    state = state.copyWith(drivetrain: drivetrain);
    final prefs = await SharedPreferences.getInstance();

    prefs.setStringList('drivetrain', state.drivetrain.toString().split(','));

    if (kDebugMode) {
      print(
          "Drivetrain in Prefs: ${prefs.getStringList('drivetrain').toString()}");
    }
    ref.notifyListeners();
  }
}
