import 'package:flame/camera.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';
import 'package:player_move/components/robot/robot.dart';
import 'package:player_move/constants.dart';

class RoboticsGame extends Forge2DGame {
  // final Robot _robot = Robot(drivetrain: SwerveDrivetrain());
  final fps = FpsTextComponent(position: Vector2(5, worldSize.y));
  final totalBodies = TextComponent(position: Vector2(5, 200));

  Robot robot = Robot();

  RoboticsGame() : super(zoom: 10, gravity: Vector2.zero());

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    camera.viewport = FixedResolutionViewport(resolution: screenSize);
    add(_Background(size: screenSize));

    add(fps);
    add(totalBodies);
    world.add(robot);
  }

  @override
  void update(double dt) {
    super.update(dt);
    // Updated the number of bodies in the world
    totalBodies.text = 'Bodies: ${world.children.length}';
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

  void onJoyPadDirectionChanged(Vector2 value) {
    robot.acceleration = value;
  }

  void onJoyPadRotationChanged(Vector2 value) {
    robot.changeAngle(value.screenAngle());
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
