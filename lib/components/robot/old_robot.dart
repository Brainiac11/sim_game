import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:player_move/components/robot/drivetrain/drivetrain.dart';
import 'package:player_move/components/robot/drivetrain/swerve_drivetrain.dart';

class OldRobot extends RectangleComponent with HasGameRef {
    OldRobot({required this.drivetrain})
      : super(
          anchor: Anchor.center,
          size: Vector2.all(100),
          position: Vector2(100, 100),
          priority: 10,
        );
  final double _maxTranslationalSpeed = 10;
  final double _maxRotationalSpeed = .002;
  double dt = 0;
  Drivetrain drivetrain;
  Vector2 direction = Vector2(0, 0);
  Vector2 rotation = Vector2(0, 0);
  // Paint paint = Paint();

  // NEW IDEA
  // FOR ACCELERATION AND DECELLERATION AND DIRECTIONAL CHANGES
  // Deccleration: Vector divided by a value derived from the dot product of the old force and the new force
  // Acceleration: Vector multiplied by a value derived from the dot product of the old and the new force
  // Directional Changes: Use moveTo method in Vector2 class to smoothly move the angle


  @override
  Future<void> onLoad() async {
    super.onLoad();
    paint.color = Colors.blue;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;
    super.paint = paint;
  }

  void moveRobot(Vector2 direction, Vector2 rotation, double dt) {
    // if (kDebugMode) {
    //   print(direction.screenAngle() * radians2Degrees);
    // }
    // double angleRadians = rotation.screenAngle();
    drivetrain.moveDrivetrain([direction, rotation], dt);
    // _moveRotational(rotation, dt);
    // _moveTranslational(direction, dt);
  }

  // double Vec

  void _moveRotational(Vector2 rotation, double dt) {
    super.angle += rotation.x * _maxRotationalSpeed;
  }

  void _moveTranslational(Vector2 transformation, double dt) {
    // super.position = NotifyingVector2(
    //     direction.x + this.direction.x, direction.y + this.direction.y);
    if (kDebugMode) {
      // print(direction.x);
    }
    // direction.moveToTarget(target, ds)
    super.position.x += transformation.x * _maxTranslationalSpeed * dt;
    super.position.y += transformation.y * _maxTranslationalSpeed * dt;
    // super.position.x += direction.x / 3600;
    // super.position.y += direction.y / 3600;
    // super.position = NotifyingVector2(100, 200);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    moveRobot(direction, rotation, dt);
  }

  @override
  void update(double dt) {
    super.update(dt);
    this.dt = dt;
  }
}
