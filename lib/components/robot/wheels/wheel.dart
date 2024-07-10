import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class Wheel {
  final double acceleration;
  final double cost;

  // will implement later
  final double endurance = 0;

  Wheel({required this.acceleration, required this.cost});

  @mustBeOverridden
  void updateTotalAcceleration(WidgetRef ref, dynamic constants) {}

  /// will implement later
  void updateTotalCost(WidgetRef ref, dynamic constants) {}

  @mustBeOverridden
  @override
  String toString() {
    return "";
  }
}
