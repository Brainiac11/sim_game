import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/components/robot/drivetrain/swerve_drivetrain.dart';
import 'package:player_move/custom_widgets/customization_card.dart';
import 'package:player_move/main.dart';
import 'package:player_move/providers/robot/customization/robot_customization.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
        print("Swerve");
        return const CustomizationCard(key: Key("SwerveDrivetrain"));
      default:
        print("defaulting ${c.toString()}");
        break;
    }
    return const Placeholder();
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
                router.go('/');
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
