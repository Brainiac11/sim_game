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
              Vector2(140, -42) * kPixelScale,
              Vector2(125, -33) * kPixelScale,
              Vector2(125, -16) * kPixelScale,
              Vector2(140, -7) * kPixelScale,
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
              Vector2(-140, -42) * kPixelScale,
              Vector2(-125, -33) * kPixelScale,
              Vector2(-125, -16) * kPixelScale,
              Vector2(-140, -7) * kPixelScale,
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
              Vector2(43, -15) * kPixelScale,
              Vector2(52, -20) * kPixelScale,
              Vector2(47, -29) * kPixelScale,
              Vector2(38, -24) * kPixelScale,
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
              Vector2(88, 5) * kPixelScale,
              Vector2(88, -5) * kPixelScale,
              Vector2(78, -5) * kPixelScale,
              Vector2(78, 5) * kPixelScale,
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
              Vector2(38, 24) * kPixelScale,
              Vector2(47, 29) * kPixelScale,
              Vector2(52, 20) * kPixelScale,
              Vector2(43, 15) * kPixelScale,
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
              Vector2(-43, -15) * kPixelScale,
              Vector2(-52, -20) * kPixelScale,
              Vector2(-47, -29) * kPixelScale,
              Vector2(-38, -24) * kPixelScale,
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
              Vector2(-88, 5) * kPixelScale,
              Vector2(-88, -5) * kPixelScale,
              Vector2(-78, -5) * kPixelScale,
              Vector2(-78, 5) * kPixelScale,
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
              Vector2(-38, 24) * kPixelScale,
              Vector2(-47, 29) * kPixelScale,
              Vector2(-52, 20) * kPixelScale,
              Vector2(-43, 15) * kPixelScale,
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
              Vector2(140, 51) * kPixelScale,
              Vector2(109, 70) * kPixelScale,
              Vector2(141, 70) * kPixelScale,
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
              Vector2(-140, 51) * kPixelScale,
              Vector2(-109, 70) * kPixelScale,
              Vector2(-140, 70) * kPixelScale,
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
              Vector2(140, -32) * kPixelScale,
              Vector2(150, -32) * kPixelScale,
              Vector2(150, -7) * kPixelScale,
              Vector2(140, -7) * kPixelScale,
            ],
          ),
        ),
      filter: Filter()
        ..categoryBits = CollisionCategoryBits.bit.shootingGamePieceInteractions
        ..maskBits = CollisionMaskBits.bit.shootingGamePieceInteractions,
      isSensor: true,
      key: const Key("Speaker Red Sensor"),
    ),
  ],
);
