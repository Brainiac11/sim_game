import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';
import 'package:player_move/constants.dart';

/// 0th element is position
/// 1st element is first parameter for EdgeShape()..set();
/// 2nd element is second parameter for EdgeShape()..set();
final kRightBorder = List.from(<Vector2>[
  Vector2(((kWorldSize.y) - kPixelScale * 2), -kWorldSize.y / 2),
  Vector2.zero(),
  Vector2(0, kWorldSize.y),
]);

final kLeftBorder = List.from(<Vector2>[
  Vector2(-kWorldSize.y + 2 * kPixelScale, kWorldSize.y / 2),
  Vector2.zero(),
  Vector2(0, -kWorldSize.y),
]);

final kTopBorder = List.from(<Vector2>[
  Vector2(-kWorldSize.x / 2, -kWorldSize.y / 2 + 1 * kPixelScale),
  Vector2.zero(),
  Vector2(kWorldSize.x, 0),
]);

final kBottomBorder = List.from(<Vector2>[
  Vector2(-kWorldSize.x / 2, kWorldSize.y / 2 - 1 * kPixelScale),
  Vector2.zero(),
  Vector2(kWorldSize.x, 0),
]);
