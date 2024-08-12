// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pivot_shooter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PivotShooter _$PivotShooterFromJson(Map json) => PivotShooter(
      motors: Motor.fromJson(Map<String, dynamic>.from(json['motors'] as Map)),
    )
      ..name = json['name'] as String
      ..space = (json['space'] as num).toDouble()
      ..experience = (json['experience'] as num).toDouble()
      ..range = (json['range'] as num).toDouble();

Map<String, dynamic> _$PivotShooterToJson(PivotShooter instance) =>
    <String, dynamic>{
      'name': instance.name,
      'space': instance.space,
      'experience': instance.experience,
      'range': instance.range,
      'motors': instance.motors.toJson(),
    };
