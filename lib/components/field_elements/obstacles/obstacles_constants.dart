import 'package:flame_forge2d/flame_forge2d.dart';

List<Shape> obstaclesShapesList = List.from(
  [
    PolygonShape()
      ..set(
        List.from(
          [
            Vector2(10, 10),
            Vector2(20, 10),
            Vector2(30, 30),
          ],
        ),
      ),
  ],
);
