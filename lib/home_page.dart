import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:player_move/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  void goToSettings() {
    if (kDebugMode) {
      print("Going to Settings");
    }
  }

  @override
  Widget build(BuildContext context) {
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
              },
              child: const Text("Go to Game"),
            ),
          ],
        ),
      ),
    );
  }
}
