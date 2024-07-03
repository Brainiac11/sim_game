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
        return Vector2(0, kWorldSize.y);
      case PositionEdge.bottom:
        return Vector2(kWorldSize.x, kWorldSize.y);
      case PositionEdge.left:
        return Vector2(kWorldSize.y, kWorldSize.y);
      case PositionEdge.right:
        return Vector2(0, kWorldSize.x);
    }
  }

  @override
  Body createBody() {
    borderDef = BodyDef(
      position: Vector2(kWorldSize.y, -kWorldSize.x / 4),
      type: BodyType.static,
    );
    shape = EdgeShape()..set(Vector2.zero(), Vector2(0, kWorldSize.y));
    fixtureDef = FixtureDef(shape);
    return world.createBody(borderDef)..createFixture(fixtureDef);
  }
}
