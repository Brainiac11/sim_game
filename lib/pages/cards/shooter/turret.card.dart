import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/components/robot/subsystems/drivetrain/drivetrain.dart';
import 'package:player_move/components/robot/subsystems/drivetrain/tank/tank_drivetrain.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/components/robot/subsystems/shooter/fixed/fixed_shooter.dart';
import 'package:player_move/components/robot/subsystems/shooter/pivot/pivot_shooter.dart';
import 'package:player_move/components/robot/subsystems/shooter/shooter.dart';
import 'package:player_move/components/robot/subsystems/shooter/turret/turret_shooter.dart';
import 'package:player_move/pages/cards/sub_cards/motors.sub.card.dart';
import 'package:player_move/providers/robot/customization/robot_customization.dart';

class TurretPage extends ConsumerWidget {
  static const kName = "Turret Shooter";
  const TurretPage({
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
              Shooter? shooter =
                  ref.watch(robotCustomizationProvider).value?.shooter;
              if (shooter.runtimeType != TurretShooter) {
                TurretShooter shooter = TurretShooter(motors: motor);
                ref
                    .watch(robotCustomizationProvider.notifier)
                    .updateShooter(shooter);
              } else {
                ref
                    .watch(robotCustomizationProvider.notifier)
                    .updateShooter(shooter!..motors = motor);
              }
            },
          ),
        ],
      ),
    );
  }
}
