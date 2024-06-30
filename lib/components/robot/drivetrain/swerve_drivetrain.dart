import 'package:flame/components.dart';
import 'package:player_move/components/robot/drivetrain/drivetrain.dart';
import 'package:player_move/helpers/kinematics/acceleration_controller.dart';

class SwerveDrivetrain extends Drivetrain {
  SwerveDrivetrain({required this.rotational, required this.direction});

  @override
  // ignore: overridden_fields
  Vector2 direction;

  Vector2 rotational;

  /// The angle of the drivetrain relative to the screen in radians
  double screenAngle = 0;

  // arb time values
  late AccelerationController translationalAccelerationController =
      AccelerationController(
          rawVector: direction, maxSpeed: direction, accelerationTime: 0.01);

  // arb time values
  late AccelerationController rotationalAccelerationController =
      AccelerationController(
          rawVector: rotational, maxSpeed: rotational, accelerationTime: 0.005);

  @override
  void moveDrivetrain(List<Vector2> newDirections, double dt) {
    translateDrivetrain(newDirections.first);
    rotateDrivetrain(newDirections.last);
    screenAngle = rotational.screenAngle();
  }

  void translateDrivetrain(Vector2 newTranslational){
    translationalAccelerationController.rawVector = newTranslational;
    translationalAccelerationController.maxSpeed = newTranslational; // For simplicity sake we will do this for now
    translationalAccelerationController.accelerate(0);
    direction = translationalAccelerationController.currentVector;
  }

  void rotateDrivetrain(Vector2 newRotational) {
    rotationalAccelerationController.rawVector = newRotational;
    rotationalAccelerationController.maxSpeed = newRotational; // For simplicity sake we will do this for now
    rotationalAccelerationController.accelerate(0);
    rotational = rotationalAccelerationController.currentVector;
  }
}
