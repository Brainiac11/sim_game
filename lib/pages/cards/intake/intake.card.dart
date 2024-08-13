import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/components/robot/subsystems/intake/intake.dart';
import 'package:player_move/components/robot/subsystems/intake/over_bumper/over_bumper.dart';
import 'package:player_move/components/robot/subsystems/intake/under_bumper/under_bumper.dart';
import 'package:player_move/custom_widgets/customization_card.dart';
import 'package:player_move/providers/robot/customization/robot_customization.dart';

class IntakePage extends ConsumerStatefulWidget {
  const IntakePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => IntakePageState();
}

class IntakePageState extends ConsumerState<IntakePage> {
  String title_intake = "Under-Bumper Intake";

  void updateTitle(String newTitle) {
    setState(() {
      title_intake = newTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomizationCard(
      widgetsList: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title_intake,
                style: const TextStyle(
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
              onPressed: () {
                Intake? intake =
                    ref.watch(robotCustomizationProvider).value?.intake;
                if (intake.runtimeType != UnderBumperIntake) {
                  UnderBumperIntake underBumper = UnderBumperIntake();
                  ref
                      .watch(robotCustomizationProvider.notifier)
                      .updateIntake(underBumper);
                } else {
                  // ref
                  //     .watch(robotCustomizationProvider.notifier)
                  //     .updateIntake(intake!..motors = motor);
                }

                updateTitle("Under-Bumper Intake");
              },
              child: const Text("Under Bumper"),
            ),
            ElevatedButton(
              onPressed: () {
                Intake? intake =
                    ref.watch(robotCustomizationProvider).value?.intake;
                if (intake.runtimeType != OverBumperIntake) {
                  OverBumperIntake overBumper = OverBumperIntake();
                  ref
                      .watch(robotCustomizationProvider.notifier)
                      .updateIntake(overBumper);
                } else {
                  // ref
                  //     .watch(robotCustomizationProvider.notifier)
                  //     .updateIntake(intake!..motors = motor);
                }
                updateTitle("Over-Bumper Intake");
              },
              child: const Text("Over Bumper"),
            ),
          ],
        ),
      ],
    );
  }
}
