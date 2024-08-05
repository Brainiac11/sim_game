import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:player_move/constants.dart';

List<Shape> obstaclesShapesList = List.from(
  [
    PolygonShape()
      ..set(
        List.from(
          [
            Vector2(140, -42) * kPixelScale,
            Vector2(125, -33) * kPixelScale,
            Vector2(125, -16) * kPixelScale,
            Vector2(140, -7) * kPixelScale,
          ],
        ),
      ),
    PolygonShape()
      ..set(
        List.from(
          [
            Vector2(-140, -42) * kPixelScale,
            Vector2(-125, -33) * kPixelScale,
            Vector2(-125, -16) * kPixelScale,
            Vector2(-140, -7) * kPixelScale,
          ],
        ),
      ),
    PolygonShape()
      ..set(
        List.from(
          [
            Vector2(88, 5) * kPixelScale,
            Vector2(88, -5) * kPixelScale,
            Vector2(78, -5) * kPixelScale,
            Vector2(78, 5) * kPixelScale,
          ],
        ),
      ),
    PolygonShape()
      ..set(
        List.from(
          [
            Vector2(43, -15) * kPixelScale,
            Vector2(52, -20) * kPixelScale,
            Vector2(47, -29) * kPixelScale,
            Vector2(38, -24) * kPixelScale,
          ],
        ),
      ),
    PolygonShape()
      ..set(
        List.from(
          [
            Vector2(38, 24) * kPixelScale,
            Vector2(47, 29) * kPixelScale,
            Vector2(52, 20) * kPixelScale,
            Vector2(43, 15) * kPixelScale,
          ],
        ),
      ),
    PolygonShape()
      ..set(
        List.from(
          [
            Vector2(-88, 5) * kPixelScale,
            Vector2(-88, -5) * kPixelScale,
            Vector2(-78, -5) * kPixelScale,
            Vector2(-78, 5) * kPixelScale,
          ],
        ),
      ),
    PolygonShape()
      ..set(
        List.from(
          [
            Vector2(-43, -15) * kPixelScale,
            Vector2(-52, -20) * kPixelScale,
            Vector2(-47, -29) * kPixelScale,
            Vector2(-38, -24) * kPixelScale,
          ],
        ),
      ),
    PolygonShape()
      ..set(
        List.from(
          [
            Vector2(-38, 24) * kPixelScale,
            Vector2(-47, 29) * kPixelScale,
            Vector2(-52, 20) * kPixelScale,
            Vector2(-43, 15) * kPixelScale,
          ],
        ),
      ),
  ],
);
