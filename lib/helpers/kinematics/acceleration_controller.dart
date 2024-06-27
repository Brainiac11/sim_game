import 'package:flame/components.dart';
import 'package:flutter/animation.dart';

class AccelerationController {
  AccelerationController({required this.rawVector, required this.maxSpeed, required this.accelerationTime});
  Vector2 rawVector;
  late Vector2 currentVector;
  Vector2 maxSpeed;
  Curve accelerationCurve = Curves.decelerate;

  ///  {accelerationTime} should be measured in seconds, typically 0.01
  double accelerationTime;

  /// This function is recursive, {t} increments by {accelerationTime}
  void accelerate(double t) {
    if (t < 1.0) {
      currentVector.scaleTo(maxSpeed.length * accelerationCurve.transform(t));
      accelerate(t + accelerationTime);
    }
  }
}
