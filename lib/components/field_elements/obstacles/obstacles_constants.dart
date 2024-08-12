import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:player_move/components/field_elements/obstacles/obstacle_config.dart';
import 'package:player_move/constants.dart';

List<ObstacleModel> obstaclesShapesList = List.from(
  [
    ObstacleModel(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(140, -42) / 8,
              Vector2(125, -33) / 8,
              Vector2(125, -16) / 8,
              Vector2(140, -7) / 8,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.general
        ..maskBits = CollisionMaskBits.bit.general,
      isSensor: false,
      key: const Key("Speaker Red"),
    ),
    ObstacleModel(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(-140, -42) / 8,
              Vector2(-125, -33) / 8,
              Vector2(-125, -16) / 8,
              Vector2(-140, -7) / 8,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.general
        ..maskBits = CollisionMaskBits.bit.general,
      isSensor: false,
      key: const Key("Speaker Blue"),
    ),
    ObstacleModel(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(43, -15) / 8,
              Vector2(52, -20) / 8,
              Vector2(47, -29) / 8,
              Vector2(38, -24) / 8,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.general
        ..maskBits = CollisionMaskBits.bit.general,
      isSensor: false,
      key: const Key("Pillar Red Top"),
    ),
    ObstacleModel(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(88, 5) / 8,
              Vector2(88, -5) / 8,
              Vector2(78, -5) / 8,
              Vector2(78, 5) / 8,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.general
        ..maskBits = CollisionMaskBits.bit.general,
      isSensor: false,
      key: const Key("Pillar Red Middle"),
    ),
    ObstacleModel(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(38, 24) / 8,
              Vector2(47, 29) / 8,
              Vector2(52, 20) / 8,
              Vector2(43, 15) / 8,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.general
        ..maskBits = CollisionMaskBits.bit.general,
      isSensor: false,
      key: const Key("Pillar Red Bottom"),
    ),
    ObstacleModel(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(-43, -15) / 8,
              Vector2(-52, -20) / 8,
              Vector2(-47, -29) / 8,
              Vector2(-38, -24) / 8,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.general
        ..maskBits = CollisionMaskBits.bit.general,
      isSensor: false,
      key: const Key("Pillar Blue Top"),
    ),
    ObstacleModel(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(-88, 5) / 8,
              Vector2(-88, -5) / 8,
              Vector2(-78, -5) / 8,
              Vector2(-78, 5) / 8,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.general
        ..maskBits = CollisionMaskBits.bit.general,
      isSensor: false,
      key: const Key("Pillar Blue Middle"),
    ),
    ObstacleModel(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(-38, 24) / 8,
              Vector2(-47, 29) / 8,
              Vector2(-52, 20) / 8,
              Vector2(-43, 15) / 8,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.general
        ..maskBits = CollisionMaskBits.bit.general,
      isSensor: false,
      key: const Key("Pillar Blue Bottom"),
    ),
    ObstacleModel(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(140, 51) / 8,
              Vector2(109, 70) / 8,
              Vector2(141, 70) / 8,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.general
        ..maskBits = CollisionMaskBits.bit.general,
      isSensor: false,
      key: const Key("Source Red"),
    ),
    ObstacleModel(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(-140, 51) / 8,
              Vector2(-109, 70) / 8,
              Vector2(-140, 70) / 8,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.general
        ..maskBits = CollisionMaskBits.bit.general,
      isSensor: false,
      key: const Key("Source Blue"),
    ),

    // Sensors

    ObstacleModel(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(140, -30) / 8,
              Vector2(150, -30) / 8,
              Vector2(150, -19) / 8,
              Vector2(140, -19) / 8,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.shootingGamePieceInteractions
        ..maskBits = CollisionMaskBits.bit.shootingGamePieceInteractions,
      isSensor: true,
      key: const Key("Speaker Red Sensor"),
    ),
    ObstacleModel(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(-132, -35) / 8,
              Vector2(-150, -35) / 8,
              Vector2(-150, -14) / 8,
              Vector2(-132, -14) / 8,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.shootingGamePieceInteractions
        ..maskBits = CollisionMaskBits.bit.shootingGamePieceInteractions,
      isSensor: true,
      key: const Key("Speaker Blue Sensor"),
    ),
  ],
);
