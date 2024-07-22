import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/components/robot/wheels/billet/billet_wheel.dart';
import 'package:player_move/components/robot/wheels/griplock/griplock_wheel.dart';
import 'package:player_move/components/robot/wheels/wheel.dart';
import 'package:player_move/helpers/return_images.dart';
import 'package:player_move/pages/customization_page.dart';

class WheelSubCard extends ConsumerWidget {
  const WheelSubCard({
    super.key,
    required this.onPressedFunction,
  });

  final void Function(Wheel wheelType) onPressedFunction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {
            onPressedFunction(BilletWheel());
          },
          icon: returnImages(BilletWheel, context),
        ),
        IconButton(
          onPressed: () {
            onPressedFunction(GriplockWheel());
          },
          icon: returnImages(GriplockWheel, context),
        ),
      ],
    );
  }
}
