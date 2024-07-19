// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'motor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Motor _$MotorFromJson(Map<String, dynamic> json) => Motor(
      acceleration: (json['acceleration'] as num).toDouble(),
      maximumSpeed: (json['maximumSpeed'] as num).toDouble(),
      cost: (json['cost'] as num).toDouble(),
    );

Map<String, dynamic> _$MotorToJson(Motor instance) => <String, dynamic>{
      'acceleration': instance.acceleration,
      'maximumSpeed': instance.maximumSpeed,
      'cost': instance.cost,
    };
