import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/components/robot/subsystems/shooter/pivot/pivot_shooter.dart';
import 'package:player_move/components/robot/subsystems/shooter/shooter.dart';
import 'package:player_move/pages/cards/sub_cards/motors.sub.card.dart';
import 'package:player_move/providers/robot/customization/robot_customization.dart';

class PivotPage extends ConsumerWidget {
  static const kName = "Pivot Shooter";
  const PivotPage({
    super.key,
  });
  @override
  String toStringShort() {
    return "Pivot Shooter";
  }

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
              if (shooter.runtimeType != PivotShooter) {
                PivotShooter shooter = PivotShooter(motors: motor);
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
