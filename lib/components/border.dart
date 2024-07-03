import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:player_move/constants.dart';

class BorderEdge extends BodyComponent {
  BorderEdge({required this.valueKey});
  ValueKey<String> valueKey;
  late Shape shape;
  late FixtureDef fixtureDef;
  late BodyDef borderDef;

  void keyBasedDecision(ValueKey<String> key) {
    switch (key.value) {
      case "Right":
        borderDef = BodyDef(
          position: Vector2(kWorldSize.y, -kWorldSize.y / 2),
          type: BodyType.static,
        );
        shape = EdgeShape()..set(Vector2.zero(), Vector2(0, kWorldSize.y));
        break;
      case "Left":
        borderDef = BodyDef(
          position: Vector2(-kWorldSize.y, kWorldSize.y / 2),
          type: BodyType.static,
        );
        shape = EdgeShape()..set(Vector2.zero(), Vector2(0, -kWorldSize.y));
        break;
      case "Top":
        borderDef = BodyDef(
          position: Vector2(-kWorldSize.x / 2, -kWorldSize.y / 2),
          type: BodyType.static,
        );
        shape = EdgeShape()..set(Vector2.zero(), Vector2(kWorldSize.x, 0));
        break;
      case "Bottom":
        borderDef = BodyDef(
          position: Vector2(-kWorldSize.x / 2, kWorldSize.y / 2),
          type: BodyType.static,
        );
        shape = EdgeShape()..set(Vector2.zero(), Vector2(kWorldSize.x, 0));
        break;
    }
  }

  @override
  Body createBody() {
    keyBasedDecision(valueKey);
    // borderDef = BodyDef(
    //   position: Vector2(kWorldSize.y, -kWorldSize.y / 2),
    //   type: BodyType.static,
    // );
    // shape = EdgeShape()..set(Vector2.zero(), Vector2(0, kWorldSize.y));
    fixtureDef = FixtureDef(shape);
    return world.createBody(borderDef)..createFixture(fixtureDef);
  }
}
