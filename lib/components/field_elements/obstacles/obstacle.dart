import 'package:flame_forge2d/flame_forge2d.dart';

class Obstacle extends BodyComponent {
  late FixtureDef fixtureDef;
  late BodyDef obstacleDef;

  Shape obstacleShape;

  Obstacle({required this.obstacleShape});

  @override
  Body createBody() {
    obstacleDef = BodyDef(
      type: BodyType.static,
      userData: this,
      allowSleep: false,
    );
    fixtureDef = FixtureDef(
      obstacleShape,
      userData: this,
      friction: 0.5,
      // filter: Filter()..groupIndex = 1,
    );

    return world.createBody(obstacleDef)..createFixture(fixtureDef);
  }
}
