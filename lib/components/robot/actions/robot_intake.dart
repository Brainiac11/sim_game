// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:player_move/components/game_piece/game_piece.dart';
// import 'package:player_move/components/robot/actions/action.dart';
// import 'package:player_move/components/robot/robot.dart';
// import 'package:player_move/components/robot/states/robot_states.dart';
// import 'package:player_move/custom_widgets/gradient/gradient_enum.dart';
// import 'package:player_move/custom_widgets/gradient/gradient_widget.dart';

// class RobotIntake extends RobotAction {
//   GamePiece gamePiece;

//   @override
//   Robot robot;

//   RobotIntake({required this.robot, required this.gamePiece});

//   @override
//   final RobotStates state = RobotStates.intaking;

//   @override
//   bool constraints() {
//     if (robot.children.contains(gamePiece)) {
//       return false;
//     } else {
//       return true;
//     }
//   }

//   @override
//   void onActive() {
//     if (constraints()) {
//       robot.state = state;
//       GradientHud.gradientEnum = GradientEnum.intaking;
//     }
//   }

//   @override
//   void onInactive() {
//     if (robot.state == RobotStates.intaking &&
//         robot.children.contains(gamePiece)) {
//       robot.state == RobotStates.hasGamePiece;
//     }
//     if (GradientHud.gradientEnum == GradientEnum.intaking &&
//         robot.children.contains(gamePiece.spriteComponent)) {
//       GradientHud.gradientEnum = GradientEnum.hasNote;
//     }
//   }

//   @override
//   void setState(RobotStates state) {
//     if (kDebugMode) {
//       print(state);
//     }
//     super.setState(state);
//   }
// }
