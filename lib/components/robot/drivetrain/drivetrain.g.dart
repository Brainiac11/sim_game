// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drivetrain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drivetrain _$DrivetrainFromJson(Map<String, dynamic> json) => Drivetrain(
      motors: Motor.fromJson(json['motors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DrivetrainToJson(Drivetrain instance) =>
    <String, dynamic>{
      'motors': instance.motors.toJson(),
    };
