import 'package:flame/game.dart';
import 'package:player_move/components/game.dart';
import 'package:player_move/constants.dart';

/// 0th element is position
/// 1st element is first parameter for EdgeShape()..set();
/// 2nd element is second parameter for EdgeShape()..set();
final kRightBorder = List.from(<Vector2>[
  Vector2(
      -3072 / 2 / RoboticsGame.zoomLevel, -1420 / 2 / RoboticsGame.zoomLevel),
  Vector2.zero(),
  Vector2(0, 1420 / RoboticsGame.zoomLevel),
]);

final kLeftBorder = List.from(<Vector2>[
  Vector2(
      3072 / 2 / RoboticsGame.zoomLevel, -1420 / 2 / RoboticsGame.zoomLevel),
  Vector2.zero(),
  Vector2(0, 1420 / RoboticsGame.zoomLevel),
]);

final kTopBorder = List.from(<Vector2>[
  // Vector2(-kWorldSize.x / 2, -kWorldSize.y / 2 + 1 * kPixelScale),
  Vector2(
      -3072 / 2 / RoboticsGame.zoomLevel, -1420 / 2 / RoboticsGame.zoomLevel),
  Vector2.zero(),
  Vector2(3072 / RoboticsGame.zoomLevel, 0),
]);

final kBottomBorder = List.from(<Vector2>[
  Vector2(
      -3072 / 2 / RoboticsGame.zoomLevel, 1420 / 2 / RoboticsGame.zoomLevel),
  Vector2.zero(),
  Vector2(3072 / RoboticsGame.zoomLevel, 0),
]);
