import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:player_move/constants.dart';
import 'package:player_move/home_page.dart';
import 'package:player_move/match_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/match',
      builder: (BuildContext context, GoRouterState state) {
        return const MatchPage();
      },
    ),
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    //GoRoute(path: '/settings', builder: (BuildContext context, GoRouterState state) { return const SettingsPage()}),
  ],
);

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
      routerConfig: router,
      theme: kTheme,
    );
  }
}
