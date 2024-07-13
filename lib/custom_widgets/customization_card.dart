import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/components/robot/drivetrain/swerve/swerve_drivetrain.dart';
import 'package:player_move/providers/robot/customization/robot_customization.dart';

class CustomizationCard extends ConsumerStatefulWidget {
  const CustomizationCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      CustomizationCardState();
}

class CustomizationCardState extends ConsumerState<CustomizationCard> {
  @override
  Widget build(BuildContext context) {
    final custom = ref.watch(robotCustomizationProvider);
    if (custom.drivetrain.runtimeType == SwerveDrivetrain) {
      Image motorImage = custom.drivetrain.motors.toImage();
      return SizedBox.expand(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          position: DecorationPosition.background,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.wheelchair_pickup),
                  Icon(Icons.wheelchair_pickup),
                  Icon(Icons.wheelchair_pickup),
                  IconButton(
                    constraints:
                        BoxConstraints.tight(MediaQuery.of(context).size / 7),
                    // width: MediaQuery.of(context).size.width / 20,
                    onPressed: () {},
                    icon: motorImage,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return SizedBox.expand(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          position: DecorationPosition.background,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.wheelchair_pickup),
                  Icon(Icons.wheelchair_pickup),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}
