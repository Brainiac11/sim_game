import 'dart:ui';

import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;

// Dimensions in physical pixels (px)
Size sizePX = view.physicalSize;
double widthPX = sizePX.width;
double heightPX = sizePX.height;
// Size sizeDP = Size(
//     view.physicalSize.width / ((3840 / 1556) * view.devicePixelRatio),
//     view.physicalSize.height / ((3840 / 1556) * view.devicePixelRatio));
// Dimensions in logical pixels (dp)
Size sizeDP = view.physicalSize / view.devicePixelRatio;

double widthDP = sizeDP.width;
double heightDP = sizeDP.height;

var paddingDP = MediaQueryData.fromView(view).padding;

Vector2 kScreenSize = Vector2(widthDP, heightDP);
Vector2 kWorldSize = Vector2(widthDP / 10, heightDP / 10);
// Vector2 kWorldSize = Vector2(3072, 1420) / 2;

double kPixelScale = kScreenSize.length / Vector2(3072, 1420).length;

MassData kRobotMass = MassData()..mass = 60;
const kRotationalScale = 1;

mixin CollisionCategoryFilters {
  final int everything = 0x1;
  final int none = 0x0;
}

mixin CollisionMaskFilters {
  final int onlyShotGamePiece = 0x1;
  final int onlyRobot = 0x2;
  final int onlyFerryedGamePiece = 0x3;
  final int shotAndFerryedGamePiece = 0x4;
  final int none = 0x0;
}

// const kMaxTranslationalSpeed = 40.0;
// const kMaxRotationalSpeed = 8.0;

Brightness kSystemBrightness = PlatformDispatcher.instance.platformBrightness;

ThemeData kTheme = ThemeData.from(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue[900]!,
    dynamicSchemeVariant: DynamicSchemeVariant.tonalSpot,
    brightness: Brightness.light,
  ),
  useMaterial3: true,
);
