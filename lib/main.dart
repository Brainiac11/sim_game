import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:player_move/game.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GameWidget(game: RoboticsGame()));
  // runApp(const App());
}

// final GoRouter router = GoRouter(
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/',
//       builder: (BuildContext context, GoRouterState state) {
//         return RoboticsGame();
//       },
//     )
//   ],
// );

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Robotics Game',
      // routerConfig: router,
    );
  }
}
