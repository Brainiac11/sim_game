import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/image.dart';
import 'package:flutter_riverpod/src/consumer.dart';
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

  static Image toImage(BuildContext context) {
    return Image.asset(
      "assets/images/billet_wheel.png",
      height: MediaQuery.of(context).size.shortestSide / 7,
      width: MediaQuery.of(context).size.shortestSide / 7,
    );
  }

  @override
  void updateTotalCost(WidgetRef ref, constants) {
    // TODO: implement updateTotalCost
  }
}
