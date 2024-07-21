// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neo_1.1_motor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NeoMotor _$NeoMotorFromJson(Map<String, dynamic> json) => NeoMotor()
  ..acceleration = (json['acceleration'] as num).toDouble()
  ..maximumSpeed = (json['maximumSpeed'] as num).toDouble()
  ..cost = (json['cost'] as num).toDouble();

Map<String, dynamic> _$NeoMotorToJson(NeoMotor instance) => <String, dynamic>{
      'acceleration': instance.acceleration,
      'maximumSpeed': instance.maximumSpeed,
      'cost': instance.cost,
    };
