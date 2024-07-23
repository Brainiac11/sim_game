import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:player_move/components/robot/constants/robot_constants.dart';
import 'package:player_move/components/robot/drivetrain/drivetrain.dart';
import 'package:player_move/constants.dart';
import 'package:player_move/providers/robot/customization/robot_customization.dart';
import 'package:player_move/providers/robot/robot_provider.dart';
import 'package:player_move/providers/settings/settings_notifier.dart';

class Robot extends BodyComponent with RiverpodComponentMixin {
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

  late Drivetrain drivetrain;

  Vector2 acceleration = Vector2.zero();
  late PolygonShape shape;
  FixtureDef? fixtureDef;

  ThemeMode themeMode = ThemeMode.system;
  late RobotConstants constants;
  // @override
  // BodyDef? get bodyDef => robotDef;

  @override
  void onMount() {
    addToGameWidgetBuild(() {});
    super.onMount();
  }

  @override
  Body createBody() {
    BodyDef robotDef = BodyDef(
      position: Vector2(kWorldSize.x / 100, kWorldSize.y / 100),
      type: BodyType.dynamic,
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
    drivetrain = ref.watch(robotCustomizationProvider).drivetrain;
    if (kDebugMode) {
      print("Direvetrain ${drivetrain.toJson()}");
    }
    drivetrain.updateRobotConstants(ref);
    return world.createBody(robotDef)..createFixture(fixtureDef!);
  }

  void linearMovement(Vector2 value) {
    drivetrain.firstJoystickMovement(value, body, constants);
  }

  void angularMovement(Vector2 value) {
    drivetrain.secondJoystickMovement(value, body, constants);
  }

  @override
  void render(Canvas canvas) {
    super.paint.color =
        themeMode == ThemeMode.dark ? Colors.white : Colors.black;
    super.render(canvas);
  }
}
