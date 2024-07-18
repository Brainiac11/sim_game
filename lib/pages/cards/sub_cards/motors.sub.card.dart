import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/components/robot/motors/neo_1.1_motor.dart';
import 'package:player_move/pages/customization_page.dart';
import 'package:player_move/providers/robot/customization/robot_customization.dart';

class MotorSubCard extends ConsumerWidget {
  const MotorSubCard({
    super.key,
    required this.onPressedFunction,
  });

  final void Function(Motor motorType) onPressedFunction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            onPressedFunction(NeoMotor());
          },
          icon: returnImages(NeoMotor, context),
          padding: const EdgeInsets.all(0),
          style: Theme.of(context).iconButtonTheme.style,
          isSelected: ref
                  .read(robotCustomizationProvider)
                  .drivetrain
                  .motors
                  .runtimeType ==
              NeoMotor,
          disabledColor: Colors.black38,
          // iconSize: Theme.of(context).buttonTheme.minWidth,
        ),
      ],
    );
  }
}
