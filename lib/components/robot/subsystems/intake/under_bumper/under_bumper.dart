
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/subsystems/intake/intake.dart';
part 'under_bumper.g.dart';

@JsonSerializable(explicitToJson: true)
class UnderBumperIntake extends Intake {
  static const String kName = "UnderBumperIntake";
  static const double kExperience = 15;
  static const double kSpace = 20;
  UnderBumperIntake()
      : super(name: kName, experience: kExperience, space: kSpace);

  @override
  void whenActive() {
    // TODO: implement whenActive
  }

  @override
  void whenInactive() {
    // TODO: implement whenInactive
  }

  factory UnderBumperIntake.fromJson(Map<String, dynamic> json) =>
      _$UnderBumperIntakeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UnderBumperIntakeToJson(this);
}
