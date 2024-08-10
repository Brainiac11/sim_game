import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:player_move/components/game.dart';
// import 'package:flutter/material.dart';
import 'package:player_move/components/game_piece/game_piece_config.dart';
import 'package:player_move/components/game_piece/game_piece_enum.dart';
import 'package:player_move/components/robot/constants/robot_constants.dart';
import 'package:player_move/constants.dart';
import 'package:player_move/providers/robot/robot_provider.dart';

class GamePiece extends BodyComponent {
  final Vector2 size = gamePieceSize;
  late Shape shape;
  late FixtureDef fixtureDef;
  late BodyDef gamePieceDef;
  late final Sprite sprite;
  late Fixture fixture;
  GamePieceEnum gamePieceState;
  late Filter collisionFilter;
  SpriteComponent? spriteComponent;
  @override
  Vector2 position;

  GamePiece({
    required this.position,
    required this.gamePieceState,
  });
  @override
  void update(double dt) {
    if (body.linearVelocity.length <= 0.5 &&
        (gamePieceState == GamePieceEnum.shot ||
            gamePieceState == GamePieceEnum.ferryed)) {
      gamePieceState = GamePieceEnum.normal;

      setCollisionFilter();

      stateChanger();
      fixture.filterData = collisionFilter;
    }
    super.update(dt);
  }

  @override
  FutureOr<void> onMount() {
    stateChanger();

    super.onMount();
  }

  FutureOr<void> stateChanger() async {
    switch (gamePieceState) {
      case GamePieceEnum.normal:
        body.angularDamping = GamePieceDampening;
        body.linearDamping = GamePieceDampening;
        break;

      case GamePieceEnum.shot:
        body.angularDamping = GamePieceDampening / 10;
        body.linearDamping = GamePieceDampening / 10;
        break;
      case GamePieceEnum.ferryed:
        body.angularDamping = 0;
        body.linearDamping = 0;
        break;
      default:
        throw (Exception("Error: GamePieceState not recognized"));
    }
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
      // scale:
      //     Vector2(0.5 / RoboticsGame.zoomLevel, 0.5 / RoboticsGame.zoomLevel),
      size: Vector2(1, 1),
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
    setCollisionFilter();
    shape = CircleShape()..radius = 0.4;
    fixtureDef = FixtureDef(shape)
      ..density = 0.5
      ..friction = 1.0
      ..restitution = .1
      ..filter = collisionFilter;

    Body gamePieceBody = world.createBody(gamePieceDef);
    fixture = gamePieceBody.createFixture(fixtureDef);
    return gamePieceBody;
  }

  void setCollisionFilter() {
    switch (gamePieceState) {
      case GamePieceEnum.normal:
        collisionFilter = Filter()
          ..categoryBits = CollisionCategoryBits.bit.general
          ..maskBits = CollisionMaskBits.bit.general;
        break;
      case GamePieceEnum.shot:
        collisionFilter = Filter()
          ..categoryBits =
              CollisionCategoryBits.bit.shootingGamePieceInteractions
          ..maskBits = CollisionMaskBits.bit.shootingGamePieceInteractions;
        break;
      case GamePieceEnum.ferryed:
        collisionFilter = Filter()
          ..categoryBits =
              CollisionCategoryBits.bit.ferryingGamePieceInteractions
          ..maskBits = CollisionMaskBits.bit.ferryingGamePieceInteractions;
        break;
      default:
        throw (Exception("Error: GamePieceState is not recognized"));
    }
  }
}
