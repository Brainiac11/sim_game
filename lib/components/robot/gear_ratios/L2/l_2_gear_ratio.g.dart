// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'l_2_gear_ratio.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

L2GearRatio _$L2GearRatioFromJson(Map json) => L2GearRatio()
  ..acceleration = (json['acceleration'] as num).toDouble()
  ..maxSpeed = (json['maxSpeed'] as num).toDouble()
  ..experience = (json['experience'] as num).toDouble()
  ..name = json['name'] as String;

Map<String, dynamic> _$L2GearRatioToJson(L2GearRatio instance) =>
    <String, dynamic>{
      'acceleration': instance.acceleration,
      'maxSpeed': instance.maxSpeed,
      'experience': instance.experience,
      'name': instance.name,
    };
