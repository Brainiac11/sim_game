import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:player_move/components/game_piece/game_piece.dart';
import 'package:player_move/components/robot/actions/action.dart';
import 'package:player_move/components/robot/robot.dart';
import 'package:player_move/components/robot/states/robot_states.dart';

class RobotIntake extends RobotAction {
  GamePiece gamePiece;

  @override
  Robot robot;

  RobotIntake({required this.robot, required this.gamePiece});

  @override
  RobotStates get state => RobotStates.intaking;

  @override
  bool constraints() {
    if (robot.children.contains(gamePiece)) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void onActive() {
    // TODO: implement onActive
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void setState(RobotStates state) {
    if (kDebugMode) {
      print(state);
    }
    super.setState(state);
  }
}
