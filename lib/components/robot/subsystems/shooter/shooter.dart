import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/motors/motor.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
abstract class Shooter {
  String name;
  double space;
  double experience;
  Motor motor;
  Shooter(
      {required this.name,
      required this.space,
      required this.experience,
      required this.motor});

  /// What happens to the Shooter Sprite when active
  @mustBeOverridden
  void whenActive();

  /// What happens to the Shooter Sprite when inactive
  @mustBeOverridden
  void whenInactive();

  factory Shooter.fromJson(Map<String, dynamic> json) {
    switch (json["name"]) {
      default:
        throw (Exception("Shooter not recognized"));
    }
  }
  Map<String, dynamic> toJson();
}
