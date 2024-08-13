import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/game_piece/game_piece.dart';
import 'package:player_move/components/game_piece/game_piece_enum.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/components/robot/subsystems/shooter/shooter.dart';
part 'pivot_shooter.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class PivotShooter extends Shooter {
  static const String kName = "PivotShooter";
  static const double kExperience = 10;
  static const double kCost = 30;
  static const double kSpace = 15;

  @JsonKey(includeFromJson: false, includeToJson: false)
  Vector2 relativeTargetPosition = Vector2.zero();
  PivotShooter({required super.motors})
      : super(name: kName, experience: kExperience, space: kSpace, cost: kCost);

  factory PivotShooter.fromJson(Map<String, dynamic> json) =>
      _$PivotShooterFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PivotShooterToJson(this);

  @override
  GamePieceEnum changeGamePieceState(GamePiece gamePiece) {
    if (relativeTargetPosition.length >= range) {
      gamePiece.gamePieceState = GamePieceEnum.ferryed;
    } else {
      gamePiece.gamePieceState = GamePieceEnum.shot;
    }
    return gamePiece.gamePieceState;
  }

  @override
  Vector2 gamePieceTrajectory(
      Vector2 robotPosition, Vector2 relativeTargetPosition) {
    this.relativeTargetPosition = relativeTargetPosition;
    return Vector2(0, 10 * motors.acceleration)
      ..rotate(robotPosition.screenAngle());
  }

  @override
  void setRange() {
    range = motors.maximumSpeed + 6;
  }
}
