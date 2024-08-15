import 'package:flame/components.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/game_piece/game_piece.dart';
import 'package:player_move/components/game_piece/game_piece_enum.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/components/robot/subsystems/shooter/shooter.dart';
part 'fixed_shooter.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class FixedShooter extends Shooter {
  static const String kName = "FixedShooter";
  static const double kExperience = 0;
  static const double kCost = 0;
  static const double kSpace = 10;

  @JsonKey(includeFromJson: false, includeToJson: false)
  Vector2 relativeTargetPosition = Vector2.zero();

  FixedShooter({required super.motors})
      : super(name: kName, experience: kExperience, space: kSpace, cost: kCost);

  factory FixedShooter.fromJson(Map<String, dynamic> json) =>
      _$FixedShooterFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FixedShooterToJson(this);

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
    super.range = 6;
  }
}
