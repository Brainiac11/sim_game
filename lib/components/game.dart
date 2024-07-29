import 'dart:async';
import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/extensions.dart';
import 'package:flame/flame.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:player_move/components/background.dart';
import 'package:player_move/components/border/border.dart';
import 'package:player_move/components/game_piece/game_piece.dart';
import 'package:player_move/components/robot/robot.dart';
import 'package:player_move/constants.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
// const double ppm = 10.0; // Pixels per meter

late BuildContext universalContext;

class RoboticsGame extends Forge2DGame with RiverpodGameMixin {
  // final Robot _robot = Robot(drivetrain: SwerveDrivetrain());
  final fps = FpsTextComponent(position: Vector2(5, kWorldSize.y));
  final totalBodies =
      TextComponent(position: Vector2(5, kWorldSize.x * 2), priority: 1);
  late Robot robot;
  SpriteBackground background = SpriteBackground();
  late GamePiece gamePiece;
  // static const double zoom = 30;
  RoboticsGame()
      : super(
          zoom: 10,
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
  void handleResize(Vector2 size) {
    if (kDebugMode) {
      print(camera.viewport.virtualSize);
    }

    // camera.viewfinder.anchor = Anchor(robot.position.x, robot.position.y);
    super.handleResize(size);
    // kWorldSize = size;
    // background.size = size;
    // camera.viewport =
    //     FixedResolutionViewport(resolution: getImageSize().toVector2());
  }

  @override
  Future<void> onLoad() async {
    Flame.device.fullScreen();
    Flame.device.setLandscape();
    await super.onLoad();
    getImageSize();
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
    }

    await world.add(background..priority = 0);
    await world.add(BorderEdge(borderKey: const ValueKey("Top")));
    await world.add(BorderEdge(borderKey: const ValueKey("Bottom")));
    await world.add(BorderEdge(borderKey: const ValueKey("Right")));
    await world.add(BorderEdge(borderKey: const ValueKey("Left")));
    robot = Robot(ref: ref);
    await world.add(robot);
    camera.viewfinder.anchor = Anchor.center;
    camera.follow(robot, maxSpeed: 25, snap: false);
    camera.setBounds(
        Rectangle.fromCenter(center: background.center, size: background.size));
    gamePiece = GamePiece(position: Vector2(10, 10));

    await world.add(gamePiece);
    robot.intializeSprite();
    if (kDebugMode) {
      print("Visible Game size ${camera.viewfinder.visibleGameSize}");
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    totalBodies.text = 'Bodies: ${world.children.length}';

    background.followPosition = robot.position;
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

// Helper component that paints a black background
