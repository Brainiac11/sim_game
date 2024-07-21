// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_vortex_motor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VortexMotor _$VortexMotorFromJson(Map<String, dynamic> json) => VortexMotor()
  ..acceleration = (json['acceleration'] as num).toDouble()
  ..maximumSpeed = (json['maximumSpeed'] as num).toDouble()
  ..cost = (json['cost'] as num).toDouble();

Map<String, dynamic> _$VortexMotorToJson(VortexMotor instance) =>
    <String, dynamic>{
      'acceleration': instance.acceleration,
      'maximumSpeed': instance.maximumSpeed,
      'cost': instance.cost,
    };
