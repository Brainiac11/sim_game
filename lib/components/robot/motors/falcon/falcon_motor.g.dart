// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'falcon_motor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FalconMotor _$FalconMotorFromJson(Map<String, dynamic> json) => FalconMotor()
  ..acceleration = (json['acceleration'] as num).toDouble()
  ..maximumSpeed = (json['maximumSpeed'] as num).toDouble()
  ..cost = (json['cost'] as num).toDouble()
  ..name = json['name'] as String;

Map<String, dynamic> _$FalconMotorToJson(FalconMotor instance) =>
    <String, dynamic>{
      'acceleration': instance.acceleration,
      'maximumSpeed': instance.maximumSpeed,
      'cost': instance.cost,
      'name': instance.name,
    };
