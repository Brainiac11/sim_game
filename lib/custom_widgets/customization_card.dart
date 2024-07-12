import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomizationCard extends ConsumerStatefulWidget {
  const CustomizationCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      CustomizationCardState();
}

class CustomizationCardState extends ConsumerState<CustomizationCard> {
  @override
  Widget build(BuildContext context) {
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
                Icon(Icons.wheelchair_pickup),
              ],
            )
          ],
        ),
      ),
    );
  }
}
