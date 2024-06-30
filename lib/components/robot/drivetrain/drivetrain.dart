import 'package:flame/components.dart';

abstract class Drivetrain {
  late Vector2 direction;
  late double x;
  late double y;
  void moveDrivetrain(List<Vector2> newDirections, double dt) {
    direction = newDirections.first;

    x += direction.x / 3600 * dt;
    y += direction.y / 3600 * dt;
  }
}
