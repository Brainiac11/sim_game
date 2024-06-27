import 'package:flame/components.dart';
import 'package:player_move/helpers/kinematics/motioned_acceleration.dart';

abstract class Drivetrain {
  late Vector2 direction;
  late MotionedAcceleration acceleration;
  late double x;
  late double y;
  void moveDrivetrain(Vector2 newDirection) {
    direction = newDirection;

    x += direction.x / 3600;
    y += direction.y / 3600;
  }
}
