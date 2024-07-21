// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swerve_drivetrain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwerveDrivetrain _$SwerveDrivetrainFromJson(Map<String, dynamic> json) =>
    SwerveDrivetrain(
      motors: Motor.fromJson(json['motors'] as Map<String, dynamic>),
      wheel: Wheel.fromJson(json['wheel'] as Map<String, dynamic>),
      gearRatio: GearRatio.fromJson(json['gearRatio'] as Map<String, dynamic>),
    )..name = json['name'] as String;

Map<String, dynamic> _$SwerveDrivetrainToJson(SwerveDrivetrain instance) =>
    <String, dynamic>{
      'motors': instance.motors,
      'name': instance.name,
      'wheel': instance.wheel,
      'gearRatio': instance.gearRatio,
    };
