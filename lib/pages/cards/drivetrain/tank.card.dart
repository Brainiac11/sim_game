import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/components/robot/subsystems/drivetrain/drivetrain.dart';
import 'package:player_move/components/robot/subsystems/drivetrain/tank/tank_drivetrain.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/pages/cards/sub_cards/motors.sub.card.dart';
import 'package:player_move/providers/robot/customization/robot_customization.dart';

class TankPage extends ConsumerWidget {
  const TankPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        children: [
          Divider(
            thickness: Theme.of(context).dividerTheme.thickness,
            indent: Theme.of(context).dividerTheme.indent,
            endIndent: Theme.of(context).dividerTheme.endIndent,
            color: Theme.of(context).dividerTheme.color,
            height: Theme.of(context).dividerTheme.space,
          ),
          const Text("Motors"),
          MotorSubCard(
            onPressedFunction: (Motor motor) {
              Drivetrain? drivetrain =
                  ref.watch(robotCustomizationProvider).value?.drivetrain;
              if (drivetrain.runtimeType != TankDrivetrain) {
                TankDrivetrain tank = TankDrivetrain(motors: motor);
                ref
                    .watch(robotCustomizationProvider.notifier)
                    .updateDrivetrain(tank);
              } else {
                ref
                    .watch(robotCustomizationProvider.notifier)
                    .updateDrivetrain(drivetrain!..motors = motor);
              }
            },
          ),
        ],
      ),
    );
  }
}
