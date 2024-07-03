import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:player_move/components/robot/robot_constants.dart';
import 'package:player_move/constants.dart';

class Robot extends BodyComponent {
  Vector2 acceleration = Vector2.zero();
  late PolygonShape shape;
  late FixtureDef fixtureDef;
  late BodyDef robotDef;
  @override
  Body createBody() {
    robotDef = BodyDef(
      position: Vector2(kWorldSize.x / 100, kWorldSize.y / 100),
      type: BodyType.dynamic,
    );
    shape = PolygonShape()..setAsBox(kHalfWidth, kHalfHeight, Vector2(0, 0), 0);
    // RectangleComponent shape2 = RectangleComponent.square(size: 10, anchor: Anchor.center);
    fixtureDef = FixtureDef(shape)
      ..density = kDensity
      ..friction = kFriction
      ..restitution = kRestitution;
    return world.createBody(robotDef)..createFixture(fixtureDef);
  }
}
