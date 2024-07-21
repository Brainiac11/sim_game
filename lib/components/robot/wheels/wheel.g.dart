// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wheel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wheel _$WheelFromJson(Map<String, dynamic> json) => Wheel(
      acceleration: (json['acceleration'] as num).toDouble(),
      cost: (json['cost'] as num).toDouble(),
    );

Map<String, dynamic> _$WheelToJson(Wheel instance) => <String, dynamic>{
      'acceleration': instance.acceleration,
      'cost': instance.cost,
    };
