
import 'package:flutter/material.dart';
import 'package:player_move/components/robot/motors/neo1.1/neo_1.1_motor.dart';
import 'package:player_move/components/robot/motors/vortex/neo_vortex_motor.dart';
import 'package:player_move/components/robot/wheels/billet/billet_wheel.dart';
import 'package:player_move/components/robot/wheels/griplock/griplock_wheel.dart';

Image returnImages(Type type, BuildContext context) {
  switch (type) {
    case NeoMotor:
      Image image = NeoMotor.toImage(context);
      return image;
    case BilletWheel:
      Image image = BilletWheel.toImage(context);
      return image;
    case VortexMotor:
      Image image = VortexMotor.toImage(context);
      return image;
    case GriplockWheel:
      Image image = GriplockWheel.toImage(context);
      return image;
    default:
      return NeoMotor.toImage(context);
  }
}
