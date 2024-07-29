import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:player_move/providers/robot/robot_provider.dart';

class OverBumperSprite extends SpriteComponent {
  OverBumperSprite({required this.ref});
  ComponentRef ref;

  @override
  Future<void> onMount() async {
    super.size = Vector2(
        pow(ref.watch(robotProviderProvider).kHalfWidth, 2.3).toDouble(),
        pow(ref.watch(robotProviderProvider).kHalfHeight, 2.3).toDouble());
    super.anchor = Anchor.center;
    super.onMount();
  }

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load("underbumper_intake.png");
  }
}
