
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/subsystems/intake/intake.dart';
part 'over_bumper.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class OverBumperIntake extends Intake {
  static const String kName = "OverBumperIntake";
  static const double kExperience = 10;
  static const double kSpace = 10;

  OverBumperIntake()
      : super(name: kName, experience: kExperience, space: kSpace);

  @override
  void whenActive() {
    // TODO: implement whenActive
  }

  @override
  void whenInactive() {
    // TODO: implement whenInactive
  }

  factory OverBumperIntake.fromJson(Map<String, dynamic> json) =>
      _$OverBumperIntakeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$OverBumperIntakeToJson(this);
}
