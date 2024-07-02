import 'package:flame/geometry.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:player_move/constants.dart';
import 'package:player_move/helpers/position.dart';

class BorderEdge extends BodyComponent {
  late Shape shape;
  late FixtureDef fixtureDef;
  late BodyDef borderDef;
  PositionEdge positionEdge = PositionEdge.bottom;

  Vector2 positionFromEnum(PositionEdge position) {
    switch (position) {
      case PositionEdge.top:
        return Vector2(0, worldSize.y);
      case PositionEdge.bottom:
        return Vector2(worldSize.x, worldSize.y);
      case PositionEdge.left:
        return Vector2(worldSize.y, worldSize.y);
      case PositionEdge.right:
        return Vector2(0, worldSize.x);
    }
  }

  @override
  Body createBody() {
    borderDef = BodyDef(
      position: Vector2(0, 0),
      type: BodyType.static,
    );
    shape = EdgeShape()..set(Vector2.zero(), Vector2(worldSize.x, 0));
    fixtureDef = FixtureDef(shape);
    return world.createBody(borderDef)..createFixture(fixtureDef);
  }
}
