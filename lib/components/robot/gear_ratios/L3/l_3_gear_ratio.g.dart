// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'l_3_gear_ratio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

L3GearRatio _$L3GearRatioFromJson(Map json) => L3GearRatio()
  ..acceleration = (json['acceleration'] as num).toDouble()
  ..maxSpeed = (json['maxSpeed'] as num).toDouble()
  ..experience = (json['experience'] as num).toDouble()
  ..name = json['name'] as String;

Map<String, dynamic> _$L3GearRatioToJson(L3GearRatio instance) =>
    <String, dynamic>{
      'acceleration': instance.acceleration,
      'maxSpeed': instance.maxSpeed,
      'experience': instance.experience,
      'name': instance.name,
    };
