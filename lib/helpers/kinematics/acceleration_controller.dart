import 'package:flame/components.dart';
import 'package:flutter/animation.dart';

class AccelerationController {
  AccelerationController({required this.rawVector, required this.maxSpeed});
  Vector2 rawVector;
  late Vector2 currentVector;
  Vector2 maxSpeed;
  Curve accelerationCurve = Curves.decelerate;

  /// This function is recursive, {t} increments by 0.01
  void accelerate(double t) {
    if (t != 1.0) {
      currentVector.scaleTo(maxSpeed.length * accelerationCurve.transform(t));
      accelerate(t + 0.01);
    }
  }
}
