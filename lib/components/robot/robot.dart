import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/components/robot/constants/robot_constants.dart';
import 'package:player_move/components/robot/drivetrain/drivetrain.dart';
import 'package:player_move/constants.dart';
import 'package:player_move/providers/robot/customization/customization.dart';
import 'package:player_move/providers/robot/customization/robot_customization.dart';
import 'package:player_move/providers/robot/robot_provider.dart';
import 'package:player_move/providers/settings/settings_notifier.dart';

class Robot extends BodyComponent
    with RiverpodComponentMixin, CollisionCallbacks {
  @override
  ComponentRef ref;

  Robot({super.key, required this.ref}) {
    super.rebuildOnMountWhen(ref);
    // super.bodyDef = BodyDef(
    //     active: true,
    //     isAwake: true,
    //     position: Vector2(-1000, -1000),
    //     type: BodyType.dynamic);
  }

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    HapticFeedback.lightImpact();
    if (other is ScreenHitbox) {
      super.onCollision(points, other);
    }
  }

  Drivetrain? drivetrain;

  Vector2 acceleration = Vector2.zero();
  late PolygonShape shape;
  FixtureDef? fixtureDef;

  ThemeMode themeMode = ThemeMode.system;
  late RobotConstants constants;
  // @override
  // BodyDef? get bodyDef => robotDef;

  @override
  FutureOr<void> onMount() async {
    addToGameWidgetBuild(() async {
      ref.watch(robotCustomizationProvider).whenData((Customization cb) {
        drivetrain = cb.drivetrain;
      });
      if (kDebugMode) {
        print(
            "Direvetrain ${drivetrain?.toJson()} \n ${drivetrain?.motors.toJson()}");
      }
      // ref.read(robotProviderProvider.notifier).clear();
      constants = ref.watch(robotProviderProvider);
      await drivetrain?.updateRobotConstants(ref);
    });

    super.onMount();
  }

  @override
  Body createBody() {
    BodyDef robotDef = BodyDef(
      // position: Vector2(kWorldSize.x / 100, kWorldSize.y / 100),
      type: BodyType.dynamic,
      bullet: true,
    );
    // ref.listen(settingsProvider, (settings, setting) {
    //   setting.settings.isDarkMode
    //       ? themeMode = ThemeMode.dark
    //       : themeMode = ThemeMode.light;
    // });
    constants = ref.watch(robotProviderProvider);
    themeMode = ref.watch(settingsNotifierProvider).themeMode;
    shape = PolygonShape()
      ..setAsBox(constants.kHalfWidth, constants.kHalfHeight, Vector2(0, 0), 0);
    // RectangleComponent shape2 = RectangleComponent.square(size: 10, anchor: Anchor.center);
    fixtureDef = FixtureDef(shape)
      ..density = constants.kDensity
      ..friction = constants.kFriction
      ..restitution = constants.kRestitution;

    return world.createBody(robotDef)..createFixture(fixtureDef!);
  }

  FutureOr<void> linearMovement(Vector2 value) async {
    if (kDebugMode) {
      // print(drivetrain?.toJson());
    }

    await drivetrain?.firstJoystickMovement(value, body, constants);
  }

  FutureOr<void> angularMovement(Vector2 value) async {
    await drivetrain?.secondJoystickMovement(value, body, constants);
  }

  @override
  void render(Canvas canvas) {
    // constants.kHalfHeight = camera.viewport.size.y;
    // constants.kHalfWidth = camera.viewport.size.y;
    super.paint.color =
        themeMode == ThemeMode.dark ? Colors.white : Colors.black;
    super.render(canvas);
  }
}
