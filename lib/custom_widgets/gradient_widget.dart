import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class GradientHud extends PositionComponent {
  Color color = Colors.transparent;

  GradientHud({required this.color});

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final Gradient gradient1 = RadialGradient(
      center: const Alignment(-1, -1), // top-left corner
      radius: 2.0, // extend the radius to cover the screen
      colors: [
        color,
        Colors.transparent,
      ],
      stops: const [0.0, 0.6],
    );

    final Paint paint1 = Paint()
      ..shader = gradient1.createShader(Rect.fromLTWH(0, 0, size.x, size.y));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.x, size.y), paint1);

    final Gradient gradient2 = RadialGradient(
      center: const Alignment(1, -1), // top-right corner
      radius: 2.0, // extend the radius to cover the screen
      colors: [
        color,
        Colors.transparent,
      ],
      stops: const [0.0, 0.6],
    );

    final Paint paint2 = Paint()
      ..shader = gradient2.createShader(Rect.fromLTWH(0, 0, size.x, size.y));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.x, size.y), paint2);
  }

  @override
  bool get debugMode => false;
}
