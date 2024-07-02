import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:player_move/components/border.dart';
import 'package:player_move/components/robot/robot.dart';
import 'package:player_move/constants.dart';
import 'package:player_move/helpers/joypad.dart';

class RoboticsGame extends Forge2DGame {
  // final Robot _robot = Robot(drivetrain: SwerveDrivetrain());
  final fps = FpsTextComponent(position: Vector2(5, worldSize.y));
  final totalBodies = TextComponent(position: Vector2(5, 200));
  Robot robot = Robot();

  RoboticsGame() : super(zoom: 10, gravity: Vector2.zero());
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    if (kDebugMode) {
      print("Whatsp pap ${screenSize.x}");
    }
    camera.viewport = FixedResolutionViewport(resolution: screenSize);
    add(_Background(size: screenSize));

    await add(fps);
    await add(totalBodies);
    await world.add(BorderEdge());
    await world.add(robot);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Updated the number of bodies in the world
    totalBodies.text = 'Bodies: ${world.children.length}';

    if (kDebugMode) {
      // print(robot.body.angularVelocity);
    }
  }

  @override
  Color backgroundColor() {
    // Paints the background red
    return Colors.red;
  }

  // void onJoyPadDirectionChanged(Vector2 direction) {
  //   robot.direction = direction;
  // }

  // void onJoyPadRotationChanged(Vector2 rotation) {
  //   robot.rotation = rotation;
  // }

  void linearMovement(Vector2 value) {
    robot.body.applyLinearImpulse(value * 40);
    // robot.body.inverseInertia = 10;
    // if (robot.body.linearVelocity.length != maximumTranslationalLength) {
    //   value.scale(scaleMath(
    //       maximumTranslationalLength, robot.body.linearVelocity.length));

    // }

    if (kDebugMode) {
      print(value.length);
    }
    robot.body.linearVelocity.clampLength(0, maximumTranslationalLength);
    if (robot.body.linearVelocity.length > value.length * 40) {
      robot.body.linearDamping = 5;
    } else {
      robot.body.linearDamping = 0;
    }

    // robot.body.linearVelocity.moveToTarget(value, 1);
  }

  void angularMovement(Vector2 value) {
    robot.body.angularVelocity
        .clamp(-maximumRotationalLength, maximumRotationalLength);
    robot.body.applyAngularImpulse(value.x * 70);
    // robot.body.applyTorque(value.x * 1000);

    if (robot.body.angularVelocity > value.x * 70) {
      robot.body.angularDamping = 12;
    } else {
      robot.body.angularDamping = 8;
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
