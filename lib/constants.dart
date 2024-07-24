import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;

// Dimensions in physical pixels (px)
Size sizePX = view.physicalSize;
double widthPX = sizePX.width;
double heightPX = sizePX.height;

// Dimensions in logical pixels (dp)
Size sizeDP = view.physicalSize / view.devicePixelRatio;
// Size sizeDP = Size(
//     view.physicalSize.width / ((3840 / 1556) * view.devicePixelRatio),
//     view.physicalSize.height / ((3840 / 1556) * view.devicePixelRatio));
double widthDP = sizeDP.width;
double heightDP = sizeDP.height;

//Safe area paddings in logical pixels
var paddingDP = MediaQueryData.fromView(view).padding;

Vector2 kScreenSize = Vector2(widthDP, heightDP);
Vector2 kWorldSize = Vector2(widthDP / 10, heightDP / 10);
const kRotationalScale = 1;
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
