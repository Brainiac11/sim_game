import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:player_move/main.dart';
import 'helpers/joypad.dart';

import 'game.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  MatchPageState createState() => MatchPageState();
}

class MatchPageState extends State<MatchPage> {
  RoboticsGame game = RoboticsGame();

  @override
  void activate() {
    super.activate();
    game.lifecycleStateChange(AppLifecycleState.resumed);
    if (kDebugMode) {
      print("Is game paused: ${game.paused}");
    }
  }

  @override
  void deactivate() {
    super.deactivate();
    game.lifecycleStateChange(AppLifecycleState.paused);
    if (kDebugMode) {
      print("Is game paused: ${game.paused}");
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: Stack(
        children: [
          GameWidget(game: game),
          Align(
            alignment: Alignment.topLeft,
            child: BackButton(
              key: const Key("To Home"),
              style: ButtonStyle(
                iconColor: WidgetStateProperty.all(Colors.white),
              ),
              onPressed: () {
                router.go('/');
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Joypad(
                getDirection: game.linearMovement,
                key: const Key("Translational"),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Joypad(
                getDirection: game.angularMovement,
                key: const Key("Rotational"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
