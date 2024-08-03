import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:player_move/providers/robot/robot_provider.dart';

class UnderBumperSprite extends SpriteComponent {
  UnderBumperSprite({required this.ref});
  ComponentRef ref;
  @override
  Future<void> onMount() async {
    size = Vector2(
      ref.read(robotProviderProvider).kHalfWidth * 1.9,
      ref.read(robotProviderProvider).kHalfHeight * 1.9,
    );
    anchor = Anchor.center;
    super.onMount();
  }

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load("underbumper_intake.png");
  }
}
