import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player_move/components/robot/gear_ratios/L2/l_2_gear_ratio.dart';
import 'package:player_move/components/robot/gear_ratios/L3/l_3_gear_ratio.dart';
import 'package:player_move/components/robot/gear_ratios/L4/l_4_gear_ratio.dart';
import 'package:player_move/components/robot/gear_ratios/gear_ratio.dart';

class GearRatioSubCard extends ConsumerWidget {
  const GearRatioSubCard({
    super.key,
    required this.onPressedFunction,
  });
  final void Function(GearRatio gearRatioType) onPressedFunction;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          style: Theme.of(context).textButtonTheme.style,
          onPressed: () {
            onPressedFunction(L2GearRatio());
          },
          child: Text(L2GearRatio().name),
        ),
        TextButton(
          style: Theme.of(context).textButtonTheme.style,
          onPressed: () {
            onPressedFunction(L3GearRatio());
          },
          child: Text(L3GearRatio().name),
        ),
        TextButton(
          style: Theme.of(context).textButtonTheme.style,
          onPressed: () {
            onPressedFunction(L4GearRatio());
          },
          child: Text(L4GearRatio().name),
        ),
      ],
    );
  }
}
