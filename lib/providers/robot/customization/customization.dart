import 'package:player_move/components/robot/drivetrain/drivetrain.dart';
import 'package:player_move/components/robot/motors/motor.dart';
import 'package:player_move/components/robot/wheels/wheel.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'customization.freezed.dart';

@unfreezed
abstract class Customization with _$Customization {
  factory Customization({
    required Motor drivetrainMotor,
    required Wheel drivetrainWheel,
    required Drivetrain drivetrain,
  }) = _Customization;
}
