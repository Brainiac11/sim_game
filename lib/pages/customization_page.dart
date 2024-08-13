import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:player_move/components/robot/subsystems/drivetrain/drivetrain.dart';
import 'package:player_move/components/robot/subsystems/drivetrain/swerve/swerve_drivetrain.dart';
import 'package:player_move/components/robot/gear_ratios/L2/l_2_gear_ratio.dart';
import 'package:player_move/components/robot/motors/neo1.1/neo_1.1_motor.dart';
import 'package:player_move/components/robot/subsystems/drivetrain/tank/tank_drivetrain.dart';
import 'package:player_move/components/robot/subsystems/intake/intake.dart';
import 'package:player_move/components/robot/subsystems/intake/over_bumper/over_bumper.dart';
import 'package:player_move/components/robot/subsystems/intake/under_bumper/under_bumper.dart';
import 'package:player_move/components/robot/subsystems/shooter/fixed/fixed_shooter.dart';
import 'package:player_move/components/robot/subsystems/shooter/shooter.dart';
import 'package:player_move/components/robot/wheels/billet/billet_wheel.dart';
import 'package:player_move/pages/cards/drivetrain/drivetrain.card.dart';
import 'package:player_move/pages/cards/intake/intake.card.dart';
import 'package:player_move/pages/cards/shooter/shooter.card.dart';
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
      case const (SwerveDrivetrain):
        if (kDebugMode) {
          print("Swerve");
        }

        return const DrivetrainPage();
      case const (TankDrivetrain):
        if (kDebugMode) {
          print("Tank");
        }

        return const DrivetrainPage();
      case const (UnderBumperIntake):
        return const IntakePage();
      case const (OverBumperIntake):
        return const IntakePage();
      case const (FixedShooter):
        return const ShooterPage();
      default:
        if (kDebugMode) {
          print("defaulting ${c.toString()}");
        }
        break;
    }
    return const Placeholder();
  }

  @override
  Widget build(BuildContext context) {
    Drivetrain? dt;
    Intake? ik;
    Shooter? st;
    ref.watch(robotCustomizationProvider.future).then((value) {
      dt = value.drivetrain;
      ik = value.intake;
      st = value.shooter;
    });
    cardIndexList = [
      dt ??
          SwerveDrivetrain(
            motors: NeoMotor(),
            wheel: BilletWheel(),
            gearRatio: L2GearRatio(),
          ),
      ik ?? UnderBumperIntake(),
      st ?? FixedShooter(motors: NeoMotor()),
    ];
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
              height: MediaQuery.of(context).size.height / 1.2,
              aspectRatio: 16 / 9,
              viewportFraction: 0.5,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
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
