import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:player_move/constants.dart';

List<Shape> obstaclesShapesList = List.from(
  [
    PolygonShape()
      ..set(
        List.from(
          [
            Vector2(40, -10),
            Vector2(35, -7),
            Vector2(30, -5),
            Vector2(40, 0),
          ],
        ),
      ),
  ],
);