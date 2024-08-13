import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/custom_widgets/customization_card.dart';
import 'package:player_move/pages/cards/shooter/fixed.card.dart';
import 'package:player_move/pages/cards/shooter/pivot.card.dart';
import 'package:player_move/pages/cards/shooter/turret.card.dart';

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
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${shooterPage.toString().removeSuffix("Page")} Shooter",
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
                updateShooterPage(const FixedPage());
              },
              child: const Text("Fixed"),
            ),
            ElevatedButton(
              onPressed: () {
                updateShooterPage(const PivotPage());
              },
              child: const Text("Pivot"),
            ),
            ElevatedButton(
              onPressed: () {
                updateShooterPage(const TurretPage());
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
