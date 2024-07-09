import 'package:flutter/material.dart';
import 'package:player_move/constants.dart';

const double kDensity = 1.5;
const double kFriction = 1;
const double kRestitution = 0.02;
final double kHalfWidth = 1.5 * const MediaQueryData().devicePixelRatio;
final double kHalfHeight = 1.5 * const MediaQueryData().devicePixelRatio;
const double kTranslationalAccelerationRate = 15;
const double kAngularAccelerationRate = 8;
const double kTranslationalDeccelerationRate = 5;
const double kTranslationalIdleDeccelerationRate = 0.1;
const double kAngularDeccelerationRate = 12;
const double kAngularIdleDeccelerationRate = 5;
