import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/game_piece/game_piece.dart';
import 'package:player_move/components/game_piece/game_piece_enum.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/components/robot/subsystems/shooter/fixed/fixed_shooter.dart';
import 'package:player_move/components/robot/subsystems/shooter/pivot/pivot_shooter.dart';
import 'package:player_move/components/robot/subsystems/shooter/turret/turret_shooter.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
abstract class Shooter {
  String name;
  double space;
  double experience;
  double range = 0;
  Motor motors;
  Shooter({
    required this.name,
    required this.space,
    required this.experience,
    required this.motors,
  });

  @mustBeOverridden
  Vector2 gamePieceTrajectory(
      Vector2 robotPosition, Vector2 relativeTargetPosition);

  @mustBeOverridden
  void setRange();

  @mustBeOverridden
  GamePieceEnum changeGamePieceState(GamePiece gamePiece);

  factory Shooter.fromJson(Map<String, dynamic> json) {
    switch (json["name"]) {
      case "FixedShooter":
        return FixedShooter.fromJson(json);
      case "PivotShooter":
        return PivotShooter.fromJson(json);
      case "TurretShooter":
        return TurretShooter.fromJson(json);
      default:
        throw (Exception("Shooter not recognized"));
    }
  }
  Map<String, dynamic> toJson();
}
