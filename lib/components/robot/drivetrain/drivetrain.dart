import 'package:flame/components.dart';

abstract class Drivetrain {
  late Vector2 direction;
  late double x;
  late double y;
  void moveDrivetrain(Vector2 newDirection) {
    direction = newDirection;

    x += direction.x / 3600;
    y += direction.y / 3600;
  }
}
