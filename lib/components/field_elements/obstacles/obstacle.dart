import 'dart:ui';

import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:player_move/components/field_elements/obstacles/obstacle_config.dart';
import 'package:player_move/constants.dart';

class Obstacle extends BodyComponent with ContactCallbacks {
  late FixtureDef fixtureDef;
  late BodyDef obstacleDef;

  ObstacleConfig obstacleConfig;

  Obstacle({required this.obstacleConfig});

  @override
  void beginContact(Object other, Contact contact) {
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
    fixtureDef = FixtureDef(
      obstacleConfig.shape,
      userData: this,
      friction: 0.5,
      isSensor: obstacleConfig.isSensor,
      filter: obstacleConfig.filter,
    );

    if (kDebugMode) {
      debugMode = true;
      super.setColor(const Color.fromRGBO(255, 255, 255, 0.2));
    }

    return world.createBody(obstacleDef)..createFixture(fixtureDef);
  }
}
