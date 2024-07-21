import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/consumer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:player_move/components/robot/wheels/wheel.dart';
part 'billet_wheel.g.dart';

@JsonSerializable()
class BilletWheel extends Wheel {
  BilletWheel() : super(acceleration: 11, cost: 4);

  @JsonKey(name: "name")
  final String name = "Billet";

  /// Need to update
  @override
  void updateTotalAcceleration(WidgetRef ref, dynamic provider) {
    ref.read(provider);
  }

  factory BilletWheel.fromJson(Map<String, dynamic> json) =>
      _$BilletWheelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BilletWheelToJson(this);

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
