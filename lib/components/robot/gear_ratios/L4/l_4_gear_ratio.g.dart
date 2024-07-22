// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'l_4_gear_ratio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

L4GearRatio _$L4GearRatioFromJson(Map json) => L4GearRatio()
  ..acceleration = (json['acceleration'] as num).toDouble()
  ..maxSpeed = (json['maxSpeed'] as num).toDouble()
  ..experience = (json['experience'] as num).toDouble()
  ..name = json['name'] as String;

Map<String, dynamic> _$L4GearRatioToJson(L4GearRatio instance) =>
    <String, dynamic>{
      'acceleration': instance.acceleration,
      'maxSpeed': instance.maxSpeed,
      'experience': instance.experience,
      'name': instance.name,
    };
