import 'package:flutter_riverpod/src/consumer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/wheels/wheel.dart';

class BilletWheel extends Wheel {
  BilletWheel() : super(acceleration: 11, cost: 4);

  /// Need to update
  @override
  void updateTotalAcceleration(WidgetRef ref, dynamic provider) {
    ref.read(provider);
  }

  @override
  String toString() {
    return "Billet";
  }
}