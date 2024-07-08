import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:player_move/constants.dart';
import 'package:player_move/pages/home_page.dart';
import 'package:player_move/pages/match_page.dart';
import 'package:player_move/pages/settings_page.dart';
import 'package:player_move/providers/settings/settings.dart';
import 'package:player_move/providers/settings/settings_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: "Match Page",
      path: '/match',
      builder: (BuildContext context, GoRouterState state) {
        return const MatchPage();
      },
    ),
    GoRoute(
      name: "Home Page",
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      name: "Settings",
      path: '/settings',
      builder: (BuildContext context, GoRouterState state) {
        return const SettingsPage();
      },
    ),
  ],
);

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsNotifierProvider);
    final notifier = ref.read(settingsNotifierProvider.notifier);
    // notifier.build();
    if (kDebugMode) {
      print(settings.themeMode.toString());
    }
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Robotics Games',
      routerConfig: router,
      // theme: kTheme,
      theme: kTheme.copyWith(brightness: Brightness.dark),
      // themeMode: settings.themeMode,
    );
  }
}
