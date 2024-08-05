import 'dart:async';
import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:player_move/components/game.dart';
import 'package:player_move/providers/settings/settings.dart';
import 'package:player_move/providers/settings/settings_notifier.dart';

class Background extends PositionComponent with RiverpodComponentMixin {
  Background();
  late AppSettings settings;
  ThemeMode themeMode = ThemeMode.dark;

  Future<ui.Image> loadImage(String asset) async {
    ByteData data = await rootBundle.load(asset);
    ui.Codec codec = await ui.instantiateImageCodec(
      allowUpscaling: true,
      data.buffer.asUint8List(),
      targetHeight: 1420 ~/ 3,
      targetWidth: 3072 ~/ 3,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    // ImageProvider imageProvider = ResizeImage(
    //   Image.asset('assets/images/dark_field_updated.png').image,
    //   policy: ResizeImagePolicy.fit,
    //   width: kWorldSize.x.toInt(),
    //   height: kWorldSize.y.toInt(),
    // ).imageProvider;
    return fi.image;
  }

  ui.Image? loadSyncImage(String asset) {
    loadImage(asset).then((value) {
      return value;
    });
    return null;
  }

  FutureOr<void> updateFieldImage(ThemeMode themeMode) async {
    if (kDebugMode) {
      print("Field Image Theme Mode: ${themeMode.toString()}");
    }
    fieldImage = await loadImage(themeMode == ThemeMode.dark
        ? "assets/images/dark_field_updated.png"
        : "assets/images/light_field.png");
    // fieldImage = await fieldImage.resize(Vector2(
    //     ,
    // const MediaQueryData().devicePixelRatio * fieldImage.height));
  }

  late ui.Image fieldImage;

  @override
  void onMount() {
    addToGameWidgetBuild(() {
      themeMode = ref.watch(settingsNotifierProvider).themeMode;
      updateFieldImage(themeMode);
    });

    super.onMount();
  }

  @override
  FutureOr<void> onLoad() async {
    // updateFieldImage(ThemeMode.dark);

    return super.onLoad();
  }

  @override
  FutureOr<void> render(Canvas canvas) async {
// Find a better way to implement this
// Currently just a bandaid

    try {
      Paint paint = Paint()
        ..shader = ui.ImageShader(fieldImage, TileMode.clamp, TileMode.clamp,
            Matrix4.identity().storage)
        ..brighten(1000);
      //       ShaderMask shaderMask = ShaderMask(
      //   child: fieldImage,
      //   shaderCallback: (Rect bounds) {
      //     return LinearGradient(
      //       colors: [Colors.orange, Colors.deepOrange],
      //     ).createShader(bounds);
      //   },
      //   blendMode: BlendMode.lighten,
      // );
      canvas.drawImage(fieldImage, Offset.zero, paint);
    } catch (e) {}
  }
}

class SpriteBackground extends SpriteComponent {
  void updateRawSize() {
    // Size current = getCurrentImageSize();
    // current = MediaQuery.of(universalContext).size;
  }

  // HALL OF FAMMEEEEE
  // final Vector2 rawSize = const Size(3072, 1420).toVector2() /
  //     (MediaQuery.of(universalContext).size.toVector2().length *
  //         MediaQuery.of(universalContext).size.aspectRatio /
  //         (1420 * 3072));

  // final Vector2 rawSize = const Size(3072, 1420).toVector2() *
  //     10000000 *
  //     MediaQuery.of(universalContext).size.aspectRatio /
  //     (MediaQuery.of(universalContext).size.height *
  //         MediaQuery.of(universalContext).size.width);
  SpriteBackground();
  // @override
  // FutureOr<void> onMount() async {
  //   super.onMount();
  //   addToGameWidgetBuild(() {});
  //   return super.onLoad();
  // }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
// Image image = Image.asset("game_piece.png");
    await Sprite.load("dark_field_updated.png").then((value) {
      sprite = value;
    });
    if (kDebugMode) {
      // print("RawSize $rawSize");
    }
    // sprite?.srcSize = rawSize;
    // sprite?.srcPosition = followPosition;
    super.anchor = Anchor.topLeft;
    // print((super.findGame() as Forge2DGame).size);

    super.position = Vector2((findGame() as Forge2DGame).size.x / -20,
        (findGame() as Forge2DGame).size.y / -20);

    // super.position = Vector2(-kWorldSize.x / 2, -kWorldSize.y / 2);
  }

  @override
  void render(Canvas canvas) {
    // sprite?.srcPosition = followPosition * 0;
    super.render(canvas);
  }
}
