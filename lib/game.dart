import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:player_move/components/border.dart';
import 'package:player_move/components/robot/robot.dart';
import 'package:player_move/components/robot/robot_constants.dart';
import 'package:player_move/constants.dart';

class RoboticsGame extends Forge2DGame {
  // final Robot _robot = Robot(drivetrain: SwerveDrivetrain());
  final fps = FpsTextComponent(position: Vector2(5, kWorldSize.y));
  final totalBodies = TextComponent(position: Vector2(5, kWorldSize.x * 2));
  Robot robot = Robot();

  RoboticsGame() : super(zoom: 10, gravity: Vector2.zero());
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    if (kDebugMode) {
      print("Screen Size: (${kScreenSize.x} , ${kScreenSize.y})");
    }
    camera.viewport = FixedResolutionViewport(resolution: kScreenSize);
    add(_Background(size: kScreenSize));

    await add(fps);
    await add(totalBodies);
    await world.add(BorderEdge());
    await world.add(robot);
    robot.body.angularDamping = kAngularIdleDeccelerationRate;
    robot.body.linearDamping = kTranslationalIdleDeccelerationRate;
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Updated the number of bodies in the world
    totalBodies.text = 'Bodies: ${world.children.length}';

    if (kDebugMode) {}
  }

  @override
  Color backgroundColor() {
    // Paints the background red
    return Colors.red;
  }

  void linearMovement(Vector2 value) {
    robot.body.applyLinearImpulse(value * kTranslationalAccelerationRate);

    if (kDebugMode) {
      print(value.length);
    }
    robot.body.linearVelocity.clampLength(0, kMaxTranslationalSpeed);
    if (robot.body.linearVelocity.length >
        value.length * kTranslationalAccelerationRate) {
      robot.body.linearDamping = kTranslationalDeccelerationRate;
    } else {
      robot.body.linearDamping = kTranslationalIdleDeccelerationRate;
    }
  }

  void angularMovement(Vector2 value) {
    robot.body.angularVelocity.clamp(-kMaxRotationalSpeed, kMaxRotationalSpeed);
    robot.body.applyAngularImpulse(value.x * kAngularAccelerationRate);

    if (robot.body.angularVelocity > value.x * kAngularAccelerationRate) {
      robot.body.angularDamping = kAngularDeccelerationRate;
    } else {
      robot.body.angularDamping = kAngularIdleDeccelerationRate;
    }
  }

  double scaleMath(double maximum, double current) {
    double percent = (maximum - current) / 100;
    return 100 - percent;
  }
}

// Helper component that paints a black background
class _Background extends PositionComponent {
  _Background({super.size});

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.x, size.y), Paint()..color = Colors.black);
  }
}
