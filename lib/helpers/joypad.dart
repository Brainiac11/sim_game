import 'dart:math';
import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Joypad extends StatefulWidget {
  final ValueChanged<Vector2>? onDirectionChanged;

  const Joypad({super.key, this.onDirectionChanged});

  @override
  JoypadState createState() => JoypadState();
}

class JoypadState extends State<Joypad> {
  // Direction direction = Direction.none;
  Vector2 direction = Vector2(0, 0);
  Offset delta = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 180,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
        ),
        child: GestureDetector(
          onPanDown: onDragDown,
          onPanUpdate: onDragUpdate,
          onPanEnd: onDragEnd,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0x88ffffff),
              borderRadius: BorderRadius.circular(60),
            ),
            child: Center(
              child: Transform.translate(
                offset: delta,
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xccffffff),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void updateDelta(Offset newDelta) {
    final newDirection = getVectorFromOffset(newDelta);

    if (newDirection != direction) {
      direction = newDirection;
      widget.onDirectionChanged!(direction);
    }

    setState(() {
      delta = newDelta;
    });
  }

  Vector2 getVectorFromOffset(Offset offset) {
    if (offset.distance >= 1) {
      return Vector2(offset.dx, offset.dy);
    }
    return Vector2(0, 0);
  }

  void onDragDown(DragDownDetails d) {
    calculateDelta(d.localPosition);
  }

  void onDragUpdate(DragUpdateDetails d) {
    calculateDelta(d.localPosition);
  }

  void onDragEnd(DragEndDetails d) {
    updateDelta(Offset.zero);
  }

  void calculateDelta(Offset offset) {
    final newDelta = offset - const Offset(60, 60);
    updateDelta(
      Offset.fromDirection(
        newDelta.direction,
        min(30, newDelta.distance),
      ),
    );
  }
}
