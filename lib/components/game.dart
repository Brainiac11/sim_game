import 'dart:async';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart' as experimental;
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/background.dart';
import 'package:player_move/components/border/border.dart';
import 'package:player_move/components/field_elements/obstacles/obstacle.dart';
import 'package:player_move/components/field_elements/obstacles/obstacles_constants.dart';
import 'package:player_move/components/game_piece/game_piece.dart';
import 'package:player_move/components/robot/robot.dart';
import 'package:player_move/components/robot/states/robot_states.dart';
import 'package:player_move/constants.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:player_move/custom_widgets/gradient/gradient_enum.dart';
import 'package:player_move/custom_widgets/gradient/gradient_widget.dart';
// const double ppm = 10.0; // Pixels per meter

late BuildContext universalContext;

class RoboticsGame extends Forge2DGame
    with RiverpodGameMixin, TapDetector, ScrollDetector {
  // final Robot _robot = Robot(drivetrain: SwerveDrivetrain());
  final fps = FpsTextComponent(position: Vector2(5, kWorldSize.y));
  final totalBodies =
      TextComponent(position: Vector2(5, kWorldSize.x * 2), priority: 1);
  late Robot robot;
  late Robot robot2;
  SpriteBackground background = SpriteBackground();
  late GamePiece gamePiece;
  late GamePiece gamePiece2;
  late GradientHud gradientHud;
  late List<Obstacle> obstacles;
  double x = 0;
  static double zoomLevel = 10;
  // static const double zoom = 30;

  @override
  void onTapDown(TapDownInfo info) {
    final worldCoordinates = screenToWorld(info.eventPosition.global);
    if (kDebugMode) {
      print('World Coordinates: $worldCoordinates');
    }
  }

  // Vector2 screenToWorld(Vector2 screenPosition) {
  //   // Implement your conversion logic if necessary
  //   return screenPosition; // Assuming 1:1 mapping for simplicity
  // }
  RoboticsGame()
      : super(
          zoom: zoomLevel,
          gravity: Vector2.zero(),
          // camera: CameraComponent.withFixedResolution(
          //     width: getImageSize().width, height: getImageSize().height),
          // camera: CameraComponent(
          //   viewport: FixedAspectRatioViewport(aspectRatio: 3072 / 1440),
          camera: CameraComponent(
            viewport: MaxViewport(),
          ),
        );

  // _Background background = _Background(size: kWorldSize);
  @override
  void onRemove() {
    // Optional based on your game needs.
    // removeAll(children);
    Flame.images.clearCache();
    Flame.assets.clearCache();
    // Any other code that you want to run when the game is removed.
  }

  @override
  Future<void> onLoad() async {
    Flame.device.fullScreen();
    Flame.device.setLandscape();
    await super.onLoad();
    if (kDebugMode) {
      // kWorldSize = size;
      print("Screen Size: (${super.size.x} , ${super.size.y})");
      print("World size: (${kWorldSize.x} , ${kWorldSize.y})");
    }

    if (kDebugMode) {
      await add(fps);
      await add(totalBodies);
      await add(TextComponent(
          text: super.size.toString(),
          position: Vector2(kWorldSize.x / 2, kWorldSize.y / 2)));
      // world.debugMode = true;
    }
    obstacles = List.empty(growable: true);
    for (Shape obstacleShape in obstaclesShapesList) {
      obstacles.add(Obstacle(obstacleShape: obstacleShape));
    }

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
    gamePiece = GamePiece(position: Vector2(10, 10));
    gamePiece2 = GamePiece(position: Vector2(20, 10));
    await world.add(gamePiece2);
    await world.add(gamePiece);
    gradientHud = GradientHud()
      ..size = Vector2(size.x, size.y)
      ..position = Vector2.zero();
    GradientHud.gradientEnum = GradientEnum.alliance;
    camera.viewport.add(gradientHud);
    camera.follow(robot, maxSpeed: 25, snap: false);
    camera.setBounds(experimental.Rectangle.fromCenter(
        center: background.center, size: background.size));

    if (kDebugMode) {
      print("Visible Game size ${camera.viewfinder.visibleGameSize}");
    }
  }

  @override
  void onScroll(PointerScrollInfo info) {
    zoomLevel += info.scrollDelta.global.y * -0.005;
    zoomLevel = zoomLevel.clamp(0.5, 15.0);
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
}

Size getCurrentImageSize() {
  Size defaultImageSize = getImageSize();
  Size windowSize = MediaQuery.of(universalContext).size;
  Size currentImageSize;

  if (windowSize.aspectRatio > defaultImageSize.aspectRatio) {
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
