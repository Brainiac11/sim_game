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
  Robot({super.key}) {
    super.bodyDef =
        BodyDef(active: false, isAwake: false, position: Vector2(-100, -100));
  }

  Vector2 acceleration = Vector2.zero();
  late PolygonShape shape;
  FixtureDef? fixtureDef;
  BodyDef robotDef = BodyDef(
    position: Vector2(kWorldSize.x / 100, kWorldSize.y / 100),
    type: BodyType.dynamic,
  );
  ThemeMode themeMode = ThemeMode.system;
  late RobotConstants constants;

  @override
  void onMount() {
    addToGameWidgetBuild(() async {
      // ref.listen(settingsProvider, (settings, setting) {
      //   setting.settings.isDarkMode
      //       ? themeMode = ThemeMode.dark
      //       : themeMode = ThemeMode.light;
      // });
      constants = await ref.watch(robotProviderProvider);
      themeMode = ref.watch(settingsNotifierProvider).themeMode;
      shape = PolygonShape()
        ..setAsBox(
            constants.kHalfWidth, constants.kHalfHeight, Vector2(0, 0), 0);
      // RectangleComponent shape2 = RectangleComponent.square(size: 10, anchor: Anchor.center);
      fixtureDef = FixtureDef(shape)
        ..density = constants.kDensity
        ..friction = constants.kFriction
        ..restitution = constants.kRestitution;
      super.bodyDef = robotDef;
      super.body = world.createBody(robotDef)..createFixture(fixtureDef!);
    });
    super.onMount();
  }

  void linearMovement(Vector2 value) {
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

  void angularMovement(Vector2 value) {
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
    super.paint.color =
        themeMode == ThemeMode.dark ? Colors.white : Colors.black;
    super.render(canvas);
  }
}
