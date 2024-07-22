// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:player_move/components/robot/drivetrain/swerve/swerve_drivetrain.dart';
import 'package:player_move/components/robot/gear_ratios/L2/l_2_gear_ratio.dart';
import 'package:player_move/components/robot/motors/neo1.1/neo_1.1_motor.dart';
import 'package:player_move/components/robot/wheels/billet/billet_wheel.dart';

void main() {
  group('JSON Serialization', () {
    test('SwerveDrivetrain serialization and deserialization', () {
      Map<String, dynamic> userMap = SwerveDrivetrain(
              motors: NeoMotor(),
              gearRatio: L2GearRatio(),
              wheel: BilletWheel())
          .toJson();

      // Deserialize JSON to Dart object
      String jsonString = jsonEncode(userMap);
      SwerveDrivetrain obj = SwerveDrivetrain.fromJson(jsonDecode(jsonString));

      // Assertions
      expect(obj, isA<SwerveDrivetrain>());
      SwerveDrivetrain driveObj = obj;
      expect(driveObj.gearRatio.runtimeType, L2GearRatio);
      expect(driveObj.motors.runtimeType, NeoMotor);
      expect(driveObj.name, "SwerveDrivetrain");
      expect(driveObj.wheel.runtimeType, BilletWheel);

      if (kDebugMode) {
        print("Succuess!?");
        print(driveObj.toJson());
      }

      // Serialize Dart object to JSON
      String json = jsonEncode(obj.toJson());

      // Check if the serialized JSON matches the original JSON string (ignoring whitespace)
      Map<String, dynamic> originalJsonMap = jsonDecode(jsonString);
      Map<String, dynamic> serializedJsonMap = jsonDecode(json);
      expect(serializedJsonMap, originalJsonMap);
    });
  });
}
