import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
import 'package:player_move/components/game_piece/game_piece_config.dart';
import 'package:player_move/constants.dart';

class GamePiece extends BodyComponent {
  final Vector2 size = gamePieceSize;
  late Shape shape;
  late FixtureDef fixtureDef;
  late BodyDef gamePieceDef;
  late final Sprite sprite;

  SpriteComponent? spriteComponent;
  @override
  Vector2 position;

  GamePiece({
    required this.position,
  });
  @override
  FutureOr<void> onMount() {
    body.angularDamping = GamePieceDampening;
    body.linearDamping = GamePieceDampening;
    super.onMount();
  }

  // @override
  // void update(double dt) {
  //   super.update(dt);
  // }

  @override
  Future<void> onLoad() async {
// Image image = Image.asset("game_piece.png");
    sprite = await Sprite.load("game_piece.png");
    if (kDebugMode) {
      renderBody = false;
    } else {
      renderBody = false;
    }
    spriteComponent = SpriteComponent(
      sprite: sprite,
      scale: Vector2(kWorldSize.length / 14500, kWorldSize.length / 14500),
      anchor: Anchor.center,
    );
    await add(spriteComponent!);
    await super.onLoad();
  }

  @override
  Body createBody() {
    gamePieceDef = BodyDef(
      position: position,
      type: BodyType.dynamic,
      angularDamping: GamePieceDampening,
      linearDamping: GamePieceDampening,
      bullet: true,
      userData: this,
    );
    shape = CircleShape()..radius = .9;
    fixtureDef = FixtureDef(shape)
      ..density = 0.5
      ..friction = 1.0
      ..restitution = .1;

    return world.createBody(gamePieceDef)..createFixture(fixtureDef);
  }
}
