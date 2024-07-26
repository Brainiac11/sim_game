import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
// import 'package:flutter/material.dart';
import 'package:player_move/components/game_piece/game_piece_config.dart';
import 'package:player_move/constants.dart';

class GamePiece extends BodyComponent with RiverpodComponentMixin {
  final Vector2 size = gamePieceSize;
  late Shape shape;
  late FixtureDef fixtureDef;

  late final Sprite sprite;
  @override
  Vector2 position;

  GamePiece({
    required this.position,
  });
  @override
  Future<void> onMount() {
    super.onMount();
    addToGameWidgetBuild(() {});
    return super.onLoad();
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
// Image image = Image.asset("game_piece.png");
    await Sprite.load("game_piece.png").then((value) {
      sprite = value;
    });
    renderBody = false;
    await add(
      SpriteComponent(
        sprite: sprite,
        size: size,
        anchor: Anchor.center,
      ),
    );
  }

  @override
  Body createBody() {
    BodyDef robotDef = BodyDef(
      position: position,
      type: BodyType.dynamic,
    );
    shape = CircleShape()..radius = 10;
    fixtureDef = FixtureDef(shape)
      ..density = 0.5
      ..friction = 1.0
      ..restitution = 0;

    return world.createBody(robotDef)..createFixture(fixtureDef);
  }
}
