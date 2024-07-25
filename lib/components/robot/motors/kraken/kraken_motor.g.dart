// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kraken_motor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KrakenMotor _$KrakenMotorFromJson(Map<String, dynamic> json) => KrakenMotor()
  ..acceleration = (json['acceleration'] as num).toDouble()
  ..maximumSpeed = (json['maximumSpeed'] as num).toDouble()
  ..cost = (json['cost'] as num).toDouble()
  ..name = json['name'] as String;

Map<String, dynamic> _$KrakenMotorToJson(KrakenMotor instance) =>
    <String, dynamic>{
      'acceleration': instance.acceleration,
      'maximumSpeed': instance.maximumSpeed,
      'cost': instance.cost,
      'name': instance.name,
    };
