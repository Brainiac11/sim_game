import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/subsystems/intake/over_bumper/over_bumper.dart';
import 'package:player_move/components/robot/subsystems/intake/under_bumper/under_bumper.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
abstract class Intake {
  String name;
  double space;
  double experience;
  Intake({required this.name, required this.space, required this.experience});

  /// What happens to the Intake Sprite when active
  @mustBeOverridden
  void whenActive();

  /// What happens to the Intake Sprite when inactive
  @mustBeOverridden
  void whenInactive();

  factory Intake.fromJson(Map<String, dynamic> json) {
    switch (json["name"]) {
      case "OverBumperIntake":
        return OverBumperIntake.fromJson(json);
      case "UnderBumperIntake":
        return UnderBumperIntake.fromJson(json);
      default:
        throw (Exception("Intake not recognized"));
    }
  }
  Map<String, dynamic> toJson();
}
