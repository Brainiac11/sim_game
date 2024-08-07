import 'dart:ui';

import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:player_move/constants.dart';

class Obstacle extends BodyComponent
    with CollisionCategoryFilters, CollisionMaskFilters {
  late FixtureDef fixtureDef;
  late BodyDef obstacleDef;

  Shape obstacleShape;

  int? collisionGroup = 0;

  Obstacle({required this.obstacleShape, this.collisionGroup});

  @override
  Body createBody() {
    obstacleDef = BodyDef(
      type: BodyType.static,
      userData: this,
      allowSleep: false,
    );
    List<Vector2> vertices = (obstacleShape as PolygonShape).vertices;

    for (Vector2 vertex in vertices) {
      if (kDebugMode) {
        print((findGame() as Forge2DGame).worldToScreen(vertex));
      }
    }
    fixtureDef = FixtureDef(
      obstacleShape,
      userData: this,
      friction: 0.5,
      // UPDATE
      filter: Filter()
        ..categoryBits = super.everything
        ..maskBits = super.onlyFerryedGamePiece,
    );

    if (kDebugMode) {
      debugMode = true;
      super.setColor(const Color.fromRGBO(255, 255, 255, 0.2));
    }

    return world.createBody(obstacleDef)..createFixture(fixtureDef);
  }
}
