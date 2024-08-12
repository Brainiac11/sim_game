import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/game_piece/game_piece.dart';
import 'package:player_move/components/game_piece/game_piece_enum.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/components/robot/motors/neo1.1/neo_1.1_motor.dart';
import 'package:player_move/components/robot/subsystems/intake/intake.dart';
import 'package:player_move/components/robot/subsystems/shooter/shooter.dart';
import 'package:vector_math/vector_math_64.dart';
part 'pivot_shooter.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class PivotShooter extends Shooter {
  static const String kName = "PivotShooter";
  static const double kExperience = 10;
  static const double kSpace = 15;

  PivotShooter({required super.motors})
      : super(name: kName, experience: kExperience, space: kSpace);

  factory PivotShooter.fromJson(Map<String, dynamic> json) =>
      _$PivotShooterFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PivotShooterToJson(this);

  @override
  GamePieceEnum changeGamePieceState(GamePiece gamePiece) {
    // TODO: implement changeGamePieceState
    throw UnimplementedError();
  }

  @override
  Vector2 gamePieceTrajectory(
      Vector2 robotPosition, Vector2 relativeTargetPosition) {
    // TODO: implement gamePieceTrajectory
    throw UnimplementedError();
  }

  @override
  void setRange() {
    // TODO: implement setRange
  }
}
