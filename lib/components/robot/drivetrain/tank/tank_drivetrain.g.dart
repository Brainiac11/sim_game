// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tank_drivetrain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TankDrivetrain _$TankDrivetrainFromJson(Map json) => TankDrivetrain(
      motors: Motor.fromJson(Map<String, dynamic>.from(json['motors'] as Map)),
    )..name = json['name'] as String;

Map<String, dynamic> _$TankDrivetrainToJson(TankDrivetrain instance) =>
    <String, dynamic>{
      'motors': instance.motors.toJson(),
      'name': instance.name,
    };
