import 'package:freezed_annotation/freezed_annotation.dart';

part 'robot_constants.freezed.dart';
part 'robot_constants.g.dart';

@unfreezed
abstract class RobotConstants with _$RobotConstants {
  factory RobotConstants({
    required double kDensity,
    required double kFriction,
    required double kRestitution,
    required double kHalfWidth,
    required double kHalfHeight,
    required double kMaxTranslationalSpeed,
    required double kMaxAngularSpeed,
    required double kTranslationalAccelerationRate,
    required double kAngularAccelerationRate,
    required double kTranslationalDeccelerationRate,
    required double kTranslationalIdleDeccelerationRate,
    required double kAngularDeccelerationRate,
    required double kAngularIdleDeccelerationRate,
  }) = _RobotConstants;

  factory RobotConstants.fromJson(Map<String, Object?> json) =>
      _$RobotConstantsFromJson(json);
}


    // double kDensity = 1.5,
    // double kFriction = 1,
    // double kRestitution = 0.02,
    // final double kHalfWidth = 1.6 * MediaQueryData().devicePixelRatio,
    // final double kHalfHeight = 1.6 * MediaQueryData().devicePixelRatio,
    // double kTranslationalAccelerationRate = 15,
    // double kAngularAccelerationRate = 7,
    // double kTranslationalDeccelerationRate = 5,
    // double kTranslationalIdleDeccelerationRate = 0.1,
    // double kAngularDeccelerationRate = 12,
    // double kAngularIdleDeccelerationRate = 5,