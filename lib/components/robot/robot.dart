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
      position: Vector2(worldSize.x / 2, 0),
      type: BodyType.dynamic,
    );
    shape = PolygonShape()..setAsBox(5, 5, Vector2(10, 10), 0);
    // RectangleComponent shape2 = RectangleComponent.square(size: 10, anchor: Anchor.center);
    fixtureDef = FixtureDef(shape)
      ..density = 15
      ..friction = .4
      ..restitution = 0.1;
    return world.createBody(robotDef)..createFixture(fixtureDef);
  }

  void changeAngle(double screenAngle) {
    robotDef.angle = screenAngle;
    if (kDebugMode) {
      print(robotDef.angle * radians2Degrees);
    }
  }
}
