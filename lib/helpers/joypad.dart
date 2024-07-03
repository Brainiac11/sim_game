import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

class Joypad extends StatefulWidget {
  final ValueSetter<Vector2>? getDirection;
  const Joypad({super.key, required this.getDirection});

  @override
  JoypadState createState() => JoypadState();
}

class JoypadState extends State<Joypad> {
  Vector2 direction = Vector2.zero();

  @override
  Widget build(BuildContext context) {
    return Joystick(
      key: const Key("Joystick"),
      listener: listener,
      period: const Duration(milliseconds: 10),
      stick: JoystickStick(
        size: 85,
        decoration: JoystickStickDecoration(
          color: Colors.white70,
          shadowColor: Colors.transparent,
        ),
      ),
      base: JoystickBase(
        size: 180,
        decoration: JoystickBaseDecoration(
          color: Colors.transparent,
          drawOuterCircle: false,
          drawArrows: false,
          drawInnerCircle: false,
          drawMiddleCircle: false,
        ),
      ),
      includeInitialAnimation: false,
    );
  }

  void listener(StickDragDetails details) {
    direction = Vector2(details.x, details.y);
    widget.getDirection!(direction);
  }
}
