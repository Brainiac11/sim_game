import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/custom_widgets/customization_card.dart';
import 'package:player_move/pages/cards/drivetrain/swerve.card.dart';
import 'package:player_move/pages/cards/drivetrain/tank.card.dart';
import 'package:player_move/pages/cards/shooter/fixed.card.dart';

class ShooterPage extends ConsumerStatefulWidget {
  const ShooterPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => ShooterPageState();
}

class ShooterPageState extends ConsumerState<ShooterPage> {
  Widget shooterPage = const FixedPage();

  void updateShooterPage(Widget newPage) {
    setState(() {
      shooterPage = newPage;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                updateShooterPage(const FixedPage());
              },
              child: const Text("Fixed"),
            ),
            ElevatedButton(
              onPressed: () {
                updateShooterPage(const FixedPage());
              },
              child: const Text("Pivot"),
            ),
            ElevatedButton(
              onPressed: () {
                updateShooterPage(const FixedPage());
              },
              child: const Text("Turret"),
            ),
          ],
        ),
        shooterPage,
      ],
    );
  }
}
