import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/main.dart';
import 'package:player_move/providers/settings/settings_notifier.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  void goToSettings() {
    if (kDebugMode) {
      print("Going to Settings");
    }
    router.go("/settings");
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      ref.watch(settingsNotifierProvider);
    });
    return Scaffold(
      appBar: AppBar(
        leading: TextButton.icon(
          onPressed: goToSettings,
          label: const Icon(
            Icons.settings,
          ),
        ),
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Home"),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                if (kDebugMode) {
                  print("Hello");
                }
                router.go('/match');
                super.deactivate();
              },
              child: const Text("Go to Game"),
            ),
          ],
        ),
      ),
    );
  }
}
