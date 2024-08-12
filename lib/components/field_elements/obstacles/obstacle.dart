import 'dart:ui';

import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:player_move/components/field_elements/obstacles/obstacle_config.dart';
import 'package:player_move/components/game_piece/game_piece.dart';

class Obstacle extends BodyComponent with ContactCallbacks {
  late FixtureDef fixtureDef;
  late BodyDef obstacleDef;
  late bool isSensor;

  ObstacleModel obstacleConfig;
  List<Fixture> fixturesToDelete = [];

  Obstacle({required this.obstacleConfig});

  @override
  void update(double dt) {
    for (Fixture fixture in fixturesToDelete) {
      fixture.body.destroyFixture(fixture);
    }
    fixturesToDelete.clear();

    super.update(dt);
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (isSensor && other.runtimeType == GamePiece) {
      if (kDebugMode) {
        print("Destroying a gamepiece");
      }
      fixturesToDelete.addAll(contact.bodyB.fixtures);
      (other as GamePiece).removeAll((other).children);
    }
    super.beginContact(other, contact);
  }

  @override
  Body createBody() {
    obstacleDef = BodyDef(
      type: BodyType.static,
      userData: this,
      allowSleep: false,
    );
    List<Vector2> vertices = (obstacleConfig.shape as PolygonShape).vertices;

    for (Vector2 vertex in vertices) {
      if (kDebugMode) {
        print((findGame() as Forge2DGame).worldToScreen(vertex));
      }
    }
    isSensor = obstacleConfig.isSensor;
    fixtureDef = FixtureDef(
      obstacleConfig.shape,
      userData: this,
      friction: 0.5,
      // isSensor: obstacleConfig.isSensor,
      filter: obstacleConfig.filter,
    );

    if (kDebugMode) {
      debugMode = true;
      isSensor ?  super.setColor(const Color.fromRGBO(100, 100, 100, 0.2)) : super.setColor(const Color.fromRGBO(255, 255, 255, 0.2));
    }

    return world.createBody(obstacleDef)..createFixture(fixtureDef);
  }
}
