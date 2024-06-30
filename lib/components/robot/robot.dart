


import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:player_move/constants.dart';


class Robot extends BodyComponent {
  
 
  @override
  Body createBody(){
    final robotDef = BodyDef(
      position: Vector2(worldSize.x / 2, 1),
      type: BodyType.kinematic,
    );
    PolygonShape shape = PolygonShape()..setAsBox(5, 5, Vector2(10,10), degrees2Radians * 100);
    // RectangleComponent shape2 = RectangleComponent.square(size: 10, anchor: Anchor.center);
    final fixtureDef = FixtureDef(shape);
    return world.createBody(robotDef)..createFixture(fixtureDef);
  }
}