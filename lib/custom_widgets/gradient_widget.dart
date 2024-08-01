import 'package:animate_gradient/animate_gradient.dart';
import 'package:flutter/material.dart';

class GradientWidget extends StatefulWidget {
  const GradientWidget({super.key});
  final String name = "info_gradient";

  @override
  State<StatefulWidget> createState() => GradientWidgetState();
}

class GradientWidgetState extends State<GradientWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimateGradient(
      primaryColors: const [
        Colors.pink,
        Colors.pinkAccent,
        Colors.white,
      ],
      secondaryColors: const [
        Colors.blue,
        Colors.blueAccent,
        Colors.white,
      ],
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}
