import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flame/src/events/messages/tap_down_event.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
import 'package:player_move/components/game_piece/game_piece_config.dart';
import 'package:player_move/constants.dart';

class Button extends SpriteButtonComponent {
  bool isActive = false;
  Function(bool) callBack;
  Button({required this.callBack});

  @override
  void onTapDown(TapDownEvent _) {
    super.onTapDown(_);
    isActive = false;
  }

  @override
  void onTapUp(TapUpEvent _) {
    super.onTapUp(_);
    isActive = true;
  }

  @override
  void onLoad() async {
    button = await Sprite.load("intake_button.png");
    super.onLoad();
  }
}
