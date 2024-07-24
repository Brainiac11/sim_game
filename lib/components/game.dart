import 'dart:async';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:player_move/components/border/border.dart';
import 'package:player_move/components/robot/robot.dart';
import 'package:player_move/constants.dart';
import 'package:player_move/providers/settings/settings.dart';
import 'package:player_move/providers/settings/settings_notifier.dart';
import 'package:flame_riverpod/flame_riverpod.dart';

class RoboticsGame extends Forge2DGame with RiverpodGameMixin {
  // final Robot _robot = Robot(drivetrain: SwerveDrivetrain());
  final fps = FpsTextComponent(position: Vector2(5, kWorldSize.y));
  final totalBodies =
      TextComponent(position: Vector2(5, kWorldSize.x * 2), priority: 1);
  late Robot robot;

  RoboticsGame() : super(zoom: 10, gravity: Vector2.zero());

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    if (kDebugMode) {
      print("Screen Size: (${kScreenSize.x} , ${kScreenSize.y})");
    }

    camera.viewport = FixedResolutionViewport(resolution: kScreenSize);

    await add(fps);
    await add(totalBodies);

    // await add(_Background(size: kScreenSize));
    await world.add(BorderEdge(borderKey: const ValueKey("Top")));
    await world.add(BorderEdge(borderKey: const ValueKey("Bottom")));
    await world.add(BorderEdge(borderKey: const ValueKey("Right")));
    await world.add(BorderEdge(borderKey: const ValueKey("Left")));
    robot = Robot(ref: ref);
    await world.add(robot);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Updated the number of bodies in the world
    totalBodies.text = 'Bodies: ${world.children.length}';

    if (kDebugMode) {}
  }

  @override
  Color backgroundColor() {
    // Paints the background red
    return Colors.red;
  }

  void linearMovement(Vector2 value) {
    robot.linearMovement(value);
  }

  void angularMovement(Vector2 value) {
    robot.angularMovement(value);
  }
}

// Helper component that paints a black background
// class _Background extends PositionComponent with RiverpodComponentMixin {
//   _Background({super.size});
//   late AppSettings settings;
//   ThemeMode themeMode = ThemeMode.dark;

//   Future<ui.Image> loadImage(String asset) async {
//     ByteData data = await rootBundle.load(asset);
//     ui.Codec codec = await ui.instantiateImageCodec(
//       allowUpscaling: false,
//       data.buffer.asUint8List(),
//       targetHeight: kScreenSize.y.toInt(),
//       targetWidth: kScreenSize.x.toInt(),
//     );
//     ui.FrameInfo fi = await codec.getNextFrame();
//     return fi.image;
//   }

//   ui.Image? loadSyncImage(String asset) {
//     loadImage(asset).then((value) {
//       return value;
//     });
//     return null;
//   }

//   FutureOr<void> updateFieldImage(ThemeMode themeMode) async {
//     if (kDebugMode) {
//       print("Field Image Theme Mode: ${themeMode.toString()}");
//     }
//     fieldImage = await loadImage(themeMode == ThemeMode.dark
//         ? "assets/images/dark_field.png"
//         : "assets/images/light_field.png");
//     // fieldImage = await fieldImage.resize(Vector2(
//     //     ,
//     // const MediaQueryData().devicePixelRatio * fieldImage.height));
//   }

//   late ui.Image fieldImage;

//   @override
//   void onMount() {
//     addToGameWidgetBuild(() {
//       themeMode = ref.watch(settingsNotifierProvider).themeMode;
//       updateFieldImage(themeMode);
//     });

//     super.onMount();
//   }

//   @override
//   FutureOr<void> onLoad() async {
//     // updateFieldImage(ThemeMode.dark);

//     return super.onLoad();
//   }

//   @override
//   FutureOr<void> render(Canvas canvas) async {
// // Find a better way to implement this
// // Currently just a bandaid
//     try {
//       canvas.drawImage(fieldImage, Offset.zero, Paint());
//     } catch (e) {}
//   }
// }
