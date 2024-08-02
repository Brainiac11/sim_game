import 'package:flame_forge2d/flame_forge2d.dart';

class Obstacle extends BodyComponent {
  late FixtureDef fixtureDef;
  late BodyDef obstacleDef;

  Vector2 position;
  Shape obstacleShape;

  Obstacle({required this.position, required this.obstacleShape});

  @override
  Body createBody() {
    obstacleDef = BodyDef(
      type: BodyType.static,
      userData: this,
      position: position,
      allowSleep: false,
    );
    fixtureDef = FixtureDef(
      obstacleShape,
      userData: this,
      friction: 0.5,
      filter: Filter()..groupIndex = 1,
    );

    return world.createBody(obstacleDef)..createFixture(fixtureDef);
  }
}
