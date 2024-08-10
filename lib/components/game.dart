import 'dart:async';
import 'dart:ui';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:player_move/components/background.dart';
import 'package:player_move/components/border/border.dart';
import 'package:player_move/components/field_elements/obstacles/obstacle.dart';
import 'package:player_move/components/field_elements/obstacles/obstacle_config.dart';
import 'package:player_move/components/field_elements/obstacles/obstacles_constants.dart';
import 'package:player_move/components/game_piece/game_piece.dart';
import 'package:player_move/components/game_piece/game_piece_enum.dart';
import 'package:player_move/components/robot/robot.dart';
import 'package:player_move/constants.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:player_move/custom_widgets/gradient/gradient_enum.dart';
import 'package:player_move/custom_widgets/gradient/gradient_widget.dart';
import 'package:player_move/providers/robot/robot_provider.dart';
// const double ppm = 10.0; // Pixels per meter

late BuildContext universalContext;

class RoboticsGame extends Forge2DGame
    with RiverpodGameMixin, TapDetector, ScrollDetector {
  // final Robot _robot = Robot(drivetrain: SwerveDrivetrain());
  late final fps;
  late final totalBodies;
  late Robot robot;
  late Robot robot2;
  SpriteBackground background = SpriteBackground();
  late GamePiece gamePiece;
  late GamePiece gamePiece2;
  late GradientHud gradientHud;
  late List<Obstacle> obstacles;
  double x = 0;
  static double zoomLevel = 10;

  double referenceWidth = 3072 / 1;
  double referenceHeight = 1420 / 1;
  // static const double zoom = 30;

  @override
  void onTapDown(TapDownInfo info) {
    final worldCoordinates = screenToWorld(info.eventPosition.widget);
    if (kDebugMode) {
      print('World Coordinates: $worldCoordinates');
      print("Scaled World Coordinates: ${worldCoordinates * 1 / kPixelScale}");
      // print("Screen Coordinates: ${worldToScreen(worldCoordinates)}");
      // print(
      //     "Aspect Ratio: ${MediaQuery.of(universalContext).size.aspectRatio}");
      // print("World Size: ${size.toString()}");
    }
  }

  RoboticsGame()
      : super(
          zoom: zoomLevel,
          gravity: Vector2.zero(),
          // camera: CameraComponent.withFixedResolution(
          //     width: 3072 / 4, height: 1420 / 4),
          // camera: CameraComponent.withFixedResolution(
          //   width: getCurrentImageSize().width,
          //   height: getCurrentImageSize().height,
          // ),
          // camera: CameraComponent(
          //   viewport: FixedAspectRatioViewport(aspectRatio: 3072 / 1440),
          // camera: CameraComponent(
          //   viewport: FixedAspectRatioViewport(aspectRatio: 3072 / 1420),
          // ),
          camera: CameraComponent(
            viewport: MaxViewport(),
          ),
        );

  @override
  void onRemove() {
    // Optional based on your game needs.
    // removeAll(children);
    Flame.images.clearCache();
    Flame.assets.clearCache();
  }

  @override
  Future<void> onLoad() async {
    Flame.device.fullScreen();
    Flame.device.setLandscape();
    // camera = CameraComponent.withFixedResolution(
    //     width: getCurrentImageSize().width / 4,
    //     height: getCurrentImageSize().height / 4);
    await super.onLoad();

    fps = FpsTextComponent(position: Vector2(5, (worldToScreen(size) * 3).x));
    totalBodies = TextComponent(
        position: Vector2(5, (worldToScreen(size) * 2).y), priority: 1);
    kWorldSize = camera.viewport.size / zoomLevel;
    if (kDebugMode) {
      print("Screen Size: (${super.size.x} , ${super.size.y})");
      print("World size: (${kWorldSize.x} , ${kWorldSize.y})");
      print("Visible World Rectangle: ${camera.visibleWorldRect.size}");
    }

    if (kDebugMode) {
      await add(fps);
      await add(totalBodies);
      await add(TextComponent(
          text: super.size.toString(),
          position: Vector2(const MediaQueryData().size.width / 2,
              const MediaQueryData().size.height / 2)));
      // world.debugMode = true;
    }
    obstacles = List.empty(growable: true);
    for (ObstacleConfig obstacleConfig in obstaclesShapesList) {
      obstacles.add(Obstacle(obstacleConfig: obstacleConfig));
    }

    resizeBackground(kScreenSize);
    await world.add(background..priority = 0);
    await world.add(BorderEdge(borderKey: const ValueKey("Top")));
    await world.add(BorderEdge(borderKey: const ValueKey("Bottom")));
    await world.add(BorderEdge(borderKey: const ValueKey("Right")));
    await world.add(BorderEdge(borderKey: const ValueKey("Left")));
    await world.addAll(obstacles);
    robot = Robot(ref: ref);
    robot2 = Robot(ref: ref);
    await world.add(robot);
    // await world.add(robot2);
    camera.viewfinder.anchor = Anchor.center;
    gamePiece = GamePiece(
      position: Vector2(10, 10),
      gamePieceState: GamePieceEnum.normal,
      kMultiplier: ref.read(robotProviderProvider).kMultiplier,
    );
    gamePiece2 = GamePiece(
      position: Vector2(20, 10),
      gamePieceState: GamePieceEnum.shot,
      kMultiplier: ref.read(robotProviderProvider).kMultiplier,
    );
    await world.add(gamePiece2);
    await world.add(gamePiece);
    gradientHud = GradientHud()
      ..size = Vector2(size.x, size.y)
      ..position = Vector2.zero();
    GradientHud.gradientEnum = GradientEnum.alliance;
    camera.viewport.add(gradientHud);
    camera.follow(robot, snap: true);
    // camera.setBounds(experimental.Rectangle.fromCenter(
    //     center: background.center, size: background.size));

    if (kDebugMode) {
      print("Visible Game size ${camera.viewfinder.visibleGameSize}");
    }
  }

  @override
  void onScroll(PointerScrollInfo info) {
    zoomLevel += info.scrollDelta.global.y * -0.005;
    if (kDebugMode) {
      zoomLevel = zoomLevel.clamp(0.01, 100.0);
    } else {
      zoomLevel = zoomLevel.clamp(0.5, 15.0);
    }
    camera.viewfinder.zoom = zoomLevel;
  }

  @override
  void update(double dt) {
    super.update(dt);
    totalBodies.text = 'Bodies: ${world.children.length}';

    // background.followPosition = robot.position;
    if (kDebugMode) {}
  }

  @override
  Color backgroundColor() {
    return Colors.transparent;
  }

  void linearMovement(Vector2 value) {
    robot.linearMovement(value);
  }

  void angularMovement(Vector2 value) {
    robot.angularMovement(value);
  }

  void robotIntake() {
    robot.intakeGamePiece();
  }

  void robotShoot() {
    robot.shootGamePiece();
  }

  void resizeBackground(Vector2 screenSize) {
    double scaleX = screenSize.x / 3072;
    double scaleY = screenSize.y / 1420;

    double scale = scaleX <= scaleY ? scaleX : scaleY;

    // double scaledWidth = 3072 * scale;
    // double scaledHeight = 1420 * scale;

    background.size = Vector2(3072, 1420) * scale / 10;
  }

  Size getCurrentImageSize() {
    Size defaultImageSize = getImageSize();
    Size windowSize = MediaQuery.of(universalContext).size;
    if (kDebugMode) {
      print("Super size: ${super.size}");
    }
    // Size windowSize = super.size.toSize();
    Size currentImageSize;

    if (windowSize.aspectRatio >= defaultImageSize.aspectRatio) {
      // Window is wider relative to the image's aspect ratio
      currentImageSize = Size(
          (windowSize.height * defaultImageSize.aspectRatio.toInt()),
          windowSize.height);
    } else {
      // Window is taller relative to the image's aspect ratio
      currentImageSize = Size(windowSize.width,
          (windowSize.width / defaultImageSize.aspectRatio.toInt()));
    }
    return currentImageSize;
  }
}

Size getImageSize() {
  try {
    // Image image = Image.asset('assets/images/dark_field_updated.png');
    if (kDebugMode) {
      print(3072 / 1420);
    }
    // hard coded sizes need to update later on to support dynamic sizes
    return const Size(3072, 1420);
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
    return const Size(0, 0);
  }
}
