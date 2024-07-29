import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/components/robot/subsystems/drivetrain/drivetrain.dart';
import 'package:player_move/components/robot/subsystems/drivetrain/swerve/swerve_drivetrain.dart';
import 'package:player_move/components/robot/gear_ratios/L2/l_2_gear_ratio.dart';
import 'package:player_move/components/robot/gear_ratios/gear_ratio.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/components/robot/wheels/billet/billet_wheel.dart';
import 'package:player_move/components/robot/wheels/wheel.dart';
import 'package:player_move/pages/cards/sub_cards/motors.sub.card.dart';
import 'package:player_move/pages/cards/sub_cards/swerve/gear_ratio.sub.dart';
import 'package:player_move/pages/cards/sub_cards/swerve/wheels.sub.card.dart';
import 'package:player_move/providers/robot/customization/robot_customization.dart';

class SwervePage extends ConsumerWidget {
  const SwervePage({
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
              if (drivetrain.runtimeType != SwerveDrivetrain) {
                SwerveDrivetrain swerve = SwerveDrivetrain(
                    motors: motor,
                    wheel: BilletWheel(),
                    gearRatio: L2GearRatio());
                ref
                    .watch(robotCustomizationProvider.notifier)
                    .updateDrivetrain(swerve);
              } else {
                ref
                    .watch(robotCustomizationProvider.notifier)
                    .updateDrivetrain(drivetrain!..motors = motor);
              }
            },
          ),
          Divider(
            thickness: Theme.of(context).dividerTheme.thickness,
            indent: Theme.of(context).dividerTheme.indent,
            endIndent: Theme.of(context).dividerTheme.endIndent,
            color: Theme.of(context).dividerTheme.color,
            height: Theme.of(context).dividerTheme.space,
          ),
          const Text("Gearing"),
          GearRatioSubCard(
            onPressedFunction: (GearRatio gearRatioType) {
              SwerveDrivetrain? swerve = ref
                  .watch(robotCustomizationProvider)
                  .value
                  ?.drivetrain as SwerveDrivetrain;
              ref
                  .watch(robotCustomizationProvider.notifier)
                  .updateDrivetrain(swerve..gearRatio = gearRatioType);
            },
          ),
          Divider(
            thickness: Theme.of(context).dividerTheme.thickness,
            indent: Theme.of(context).dividerTheme.indent,
            endIndent: Theme.of(context).dividerTheme.endIndent,
            color: Theme.of(context).dividerTheme.color,
            height: Theme.of(context).dividerTheme.space,
          ),
          const Text("Wheel"),
          WheelSubCard(
            onPressedFunction: (Wheel wheelType) async {
              SwerveDrivetrain? swerve = ref
                  .watch(robotCustomizationProvider)
                  .value
                  ?.drivetrain as SwerveDrivetrain;

              ref
                  .watch(robotCustomizationProvider.notifier)
                  .updateDrivetrain(swerve..wheel = wheelType);
            },
          ),
        ],
      ),
    );
  }
}
