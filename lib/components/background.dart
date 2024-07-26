import 'dart:async';
import 'dart:ui' as ui;

import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:player_move/components/game.dart';
import 'package:player_move/components/robot/robot.dart';
import 'package:player_move/constants.dart';
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
      canvas.drawImage(fieldImage, Offset.zero, Paint());
    } catch (e) {}
  }
}

class SpriteBackground extends SpriteComponent with RiverpodComponentMixin {
  void updateRawSize() {
    Size current = getCurrentImageSize();
    current = MediaQuery.of(universalContext).size;
  }

  // HALL OF FAMMEEEEE
  final Vector2 rawSize = Size(3072, 1420).toVector2() /
      (MediaQuery.of(universalContext).size.height / 1420);
  // Robot robotToMatch;
  SpriteBackground();
  @override
  FutureOr<void> onMount() async {
    super.onMount();
    addToGameWidgetBuild(() {});
    return super.onLoad();
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
// Image image = Image.asset("game_piece.png");
    await Sprite.load("dark_field_updated.png").then((value) {
      sprite = value;
    });
    print("RawSize " + rawSize.toString());
    sprite?.srcSize = rawSize;

    // sprite?.srcPosition = robotToMatch.position;
  }

  @override
  void render(Canvas canvas) {
    // sprite?.srcPosition = robotToMatch.position;
    super.render(canvas);
  }
}
