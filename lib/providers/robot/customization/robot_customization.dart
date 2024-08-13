import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:player_move/components/robot/subsystems/drivetrain/drivetrain.dart';
import 'package:player_move/components/robot/subsystems/drivetrain/tank/tank_drivetrain.dart';
import 'package:player_move/components/robot/motors/neo1.1/neo_1.1_motor.dart';
import 'package:player_move/components/robot/subsystems/intake/intake.dart';
import 'package:player_move/components/robot/subsystems/intake/under_bumper/under_bumper.dart';
import 'package:player_move/components/robot/subsystems/shooter/fixed/fixed_shooter.dart';
import 'package:player_move/components/robot/subsystems/shooter/shooter.dart';
import 'package:player_move/providers/robot/customization/customization.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'robot_customization.g.dart';

@riverpod
class RobotCustomization extends _$RobotCustomization {
  @override
  FutureOr<Customization> build() async {
    return await _loadSettings();
  }

  Future<Customization> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    // Map<String, dynamic> defaultSwerve = SwerveDrivetrain(
    //   motors: NeoMotor(),
    //   wheel: BilletWheel(),
    //   gearRatio: L2GearRatio(),
    // ).toJson();
    Map<String, dynamic> defaultTank =
        TankDrivetrain(motors: NeoMotor()).toJson();
    late Map<String, dynamic> drivetrain;

    String? jsonDrivetrainString = prefs.getString('drivetrain');
    if (jsonDrivetrainString != null) {
      if (kDebugMode) {
        print(jsonDrivetrainString);
      }
      drivetrain = jsonDecode(jsonDrivetrainString);
    } else {
      if (kDebugMode) {
        print("Drivetrain prefs null");
      }
      drivetrain = defaultTank;
    }

    Drivetrain dt = Drivetrain.fromJson(drivetrain);

    Map<String, dynamic> defaultIntake = UnderBumperIntake().toJson();
    late Map<String, dynamic> intake;

    String? jsonIntakeString = prefs.getString('intake');
    if (jsonIntakeString != null) {
      if (kDebugMode) {
        print(jsonIntakeString);
      }
      intake = jsonDecode(jsonIntakeString);
    } else {
      if (kDebugMode) {
        print("Intake prefs null");
      }
      intake = defaultIntake;
    }

    Intake ik = Intake.fromJson(intake);

    Map<String, dynamic> defaultShooter =
        FixedShooter(motors: NeoMotor()).toJson();
    late Map<String, dynamic> shooter;

    String? jsonShooterString = prefs.getString('shooter');
    if (jsonShooterString != null) {
      if (kDebugMode) {
        print(jsonShooterString);
      }
      shooter = jsonDecode(jsonShooterString);
    } else {
      if (kDebugMode) {
        print("Shooter prefs null");
      }
      shooter = defaultShooter;
    }

    Shooter st = Shooter.fromJson(shooter);

    return Customization(drivetrain: dt, intake: ik, shooter: st);
    // return Customization(drivetrain: dt);
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

  void updateShooter(Shooter shooter) async {
    state.value?.shooter = shooter;
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('shooter', jsonEncode(shooter.toJson()));

    if (kDebugMode) {
      print("Shooter in Prefs: ${shooter.toJson().toString()}");
    }
    ref.notifyListeners();
  }

  void updateIntake(Intake intake) async {
    state.value?.intake = intake;
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('intake', jsonEncode(intake.toJson()));

    if (kDebugMode) {
      print("Intake in Prefs: ${intake.toJson().toString()}");
    }
    ref.notifyListeners();
  }
}
