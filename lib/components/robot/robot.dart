import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/components/game_piece/game_piece.dart';
import 'package:player_move/components/robot/constants/robot_constants.dart';
import 'package:player_move/components/robot/subsystems/drivetrain/drivetrain.dart';
import 'package:player_move/components/robot/subsystems/intake/intake.dart';
import 'package:player_move/components/robot/subsystems/intake/over_bumper/over_bumper.dart';
import 'package:player_move/components/robot/subsystems/intake/over_bumper/over_bumper_sprite.dart';
import 'package:player_move/components/robot/subsystems/intake/under_bumper/under_bumper.dart';
import 'package:player_move/components/robot/subsystems/intake/under_bumper/under_bumper_sprite.dart';
import 'package:player_move/helpers/robot_sprite_manager.dart';
import 'package:player_move/providers/robot/customization/customization.dart';
import 'package:player_move/providers/robot/customization/robot_customization.dart';
import 'package:player_move/providers/robot/robot_provider.dart';
import 'package:player_move/providers/settings/settings_notifier.dart';

class Robot extends BodyComponent
    with RiverpodComponentMixin, ContactCallbacks {
  late BodyDef robotDef;
  Sprite? sprite;
  RobotSpriteManager? spriteManager;
  Drivetrain? drivetrain;
  Intake? intake;
  SpriteComponent? intakeSprite;

  ComponentRef ref;
  List<Fixture> fixturesToDelete = [];

  Vector2 acceleration = Vector2.zero();
  late PolygonShape shape;
  FixtureDef? fixtureDef;

  ThemeMode themeMode = ThemeMode.system;
  late RobotConstants constants;
  Robot({super.key, required this.ref}) {
    super.rebuildOnMountWhen(ref);
  }
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    if (kDebugMode) {
      renderBody = false;
    } else {
      renderBody = false;
    }
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (other.runtimeType == GamePiece) {
      if (ref.read(settingsNotifierProvider).haptics) {
        HapticFeedback.selectionClick();
      }
      if (kDebugMode) {
        // print(contact.bodyA.angle );
        // print();
      }

      if ((contact.bodyA.localPoint(contact.bodyB.position).screenAngle() *
                  radians2Degrees)
              .abs() <
          12) {
        fixturesToDelete.addAll(contact.bodyB.fixtures);
      }
    }
    super.beginContact(other, contact);
  }

  @override
  FutureOr<void> onMount() async {
    addToGameWidgetBuild(() async {
      final value =
          await ref.read(robotCustomizationProvider.selectAsync((p) => p));
      drivetrain = value.drivetrain;
      intake = value.intake;
      if (kDebugMode) {
        print(
            "Direvetrain ${drivetrain?.toJson()} \n ${drivetrain?.motors.toJson()}");
      }
      if (kDebugMode) {
        print(drivetrain.runtimeType);
      }
      drivetrain?.updateRobotConstants(ref);
      constants = ref.watch(robotProviderProvider);
      spriteManager = RobotSpriteManager(drivetrain: drivetrain!);
      await intializeSprite();
      if (spriteManager != null && !super.children.contains(spriteManager)) {
        spriteManager!.scale = Vector2(
            ref.read(robotProviderProvider).kHalfWidth * 2.25,
            ref.read(robotProviderProvider).kHalfHeight * 2.25);
        await add(spriteManager!);
      }
    });

    super.onMount();
  }

  @override
  FutureOr<void> add(Component component) async {
    if (!children.contains(component)) {
      return super.add(component);
    }
  }

  FutureOr<void> intializeSprite() async {
    switch (intake.runtimeType) {
      case UnderBumperIntake:
        intakeSprite = UnderBumperSprite(ref: ref);
        break;
      case OverBumperIntake:
        intakeSprite = OverBumperSprite(ref: ref);
        break;
      default:
        throw (Exception(
            "Intake not recognized ${intake.runtimeType.toString()}"));
    }
    add(
      intakeSprite!,
    );
  }

  @override
  Body createBody() {
    robotDef = BodyDef(
      // position: Vector2(kWorldSize.x / 100, kWorldSize.y / 100),
      type: BodyType.dynamic,
      bullet: true,
      userData: this,
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
