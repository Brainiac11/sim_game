import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/providers/robot/robot_provider.dart';
import 'package:player_move/providers/settings/settings_notifier.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RobotCustomizationScreen extends ConsumerStatefulWidget {
  const RobotCustomizationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      RobotCustomizationState();
}

class RobotCustomizationState extends ConsumerState<RobotCustomizationScreen> {
  dynamic onPageChanged(int page, CarouselPageChangedReason reason) {
    //TODO
  }
  @override
  Widget build(BuildContext context) {
    // final settings = ref.watch(settingsNotifierProvider);
    // final robot = ref.watch(robotProviderProvider);

    return Scaffold(
      body: Column(
        children: [
          CarouselSlider(
            items: [
              Icon(Icons.abc),
              Icon(Icons.access_alarm),
              Icon(Icons.place),
              Icon(Icons.language),
            ],
            options: CarouselOptions(
              height: 100,
              aspectRatio: 3 / 2,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.1,
              onPageChanged: onPageChanged,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
