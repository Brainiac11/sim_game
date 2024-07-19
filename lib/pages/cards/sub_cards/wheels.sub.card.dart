import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/components/robot/drivetrain/swerve/swerve_drivetrain.dart';
import 'package:player_move/components/robot/wheels/billet_wheel.dart';
import 'package:player_move/components/robot/wheels/wheel.dart';
import 'package:player_move/pages/customization_page.dart';
import 'package:player_move/providers/robot/customization/robot_customization.dart';

class WheelSubCard extends ConsumerWidget {
  const WheelSubCard({
    super.key,
    required this.onPressedFunction,
  });

  final void Function(Wheel wheelType) onPressedFunction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            onPressedFunction(BilletWheel());
          },
          icon: returnImages(BilletWheel, context),
          // iconSize: Theme.of(context).buttonTheme.minWidth,
        ),
      ],
    );
  }
}
