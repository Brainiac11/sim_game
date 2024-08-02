// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:player_move/components/robot/robot.dart';
// import 'package:player_move/components/robot/states/robot_states.dart';

// abstract class RobotAction {
//   @mustBeOverridden
//   late final RobotStates state;

//   @mustBeOverridden
//   late Robot robot;

//   /// returns true when action can be executed, false when action cannot be executed
//   /// based on set constraints and conditions
//   @mustBeOverridden
//   bool constraints();

//   @mustBeOverridden
//   @mustCallSuper
//   void setState(RobotStates state) {
//     robot.state = state;
//   }

//   @mustBeOverridden
//   void onActive();

//   @mustBeOverridden
//   void onInactive();
// }
