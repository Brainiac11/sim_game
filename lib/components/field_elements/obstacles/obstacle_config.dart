import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

class ObstacleModel {
  Shape shape;
  Filter filter;
  bool isSensor;

  /// Used for sensor identification
  Key key;

  ObstacleModel(
      {required this.shape,
      required this.filter,
      required this.isSensor,
      required this.key});
}
