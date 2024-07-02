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
double widthDP = sizeDP.width;
double heightDP = sizeDP.height;

//Safe area paddings in logical pixels
var paddingDP = MediaQueryData.fromView(view).padding;

final screenSize = Vector2(widthDP, heightDP);
final worldSize = Vector2(widthDP / 10, heightDP / 10);
const rotationalScale = 0.1;
const maximumTranslationalLength = 40.0;
const maximumRotationalLength = 8.0;
