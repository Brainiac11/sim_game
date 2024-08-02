import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:player_move/custom_widgets/gradient/gradient_enum.dart';

final class GradientHud extends PositionComponent {
  Color _color = Colors.transparent;

  static GradientEnum gradientEnum = GradientEnum.alliance;

  GradientHud();

  void setColorFromEnum(GradientEnum value) {
    switch (value) {
      case GradientEnum.alliance:
        _color = Colors.blue[900]!.withOpacity(0.6);
        break;
      case GradientEnum.hasGamePiece:
        _color = const Color.fromRGBO(245, 75, 28, 0.6);
        break;
      case GradientEnum.intaking:
        _color = const Color.fromARGB(255, 115, 0, 255).withOpacity(0.6);
        break;
      case GradientEnum.targeting:
        _color = Colors.green[900]!.withOpacity(0.6);
        break;
      default:
        _color = Colors.transparent;
        break;
    }
  }

  @override
  void onRemove() {
    gradientEnum = GradientEnum.alliance;
    super.onRemove();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    setColorFromEnum(gradientEnum);
    final Gradient gradient1 = RadialGradient(
      center: const Alignment(-1, -1), // top-left corner
      radius: 2.0, // extend the radius to cover the screen
      colors: [
        _color,
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
        _color,
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
