import 'dart:ui';

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
part 'main.g.dart';

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

@riverpod
SharedPreferences? preferences(PreferencesRef ref) {
  SharedPreferences.getInstance().then((value) {
    return value;
  });
  return null;
}

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppState();
}

class _AppState extends ConsumerState<App> {
  ThemeMode themeMode = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    ref.watch(settingsProvider).settings.isDarkMode
        ? setState(() {
            themeMode = ThemeMode.dark;
            if (kDebugMode) {
              print(themeMode);
            }
          })
        : setState(() {
            themeMode = ThemeMode.light;
            if (kDebugMode) {
              print(themeMode);
            }
          });

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Robotics Game',
      routerConfig: router,
      theme: kTheme,
      darkTheme: kTheme.copyWith(brightness: Brightness.dark),
      themeMode: themeMode,
    );
  }
}
