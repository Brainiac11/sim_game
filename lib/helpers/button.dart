import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flame/src/events/messages/tap_down_event.dart';
import 'package:flame/widgets.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
import 'package:player_move/components/game_piece/game_piece_config.dart';
import 'package:player_move/constants.dart';

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
