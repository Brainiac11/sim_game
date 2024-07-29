// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'over_bumper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverBumperIntake _$OverBumperIntakeFromJson(Map json) => OverBumperIntake()
  ..name = json['name'] as String
  ..space = (json['space'] as num).toDouble()
  ..experience = (json['experience'] as num).toDouble();

Map<String, dynamic> _$OverBumperIntakeToJson(OverBumperIntake instance) =>
    <String, dynamic>{
      'name': instance.name,
      'space': instance.space,
      'experience': instance.experience,
    };
