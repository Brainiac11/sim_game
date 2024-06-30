import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'helpers/joypad.dart';

import 'game.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  MainGameState createState() => MainGameState();
}

class MainGameState extends State<MatchPage> {
  RoboticsGame game = RoboticsGame();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        body: Stack(
          children: [
            GameWidget(game: game),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Joypad(
                  // onDirectionChanged: game.onJoyPadDirectionChanged,
                  key: const Key("Translational"),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Joypad(
                  // onDirectionChanged: game.onJoyPadRotationChanged,
                  key: const Key("Rotational"),
                ),
              ),
            )
          ],
        ));
  }
}
