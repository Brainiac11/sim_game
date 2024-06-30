import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:player_move/components/robot/drivetrain/swerve_drivetrain.dart';
import 'package:player_move/components/robot/robot.dart';

import 'components/player.dart';

class MainGame extends FlameGame with KeyboardEvents {
  final Player _player = Player();
  final Robot _robot = Robot(drivetrain: SwerveDrivetrain(rotational: Vector2(0, 0), direction: Vector2(0, 0)));
  @override
  Future<void> onLoad() async {
    super.onLoad();
    add(_player);
    add(_robot);
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isKeyDown = event is RawKeyDownEvent;
    Vector2? keyDirection;

    if (event.logicalKey == LogicalKeyboardKey.keyA) {
      keyDirection = Vector2(-1, 0);
    } else if (event.logicalKey == LogicalKeyboardKey.keyD) {
      keyDirection = Vector2(1, 0);
    } else if (event.logicalKey == LogicalKeyboardKey.keyW) {
      keyDirection = Vector2(0, -1);
    } else if (event.logicalKey == LogicalKeyboardKey.keyS) {
      keyDirection = Vector2(0, 1);
    }

    if (isKeyDown && keyDirection != null) {
      _player.direction = keyDirection;
    } else if (_player.direction == keyDirection) {
      _player.direction = Vector2(0, 0);
    }
    return super.onKeyEvent(event, keysPressed);
  }

  void onJoyPadDirectionChanged(Vector2 direction) {
    _player.direction = direction;
    _robot.direction = direction;
  }

  void onJoyPadRotationChanged(Vector2 rotation) {
    _robot.rotation = rotation;
  }
}
