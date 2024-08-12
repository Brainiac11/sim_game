import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/game_piece/game_piece.dart';
import 'package:player_move/components/game_piece/game_piece_enum.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/components/robot/motors/neo1.1/neo_1.1_motor.dart';
import 'package:player_move/components/robot/subsystems/intake/intake.dart';
import 'package:player_move/components/robot/subsystems/shooter/shooter.dart';
import 'package:vector_math/vector_math_64.dart';
part 'fixed_shooter.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class FixedShooter extends Shooter {
  static const String kName = "FixedShooter";
  static const double kExperience = 0;
  static const double kSpace = 10;

  FixedShooter({required super.motors})
      : super(name: kName, experience: kExperience, space: kSpace);

  factory FixedShooter.fromJson(Map<String, dynamic> json) =>
      _$FixedShooterFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FixedShooterToJson(this);

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
