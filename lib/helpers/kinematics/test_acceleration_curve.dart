import 'package:flutter/animation.dart';

class TestAccelerationCurve {
  TestAccelerationCurve({
    required this.speedRange,
    required this.timeRange,
    required this.curve,
  });

  /// maximum range of the speed, must be greater than 0;
  double speedRange;

  /// Measured in seconds
  /// negative time signifies decceleration
  double timeRange;

  Curve curve;

  double getSpeed(double t) {
    if (timeRange < 0 && curve.transform(0) == 0) {
      // If its not doing what its supposed to, then flip
      curve = curve.flipped;
    } else if (timeRange > 0 && curve.transform(0) == 1) {
      // If its not doing what its supposed to, then flip
      curve = curve.flipped;
    }

    // scales the time with the provided time range of the curve
    t /= timeRange.abs();
    double rawValue = curve.transform(t);
    return rawValue *
        speedRange; // scales the value by the speed range of the curve
  }

  bool isAcceleration() => timeRange > 0;
}
