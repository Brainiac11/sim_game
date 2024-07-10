import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

abstract class Motor {
  final double acceleration;
  final double maximumSpeed;
  final double cost;

  /// Optional for now, will integrate down the line
  final double energy = 0;

  const Motor({
    required this.acceleration,
    required this.maximumSpeed,
    required this.cost,
  });

  @mustBeOverridden
  void updateTotalAcceleration(WidgetRef ref, Provider provider) {}

  @mustBeOverridden
  void updateTotalMaxSpeed(WidgetRef ref, Provider provider) {}

  /// Will integrate later
  void updateTotalCost(WidgetRef ref, Provider provider) {}
}
