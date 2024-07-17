import 'dart:developer';

import 'package:flame/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:player_move/components/robot/drivetrain/swerve/swerve_drivetrain.dart';
import 'package:player_move/components/robot/motors/neo_1.1_motor.dart';
import 'package:player_move/constants.dart';
import 'package:player_move/custom_widgets/customization_card.dart';
import 'package:player_move/main.dart';
import 'package:player_move/providers/robot/customization/robot_customization.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:player_move/providers/settings/settings_notifier.dart';

class RobotCustomizationScreen extends ConsumerStatefulWidget {
  const RobotCustomizationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      RobotCustomizationState();
}

class RobotCustomizationState extends ConsumerState<RobotCustomizationScreen> {
  dynamic onPageChanged(int page, CarouselPageChangedReason reason) {
    HapticFeedback.selectionClick();
  }

  late List<Object> cardIndexList;

  Widget generateCards(int index) {
    Object c = cardIndexList[index].runtimeType;
    switch (c) {
      case SwerveDrivetrain:
        if (kDebugMode) {
          print("Swerve");
        }
        return CustomizationCard(
          key: const Key("Swerve Drivetrain"),
          widgetsList: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "Drivetrain",
                  style: TextStyle(
                    fontSize: TextSelectionToolbar.kHandleSize,
                    fontFamily: appFlavor,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Swerve"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Tank"),
                ),
              ],
            ),
            Divider(
              thickness: Theme.of(context).dividerTheme.thickness,
              indent: Theme.of(context).dividerTheme.indent,
              endIndent: Theme.of(context).dividerTheme.endIndent,
              color: Theme.of(context).dividerTheme.color,
              height: Theme.of(context).dividerTheme.space,
            ),
            const Text("Motors"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: returnImages(NeoMotor),
                  iconSize: Theme.of(context).buttonTheme.minWidth,
                ),
              ],
            ),
            Divider(
              thickness: Theme.of(context).dividerTheme.thickness,
              indent: Theme.of(context).dividerTheme.indent,
              endIndent: Theme.of(context).dividerTheme.endIndent,
              color: Theme.of(context).dividerTheme.color,
              height: Theme.of(context).dividerTheme.space,
            ),
            const Text("Gearing"),
            Divider(
              thickness: Theme.of(context).dividerTheme.thickness,
              indent: Theme.of(context).dividerTheme.indent,
              endIndent: Theme.of(context).dividerTheme.endIndent,
              color: Theme.of(context).dividerTheme.color,
              height: Theme.of(context).dividerTheme.space,
            ),
            const Text("Wheel")
          ],
        );
      default:
        if (kDebugMode) {
          print("defaulting ${c.toString()}");
        }
        break;
    }
    return const Placeholder();
  }

  ImageIcon returnImages(Type type) {
    switch (type) {
      case NeoMotor:
        ImageIcon image = NeoMotor.toImage();

        return image;
      default:
        return NeoMotor.toImage();
    }
  }

  @override
  Widget build(BuildContext context) {
    cardIndexList = [ref.read(robotCustomizationProvider).drivetrain];
    // final settings = ref.watch(settingsNotifierProvider);
    // final robot = ref.watch(robotProviderProvider);

    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: BackButton(
              style: const ButtonStyle(),
              onPressed: () {
                HapticFeedback.selectionClick();
                context.go('/');
              },
            ),
          ),
          CarouselSlider(
            items: List.generate(
              cardIndexList.length,
              generateCards,
            ),
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height / 1.5,
              aspectRatio: 3 / 2,
              viewportFraction: 0.4,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.5,
              onPageChanged: onPageChanged,
              scrollDirection: Axis.horizontal,
              // clipBehavior: Clip.antiAlias,
            ),
          ),
        ],
      ),
    );
  }
}
