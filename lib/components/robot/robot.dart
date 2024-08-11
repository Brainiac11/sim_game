import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:player_move/components/border/border.dart';
import 'package:player_move/components/field_elements/obstacles/obstacle.dart';
import 'package:player_move/components/game_piece/game_piece.dart';
import 'package:player_move/components/game_piece/game_piece_config.dart';
import 'package:player_move/components/game_piece/game_piece_enum.dart';
import 'package:player_move/components/robot/constants/robot_constants.dart';
import 'package:player_move/components/robot/states/robot_states.dart';
import 'package:player_move/components/robot/subsystems/drivetrain/drivetrain.dart';
import 'package:player_move/components/robot/subsystems/intake/intake.dart';
import 'package:player_move/components/robot/subsystems/intake/over_bumper/over_bumper.dart';
import 'package:player_move/components/robot/subsystems/intake/over_bumper/over_bumper_sprite.dart';
import 'package:player_move/components/robot/subsystems/intake/under_bumper/under_bumper.dart';
import 'package:player_move/components/robot/subsystems/intake/under_bumper/under_bumper_sprite.dart';
import 'package:player_move/constants.dart';
import 'package:player_move/custom_widgets/gradient/gradient_enum.dart';
import 'package:player_move/custom_widgets/gradient/gradient_widget.dart';
import 'package:player_move/helpers/robot_sprite_manager.dart';
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

  RobotStates state = RobotStates.normal;

  @override
  ComponentRef ref;
  List<Fixture> fixturesToDelete = [];
  GamePiece? gamePiece;
  Vector2 acceleration = Vector2.zero();
  late PolygonShape shape;
  FixtureDef? fixtureDef;

  ThemeMode themeMode = ThemeMode.system;
  late RobotConstants constants;
  Robot({super.key, required this.ref}) {
    super.rebuildOnMountWhen(ref);
  }

  @override
  void update(double dt) {
    for (Fixture fixture in fixturesToDelete) {
      fixture.body.destroyFixture(fixture);
    }

    if (gamePiece != null) {
      if (gamePiece!.spriteComponent != null && state == RobotStates.intaking) {
        add(gamePiece!.spriteComponent!);
        state = RobotStates.hasGamePiece;
        GradientHud.gradientEnum = GradientEnum.hasGamePiece;
      }
    }
    fixturesToDelete.clear();

    super.update(dt);
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

      if ((contact.bodyA.localPoint(contact.bodyB.position).screenAngle() *
                      radians2Degrees)
                  .abs() <
              14 &&
          state == RobotStates.intaking) {
        fixturesToDelete.addAll(contact.bodyB.fixtures);
        gamePiece = contact.bodyB.userData as GamePiece;
        if (ref.read(settingsNotifierProvider).haptics) {
          HapticFeedback.heavyImpact();
        }
      }
    } else if (other.runtimeType == Robot) {
      if (ref.read(settingsNotifierProvider).haptics) {
        HapticFeedback.mediumImpact();
      }
    } else if (other.runtimeType == BorderEdge ||
        other.runtimeType == Obstacle) {
      if (ref.read(settingsNotifierProvider).haptics) {
        HapticFeedback.lightImpact();
      }
    }
    super.beginContact(other, contact);
  }

  void intakeGamePiece() {
    if (!children.contains(gamePiece?.spriteComponent) &&
        state != RobotStates.intaking) {
      state = RobotStates.intaking;
      GradientHud.gradientEnum = GradientEnum.intaking;
    } else if (state == RobotStates.intaking) {
      state = RobotStates.normal;
      GradientHud.gradientEnum = GradientEnum.alliance;
    }
    if (kDebugMode) {
      print(state);
    }
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
      // constants = ref.watch(robotProviderProvider);
      // constants = ref.watch(robotProviderProvider)
      //   ..kHalfHeight = (super.findGame() as Forge2DGame).size.x / 440
      //   ..kHalfWidth = (super.findGame() as Forge2DGame).size.x / 440;

      // constants.kMultiplier = body.mass / kRobotMass.mass;
      // constants.kMultiplier = (body.mass / kRobotMass.mass) * kPixelScale;
      // constants.kMultiplier = kPixelScale;
      spriteManager = RobotSpriteManager(drivetrain: drivetrain!);

      await intializeSprite();
      if (spriteManager != null && !super.children.contains(spriteManager)) {
        spriteManager!.size = Vector2(
            ref.read(robotProviderProvider).kHalfWidth * 2,
            ref.read(robotProviderProvider).kHalfHeight * 2);
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
      case const (UnderBumperIntake):
        intakeSprite = UnderBumperSprite(ref: ref);
        break;
      case const (OverBumperIntake):
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
      // bullet: true,
      userData: this,
      allowSleep: false,
    );
    // ref.listen(settingsProvider, (settings, setting) {
    //   setting.settings.isDarkMode
    //       ? themeMode = ThemeMode.dark
    //       : themeMode = ThemeMode.light;
    // });
    constants = ref.watch(robotProviderProvider)
      ..kHalfHeight = 1
      ..kHalfWidth = 1
      ..kDensity = kRobotMass.mass;
    themeMode = ref.watch(settingsNotifierProvider).themeMode;
    shape = PolygonShape()
      ..setAsBox(constants.kHalfWidth, constants.kHalfHeight, Vector2(0, 0), 0);
    fixtureDef = FixtureDef(shape)
      ..density = (kRobotMass.mass /
          constants.kHalfHeight *
          2 *
          constants.kHalfWidth *
          2)
      ..friction = constants.kFriction
      ..restitution = constants.kRestitution
      ..filter = (Filter()
        ..categoryBits = CollisionCategoryBits.bit.general
        ..maskBits = CollisionMaskBits.bit.general);

    return world.createBody(robotDef)..createFixture(fixtureDef!);
  }

  FutureOr<void> linearMovement(Vector2 value) async {
    await drivetrain?.firstJoystickMovement(value, body, constants);
  }

  FutureOr<void> angularMovement(Vector2 value) async {
    await drivetrain?.secondJoystickMovement(value, body, constants);
  }

  @override
  void render(Canvas canvas) {
    super.paint.color =
        themeMode == ThemeMode.dark ? Colors.white : Colors.black;
    super.render(canvas);
  }

  void shootGamePiece() async {
    if (gamePiece?.spriteComponent != null &&
        children.contains(gamePiece!.spriteComponent)) {
      super.remove(gamePiece!.spriteComponent!);
      gamePiece =
          GamePiece(position: position, gamePieceState: GamePieceEnum.shot);
      GradientHud.gradientEnum = GradientEnum.targeting;
      state = RobotStates.shooting;
      await world.add(gamePiece!);
      HapticFeedback.vibrate();
      gamePiece!.body
          .applyLinearImpulse((Vector2(0, 500)..rotate(super.angle)));
      state = RobotStates.normal;
      gamePiece = null;
      GradientHud.gradientEnum = GradientEnum.alliance;
    } else {
      if (kDebugMode) {
        print("Cannot Shoot: No Game Piece Present");
      }
    }
  }
}
