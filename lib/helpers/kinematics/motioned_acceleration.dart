import 'package:flutter/animation.dart';
import 'package:player_move/helpers/kinematics/acceleration_curve.dart';
import 'package:player_move/helpers/kinematics/motion_profiles.dart';

class MotionedAcceleration {
  MotionedAcceleration({
    required this.accelerationCurve,
    required this.decellerationCurve,
    this.motionProfile,
  });

  MotionProfiles? motionProfile;
  AccelerationCurve
      accelerationCurve; // The curve that the acceleration follows
  AccelerationCurve
      decellerationCurve; // Must have negative time to calculate deceleration;

  /// Will be Deprecated
  void updateAccelerationTypePreset(MotionProfiles newMotionProfile) {
    switch (newMotionProfile) {
      case MotionProfiles.noAcceleration:
        accelerationCurve = AccelerationCurve(
            speedRange: accelerationCurve.speedRange,
            timeRange: accelerationCurve.timeRange,
            curve: Curves.linear);
        break;
      case MotionProfiles.verySlowAcceleration:
        accelerationCurve = AccelerationCurve(
            speedRange: accelerationCurve.speedRange,
            timeRange: 3,
            curve: Curves.ease);
        break;
      case MotionProfiles.slowAcceleration:
        accelerationCurve = AccelerationCurve(
            speedRange: accelerationCurve.speedRange,
            timeRange: 2.1,
            curve: Curves.ease);
        break;
      case MotionProfiles.mediumAcceleration:
        accelerationCurve = AccelerationCurve(
            speedRange: accelerationCurve.speedRange,
            timeRange: 1.6,
            curve: Curves.ease);
        break;
      case MotionProfiles.fastAcceleration:
        accelerationCurve = AccelerationCurve(
            speedRange: accelerationCurve.speedRange,
            timeRange: 1.3,
            curve: Curves.ease);
        break;
      case MotionProfiles.veryFastAcceleration:
        accelerationCurve = AccelerationCurve(
            speedRange: accelerationCurve.speedRange,
            timeRange: .9,
            curve: Curves.ease);
        break;
      case MotionProfiles.superFastAcceleration:
        accelerationCurve = AccelerationCurve(
            speedRange: accelerationCurve.speedRange,
            timeRange: 0.7,
            curve: Curves.ease);
        break;
      case MotionProfiles.immediateAcceleration:
        accelerationCurve = AccelerationCurve(
            speedRange: accelerationCurve.speedRange,
            timeRange: 0.1,
            curve: Curves.ease);
        break;
    }
  }

  void updateMaxSpeedDynamic(double maxSpeed) {
    accelerationCurve.speedRange = maxSpeed;
    decellerationCurve.speedRange = maxSpeed;
  }

  void updateTimeRangeDynamic(double timeRange) {
    accelerationCurve.timeRange = timeRange;
    updateDeccelerationTime(timeRange);
  }

  void updateDeccelerationTime(double time) {
    if (time == 0) {
      Error();
      return;
    }
    decellerationCurve.timeRange = time / 2;
  }

  // /// dt is delta time since Vector
  // double getAcceleration(double dt){

  // }
}
