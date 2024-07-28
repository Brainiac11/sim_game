import 'package:flutter/cupertino.dart';
import 'package:player_move/components/robot/constants/robot_constants.dart';
import 'package:player_move/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'robot_provider.g.dart';

@riverpod
class RobotProvider extends _$RobotProvider {
  @override
  RobotConstants build() {
    return RobotConstants(
      // kDensity: 1.5,
      // kFriction: 1,
      // kRestitution: 0.02,
      // kHalfWidth: 1.6 * const MediaQueryData().devicePixelRatio,
      // kHalfHeight: 1.6 * const MediaQueryData().devicePixelRatio,
      // kMaxTranslationalSpeed: 40.0,
      // kMaxAngularSpeed: 8.0,
      // kTranslationalAccelerationRate: 15,
      // kAngularAccelerationRate: 7,
      // kTranslationalDeccelerationRate: 5,
      // kTranslationalIdleDeccelerationRate: 0.01,
      // kAngularDeccelerationRate: 12,
      // kAngularIdleDeccelerationRate: 5,
      kDensity: 1.5,
      kFriction: 0.5,
      kRestitution: 0.02,
      kMultiplier: 1.0,
      // kHalfWidth: (1556 / 3840) * 1.6,
      // kHalfHeight: (1556 / 3840) * 1.6,
      // kHalfWidth: kWorldSize.x / 50,
      // kHalfHeight: kWorldSize.x / 50,
      kHalfWidth: kWorldSize.x / 48 * const MediaQueryData().devicePixelRatio,
      kHalfHeight: kWorldSize.x * const MediaQueryData().devicePixelRatio / 48,
      kMaxTranslationalSpeed: 0,
      kMaxAngularSpeed: 0,
      kTranslationalAccelerationRate: 0,
      kAngularAccelerationRate: 0,
      kTranslationalDeccelerationRate: 0,
      kTranslationalIdleDeccelerationRate: 0,
      kAngularDeccelerationRate: 0,
      kAngularIdleDeccelerationRate: 0,
    );
  }

  void updateConstants(RobotConstants newConstants) {
    state = newConstants;
  }

  void clear() {
    state = state.copyWith(
      kMaxTranslationalSpeed: 0,
      kMaxAngularSpeed: 0,
      kTranslationalAccelerationRate: 0,
      kAngularAccelerationRate: 0,
      kTranslationalDeccelerationRate: 0,
      kTranslationalIdleDeccelerationRate: 0,
      kAngularDeccelerationRate: 0,
      kAngularIdleDeccelerationRate: 0,
      kDensity: 1.5,
      kFriction: 1,
      kRestitution: 0.02,
      kMultiplier: 0.0,
      kHalfWidth: kWorldSize.x / 48 / const MediaQueryData().devicePixelRatio,
      kHalfHeight: kWorldSize.y * const MediaQueryData().devicePixelRatio / 48,
      // kHalfWidth: 1.6 * const MediaQueryData().devicePixelRatio,
      // kHalfHeight: 1.6 * const MediaQueryData().devicePixelRatio,
    );
  }
}
