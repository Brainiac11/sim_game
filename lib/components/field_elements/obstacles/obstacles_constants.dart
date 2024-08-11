import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:player_move/components/field_elements/obstacles/obstacle_config.dart';
import 'package:player_move/constants.dart';

List<ObstacleConfig> obstaclesShapesList = List.from(
  [
    ObstacleConfig(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(140, -42) * 1,
              Vector2(125, -33) * 1,
              Vector2(125, -16) * 1,
              Vector2(140, -7) * 1,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.general
        ..maskBits = CollisionMaskBits.bit.general,
      isSensor: false,
      key: const Key("Speaker Red"),
    ),
    ObstacleConfig(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(-140, -42) * 1,
              Vector2(-125, -33) * 1,
              Vector2(-125, -16) * 1,
              Vector2(-140, -7) * 1,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.general
        ..maskBits = CollisionMaskBits.bit.general,
      isSensor: false,
      key: const Key("Speaker Blue"),
    ),
    ObstacleConfig(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(43, -15) * 1,
              Vector2(52, -20) * 1,
              Vector2(47, -29) * 1,
              Vector2(38, -24) * 1,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.general
        ..maskBits = CollisionMaskBits.bit.general,
      isSensor: false,
      key: const Key("Pillar Red Top"),
    ),
    ObstacleConfig(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(88, 5) * 1,
              Vector2(88, -5) * 1,
              Vector2(78, -5) * 1,
              Vector2(78, 5) * 1,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.general
        ..maskBits = CollisionMaskBits.bit.general,
      isSensor: false,
      key: const Key("Pillar Red Middle"),
    ),
    ObstacleConfig(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(38, 24) * 1,
              Vector2(47, 29) * 1,
              Vector2(52, 20) * 1,
              Vector2(43, 15) * 1,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.general
        ..maskBits = CollisionMaskBits.bit.general,
      isSensor: false,
      key: const Key("Pillar Red Bottom"),
    ),
    ObstacleConfig(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(-43, -15) * 1,
              Vector2(-52, -20) * 1,
              Vector2(-47, -29) * 1,
              Vector2(-38, -24) * 1,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.general
        ..maskBits = CollisionMaskBits.bit.general,
      isSensor: false,
      key: const Key("Pillar Blue Top"),
    ),
    ObstacleConfig(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(-88, 5) * 1,
              Vector2(-88, -5) * 1,
              Vector2(-78, -5) * 1,
              Vector2(-78, 5) * 1,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.general
        ..maskBits = CollisionMaskBits.bit.general,
      isSensor: false,
      key: const Key("Pillar Blue Middle"),
    ),
    ObstacleConfig(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(-38, 24) * 1,
              Vector2(-47, 29) * 1,
              Vector2(-52, 20) * 1,
              Vector2(-43, 15) * 1,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.general
        ..maskBits = CollisionMaskBits.bit.general,
      isSensor: false,
      key: const Key("Pillar Blue Bottom"),
    ),
    ObstacleConfig(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(140, 51) * 1,
              Vector2(109, 70) * 1,
              Vector2(141, 70) * 1,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.general
        ..maskBits = CollisionMaskBits.bit.general,
      isSensor: false,
      key: const Key("Source Red"),
    ),
    ObstacleConfig(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(-140, 51) * 1,
              Vector2(-109, 70) * 1,
              Vector2(-140, 70) * 1,
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

    ObstacleConfig(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(132, -35) * 1,
              Vector2(150, -35) * 1,
              Vector2(150, -14) * 1,
              Vector2(132, -14) * 1,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.shootingGamePieceInteractions
        ..maskBits = CollisionMaskBits.bit.shootingGamePieceInteractions,
      isSensor: true,
      key: const Key("Speaker Red Sensor"),
    ),
    ObstacleConfig(
      shape: PolygonShape()
        ..set(
          List.from(
            [
              Vector2(-132, -35) * 1,
              Vector2(-150, -35) * 1,
              Vector2(-150, -14) * 1,
              Vector2(-132, -14) * 1,
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
