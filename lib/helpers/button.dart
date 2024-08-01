
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

class RobotButton extends SpriteComponent with TapCallbacks {
  ValueSetter<bool> isActive;

  RobotButton({required this.isActive});

  @override
  void onTapDown(TapDownEvent event) {
    isActive(true);
    super.onTapDown(event);
  }

  void updateSprite(String path) async {
    sprite = await Sprite.load(path);
  }

  @override
  void onTapUp(TapUpEvent event) {
    isActive(false);
    super.onTapUp(event);
  }
}
