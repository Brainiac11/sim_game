import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/components/robot/drivetrain/swerve/swerve_drivetrain.dart';
import 'package:player_move/components/robot/gear_ratios/l_2_gear_ratio.dart';
import 'package:player_move/components/robot/gear_ratios/l_3_gear_ratio.dart';
import 'package:player_move/components/robot/gear_ratios/l_4_gear_ratio.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/components/robot/wheels/billet_wheel.dart';
import 'package:player_move/components/robot/wheels/wheel.dart';
import 'package:player_move/custom_widgets/customization_card.dart';
import 'package:player_move/pages/cards/sub_cards/motors.sub.card.dart';
import 'package:player_move/pages/cards/sub_cards/wheels.sub.card.dart';
import 'package:player_move/pages/cards/swerve.card.dart';
import 'package:player_move/pages/customization_page.dart';
import 'package:player_move/providers/robot/customization/robot_customization.dart';

class SwervePage extends ConsumerWidget {
  const SwervePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomizationCard(
      key: const Key("Swerve Drivetrain"),
      widgetsList: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Drivetrain",
                style: TextStyle(
                  fontSize: TextSelectionToolbar.kHandleSize,
                  fontFamily: appFlavor,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("Swerve"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Tank"),
            ),
          ],
        ),
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
            SwerveDrivetrain swerve = ref
                .read(robotCustomizationProvider)
                .drivetrain as SwerveDrivetrain;
            swerve.motors = motor;
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              style: Theme.of(context).textButtonTheme.style,
              onPressed: () {
                SwerveDrivetrain swerve = ref
                    .read(robotCustomizationProvider)
                    .drivetrain as SwerveDrivetrain;
                swerve.gearRatio = L2GearRatio();
                ref
                    .read(robotCustomizationProvider.notifier)
                    .updateDrivetrain(swerve);
              },
              child: Text(L2GearRatio().toString()),
            ),
            TextButton(
              style: Theme.of(context).textButtonTheme.style,
              onPressed: () {
                SwerveDrivetrain swerve = ref
                    .read(robotCustomizationProvider)
                    .drivetrain as SwerveDrivetrain;
                swerve.gearRatio = L3GearRatio();
                ref
                    .read(robotCustomizationProvider.notifier)
                    .updateDrivetrain(swerve);
              },
              child: Text(L3GearRatio().toString()),
            ),
            TextButton(
              style: Theme.of(context).textButtonTheme.style,
              onPressed: () {
                SwerveDrivetrain swerve = ref
                    .read(robotCustomizationProvider)
                    .drivetrain as SwerveDrivetrain;
                // swerve.gearRatio = L4GearRatio();
                ref
                    .read(robotCustomizationProvider.notifier)
                    .updateDrivetrain(swerve..gearRatio = L4GearRatio());

                if (kDebugMode) {
                  print("WOW" + swerve.gearRatio.toString());
                }
              },
              child: Text(L4GearRatio().toString()),
            ),
          ],
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
          onPressedFunction: (Wheel wheelType) {
            SwerveDrivetrain swerve = ref
                .read(robotCustomizationProvider)
                .drivetrain as SwerveDrivetrain;
            swerve.wheel = wheelType;
          },
        ),
      ],
    );
  }
}
