import 'package:flame/game.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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

  @override
  Widget build(BuildContext context) {
    game = RoboticsGame();

    return Scaffold(
      // backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: Stack(
        children: [
          RiverpodAwareGameWidget(
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
          )
        ],
      ),
    );
  }
}
