import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:json_theme/json_theme.dart';
import 'package:player_move/constants.dart';
import 'package:player_move/pages/customization_page.dart';
import 'package:player_move/pages/home_page.dart';
import 'package:player_move/pages/match_page.dart';
import 'package:player_move/pages/settings_page.dart';
import 'package:player_move/providers/settings/settings_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;
  runApp(
    ProviderScope(
      child: App(
        themeData: theme,
      ),
    ),
  );
}

// late final GoRouter router;

class App extends ConsumerWidget {
  final ThemeData themeData;
  App({super.key, required this.themeData});
  GoRouter router = GoRouter(
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
        name: "Customization",
        path: '/customization',
        builder: (BuildContext context, GoRouterState state) {
          return const RobotCustomizationScreen();
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
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsNotifierProvider);
    final notifier = ref.read(settingsNotifierProvider.notifier);
    // notifier.build();
    if (kDebugMode) {
      print(themeData.primaryColor.toString());
    }
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      title: 'Robotics Games',
      theme: themeData.copyWith(brightness: Brightness.dark),
      darkTheme: themeData.copyWith(brightness: Brightness.dark),
      themeMode: settings.themeMode,
      routerConfig: router,
    );
  }
}
