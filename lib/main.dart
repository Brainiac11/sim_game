import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:json_theme/json_theme.dart';
import 'package:player_move/pages/customization_page.dart';
import 'package:player_move/pages/home_page.dart';
import 'package:player_move/pages/match_page.dart';
import 'package:player_move/pages/settings_page.dart';
import 'package:player_move/providers/settings/settings_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var themeStr =
      await rootBundle.loadString('assets/appainter_theme_light.json');
  var themeJson = jsonDecode(themeStr);
  final themeLight = ThemeDecoder.decodeThemeData(themeJson)!;
  themeStr = await rootBundle.loadString('assets/appainter_theme_dark.json');
  themeJson = jsonDecode(themeStr);
  final themeDark = ThemeDecoder.decodeThemeData(themeJson)!;
  runApp(
    ProviderScope(
      child: App(
        themeData: themeLight,
        darkThemeData: themeDark,
      ),
    ),
  );
}

// late final GoRouter router;

class App extends ConsumerWidget {
  final ThemeData themeData;
  final ThemeData darkThemeData;
  App({super.key, required this.themeData, required this.darkThemeData});
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
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: true,
      title: 'Robotics Games',
      theme: themeData,
      darkTheme: darkThemeData,
      themeMode: settings.themeMode,
      routerConfig: router,
    );
  }
}
