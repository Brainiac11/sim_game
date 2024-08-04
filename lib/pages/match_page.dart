import 'package:flame/widgets.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:player_move/helpers/button.dart';
import '../helpers/joypad.dart';

import '../components/game.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  MatchPageState createState() => MatchPageState();
}

class MatchPageState extends State<MatchPage> {
  late RoboticsGame game;
  final GlobalKey<RiverpodAwareGameWidgetState> gameWidgetKey =
      GlobalKey<RiverpodAwareGameWidgetState>();
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

  void onIntakeButtonPressed() {
    game.robotIntake();
  }

  late RobotButton intakeButton;

  @override
  Widget build(BuildContext context) {
    game = RoboticsGame();
    // intakeButton = RobotButton(isActive: game.robotIntake);
    // intakeButton.updateSprite("intake_button.png");

    return Scaffold(
      // backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: Stack(
        children: [
          AspectRatio(
            aspectRatio: 3072 / 1420,
            child: RiverpodAwareGameWidget(
              game: game,
              key: gameWidgetKey,
              // backgroundBuilder: (context) => Container(
              //   decoration: const BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage("assets/images/dark_field_updated.png"),
              //       fit: BoxFit.contain,
              //     ),
              //   ),
              // ),
            ),
          ),
          // GameWidget(game: game),
          Align(
            alignment: Alignment.topLeft,
            child: BackButton(
              key: const Key("To Home"),
              style: ButtonStyle(
                iconColor: WidgetStateProperty.all(Colors.white),
              ),
              onPressed: () {
                game.onDispose();
                context.go('/');
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
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                maxRadius: 30,
                foregroundColor: Colors.blue[900]!,
                child: SpriteButton.future(
                  sprite: Sprite.load("intake_button.png"),
                  pressedSprite: Sprite.load("intake_button.png").then((value) {
                    value.paint.invertColors = true;
                    return value;
                  }),
                  onPressed: onIntakeButtonPressed,
                  width: 75,
                  height: 75,
                  label: const Text(""),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
