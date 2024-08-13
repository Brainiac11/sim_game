// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fixed_shooter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FixedShooter _$FixedShooterFromJson(Map json) => FixedShooter(
      motors: Motor.fromJson(Map<String, dynamic>.from(json['motors'] as Map)),
    )
      ..name = json['name'] as String
      ..space = (json['space'] as num).toDouble()
      ..experience = (json['experience'] as num).toDouble()
      ..cost = (json['cost'] as num).toDouble()
      ..range = (json['range'] as num).toDouble();

Map<String, dynamic> _$FixedShooterToJson(FixedShooter instance) =>
    <String, dynamic>{
      'name': instance.name,
      'space': instance.space,
      'experience': instance.experience,
      'cost': instance.cost,
      'range': instance.range,
      'motors': instance.motors.toJson(),
    };
