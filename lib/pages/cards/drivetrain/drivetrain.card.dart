import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/components/robot/drivetrain/drivetrain.dart';
import 'package:player_move/custom_widgets/customization_card.dart';
import 'package:player_move/pages/cards/drivetrain/swerve.card.dart';

class DrivetrainPage extends ConsumerStatefulWidget {
  const DrivetrainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => DrivetrainPageState();
}

class DrivetrainPageState extends ConsumerState<DrivetrainPage> {
  late Widget drivetrainPage;

  void updateDrivetrainPage(Widget newPage) {
    setState(() {
      drivetrainPage = newPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    drivetrainPage = const SwervePage();
    return CustomizationCard(
      widgetsList: [
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
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
              onPressed: () {
                updateDrivetrainPage(const SwervePage());
              },
              child: const Text("Swerve"),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Tank"),
            ),
          ],
        ),
        drivetrainPage,
      ],
    );
  }
}
