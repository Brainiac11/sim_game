import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/foundation.dart';
import 'package:player_move/constants.dart';

class Robot extends BodyComponent {
  Vector2 acceleration = Vector2.zero();
  late PolygonShape shape;
  late FixtureDef fixtureDef;
  late BodyDef robotDef;
  @override
  Body createBody() {
    robotDef = BodyDef(
      position: Vector2(worldSize.x / 100, worldSize.y / 100),
      type: BodyType.dynamic,
    );
    shape = PolygonShape()..setAsBox(3, 3, Vector2(0, 0), 0);
    // RectangleComponent shape2 = RectangleComponent.square(size: 10, anchor: Anchor.center);
    fixtureDef = FixtureDef(shape)
      ..density = 1.5
      ..friction = 1
      ..restitution = 0;
    return world.createBody(robotDef)..createFixture(fixtureDef);
  }
}
