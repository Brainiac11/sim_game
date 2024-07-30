import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/components/robot/motors/falcon/falcon_motor.dart';
import 'package:player_move/components/robot/motors/kraken/kraken_motor.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/components/robot/motors/neo1.1/neo_1.1_motor.dart';
import 'package:player_move/components/robot/motors/vortex/neo_vortex_motor.dart';
import 'package:player_move/helpers/return_images.dart';
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
          isSelected: ref.watch(robotCustomizationProvider).hasValue
              ? ref
                      .watch(robotCustomizationProvider)
                      .value
                      ?.drivetrain
                      .motors
                      .runtimeType ==
                  NeoMotor
              : true,
          disabledColor: Colors.black38,
          // iconSize: Theme.of(context).buttonTheme.minWidth,
        ),
        IconButton(
          onPressed: () {
            onPressedFunction(VortexMotor());
          },
          icon: returnImages(VortexMotor, context),
          padding: const EdgeInsets.all(0),
          style: Theme.of(context).iconButtonTheme.style,
          isSelected: ref.watch(robotCustomizationProvider).isLoading
              ? false
              : ref
                      .read(robotCustomizationProvider)
                      .value
                      ?.drivetrain
                      .motors
                      .runtimeType ==
                  VortexMotor,
          disabledColor: Colors.black38,
          // iconSize: Theme.of(context).buttonTheme.minWidth,
        ),
        IconButton(
          onPressed: () {
            onPressedFunction(FalconMotor());
          },
          icon: returnImages(FalconMotor, context),
          padding: const EdgeInsets.all(0),
          style: Theme.of(context).iconButtonTheme.style,
          isSelected: ref.watch(robotCustomizationProvider).isLoading
              ? false
              : ref
                      .watch(robotCustomizationProvider)
                      .value
                      ?.drivetrain
                      .motors
                      .runtimeType ==
                  FalconMotor,
          disabledColor: Colors.black38,
          // iconSize: Theme.of(context).buttonTheme.minWidth,
        ),
        IconButton(
          onPressed: () {
            onPressedFunction(KrakenMotor());
          },
          icon: returnImages(KrakenMotor, context),
          padding: const EdgeInsets.all(0),
          style: Theme.of(context).iconButtonTheme.style,
          isSelected: ref.watch(robotCustomizationProvider).isLoading
              ? false
              : ref
                      .watch(robotCustomizationProvider)
                      .value
                      ?.drivetrain
                      .motors
                      .runtimeType ==
                  KrakenMotor,
          disabledColor: Colors.black38,
          // iconSize: Theme.of(context).buttonTheme.minWidth,
        ),
      ],
    );
  }
}
