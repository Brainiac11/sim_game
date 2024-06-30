

import 'dart:math';

import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/rendering.dart';
import 'package:player_move/constants.dart';
import 'package:player_move/game.dart';

class Robot extends BodyComponent {
  final shape = CircleShape()..radius = 10;
  final fixtureDef = FixtureDef();
  @override
  Body createBody(){
    final robotDef = BodyDef(
      position: Vector2(worldSize.x / 2, 0),
      type: BodyType.kinematic,
    );
  }
}