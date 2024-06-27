import 'package:flame/components.dart';

class Inertia {
  Inertia({
    required this.inputVector,
    required this.outputVector,
  });

  Vector2 inputVector;
  late Vector2 orthoCenterVector;
  Vector2 outputVector;
  late Vector2 realVector;

  void calculateOrthocenter() {
    // CREDIT
    // GEEKS FOR GEEKS
    double x1 = 0;
    double x2 = inputVector.x;
    double x3 = outputVector.x;
    double y1 = 0;
    double y2 = inputVector.y;
    double y3 = outputVector.y;
    double x = (inputVector.length * x1 +
            outputVector.length * x2 +
            inputVector.distanceTo(outputVector) * x3) /
        (inputVector.length +
            outputVector.length +
            inputVector.distanceTo(outputVector));
    double y = (inputVector.length * y1 +
            outputVector.length * y2 +
            inputVector.distanceTo(outputVector) * y3) /
        (inputVector.length +
            outputVector.length +
            inputVector.distanceTo(outputVector));
    orthoCenterVector = Vector2(x, y);
  }

  /// Moves the {realVector} from {inputVector} to the {orthoCenterVector} in ds1 time, then moves to {outputVector} in ds2 time
  void moveRealVector(double ds1, double ds2) {
    realVector = inputVector;
    realVector.moveToTarget(orthoCenterVector, ds1);
    realVector.moveToTarget(outputVector, ds2);
  }
}
