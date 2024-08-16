import 'package:flame/components.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/game_piece/game_piece.dart';
import 'package:player_move/components/game_piece/game_piece_enum.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/components/robot/subsystems/shooter/shooter.dart';
part 'turret_shooter.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class TurretShooter extends Shooter {
  static const String kName = "TurretShooter";
  static const double kExperience = 30;
  static const double kCost = 50;
  static const double kSpace = 20;

  @JsonKey(includeFromJson: false, includeToJson: false)
  Vector2 relativeTargetPosition = Vector2.zero();
  @JsonKey(includeFromJson: false, includeToJson: false)
  Vector2 ferryShotTarget = Vector2(10, 10);
  @JsonKey(includeFromJson: false, includeToJson: false)
  GamePiece? gamePiece;

  TurretShooter({required super.motors})
      : super(name: kName, experience: kExperience, space: kSpace, cost: kCost);

  factory TurretShooter.fromJson(Map<String, dynamic> json) =>
      _$TurretShooterFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TurretShooterToJson(this);

  @override
  GamePieceEnum changeGamePieceState(GamePiece gamePiece) {
    this.gamePiece = gamePiece;
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
    if (gamePiece?.gamePieceState == GamePieceEnum.ferryed) {
      return Vector2(0, 10 * motors.acceleration);
    }
    this.relativeTargetPosition = relativeTargetPosition;
    return Vector2(0, 10 * motors.acceleration)
      ..rotate(this.relativeTargetPosition.screenAngle());
  }

  @override
  void setRange() {
    range = motors.maximumSpeed + 6;
  }
}
