import 'package:flutter/material.dart';

class CustomizationCard extends StatelessWidget {
  CustomizationCard({
    super.key,
    required this.widgetsList,
  });

  List<Widget> widgetsList;

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
          children: widgetsList,
        ),
      ),
    );
  }
}
