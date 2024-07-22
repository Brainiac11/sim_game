// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'griplock_wheel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GriplockWheel _$GriplockWheelFromJson(Map<String, dynamic> json) =>
    GriplockWheel()
      ..acceleration = (json['acceleration'] as num).toDouble()
      ..cost = (json['cost'] as num).toDouble()
      ..name = json['name'] as String;

Map<String, dynamic> _$GriplockWheelToJson(GriplockWheel instance) =>
    <String, dynamic>{
      'acceleration': instance.acceleration,
      'cost': instance.cost,
      'name': instance.name,
    };
