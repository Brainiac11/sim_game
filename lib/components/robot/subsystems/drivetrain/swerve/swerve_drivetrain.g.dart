// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swerve_drivetrain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwerveDrivetrain _$SwerveDrivetrainFromJson(Map json) => SwerveDrivetrain(
      motors: Motor.fromJson(Map<String, dynamic>.from(json['motors'] as Map)),
      wheel: Wheel.fromJson(Map<String, dynamic>.from(json['wheel'] as Map)),
      gearRatio: GearRatio.fromJson(
          Map<String, dynamic>.from(json['gearRatio'] as Map)),
    )
      ..name = json['name'] as String
      ..experience = (json['experience'] as num).toDouble();

Map<String, dynamic> _$SwerveDrivetrainToJson(SwerveDrivetrain instance) =>
    <String, dynamic>{
      'motors': instance.motors.toJson(),
      'name': instance.name,
      'experience': instance.experience,
      'wheel': instance.wheel.toJson(),
      'gearRatio': instance.gearRatio.toJson(),
    };
