import 'package:flutter/material.dart';

class CustomizationCard extends StatelessWidget {
  CustomizationCard({
    super.key,
    required this.widgetsList,
  });

  final List<Widget> widgetsList;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          border: Border.all(
            width: 0,
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        position: DecorationPosition.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: widgetsList,
        ),
      ),
    );
  }
}
