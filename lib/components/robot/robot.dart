import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:player_move/components/robot/constants/robot_constants.dart';
import 'package:player_move/constants.dart';
import 'package:player_move/providers/robot/robot_provider.dart';
import 'package:player_move/providers/settings/settings_notifier.dart';

class Robot extends BodyComponent with RiverpodComponentMixin {
  Robot({super.key});

  Vector2 acceleration = Vector2.zero();
  late PolygonShape shape;
  late FixtureDef fixtureDef;
  late BodyDef robotDef;
  ThemeMode themeMode = ThemeMode.system;
  late RobotConstants constants = RobotConstants(
    kDensity: 0,
    kFriction: 0,
    kRestitution: 0,
    kHalfWidth: 0,
    kHalfHeight: 0,
    kMaxTranslationalSpeed: 0,
    kMaxAngularSpeed: 0,
    kTranslationalAccelerationRate: 0,
    kAngularAccelerationRate: 0,
    kTranslationalDeccelerationRate: 0,
    kTranslationalIdleDeccelerationRate: 0,
    kAngularDeccelerationRate: 0,
    kAngularIdleDeccelerationRate: 0,
  );

  @override
  void onMount() {
    addToGameWidgetBuild(() {
      // ref.listen(settingsProvider, (settings, setting) {
      //   setting.settings.isDarkMode
      //       ? themeMode = ThemeMode.dark
      //       : themeMode = ThemeMode.light;
      // });
      constants = ref.watch(robotProviderProvider);
      themeMode = ref.watch(settingsNotifierProvider).themeMode;
      shape = PolygonShape()
        ..setAsBox(
            constants.kHalfWidth, constants.kHalfHeight, Vector2(0, 0), 0);
      // RectangleComponent shape2 = RectangleComponent.square(size: 10, anchor: Anchor.center);
      fixtureDef = FixtureDef(shape)
        ..density = constants.kDensity
        ..friction = constants.kFriction
        ..restitution = constants.kRestitution;
    });

    super.onMount();
  }

  @override
  Body createBody() {
    robotDef = BodyDef(
      position: Vector2(kWorldSize.x / 100, kWorldSize.y / 100),
      type: BodyType.dynamic,
    );
    return world.createBody(robotDef)
      ..createFixture(FixtureDef(PolygonShape()..setAsBoxXY(0.5, 0.5)));
  }

  FutureOr<void> linearMovement(Vector2 value) async {
    body.applyLinearImpulse(value * constants.kTranslationalAccelerationRate);

    if (kDebugMode) {
      print(value.length);
    }
    body.linearVelocity.clampLength(0, constants.kMaxTranslationalSpeed);
    if (body.linearVelocity.length >
        value.length * constants.kTranslationalAccelerationRate) {
      body.linearDamping = constants.kTranslationalDeccelerationRate;
    } else {
      body.linearDamping = constants.kTranslationalIdleDeccelerationRate;
    }
  }

  FutureOr<void> angularMovement(Vector2 value) async {
    body.angularVelocity
        .clamp(-constants.kMaxAngularSpeed, constants.kMaxAngularSpeed);
    body.applyAngularImpulse(value.x * constants.kAngularAccelerationRate);

    if (body.angularVelocity >
        value.x.abs() * constants.kAngularAccelerationRate) {
      body.angularDamping = constants.kAngularDeccelerationRate;
    } else {
      body.angularDamping = constants.kAngularIdleDeccelerationRate;
    }
  }

  @override
  void render(Canvas canvas) {
    try {
      if (super.fixtureDefs!.first != fixtureDef) {
        super.fixtureDefs!.clear();
        super.fixtureDefs!.first = fixtureDef;
        super.paint.color =
            themeMode == ThemeMode.dark ? Colors.white : Colors.black;
        super.render(canvas);
      }
    } catch (e) {}
  }
}
