// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'under_bumper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnderBumperIntake _$UnderBumperIntakeFromJson(Map<String, dynamic> json) =>
    UnderBumperIntake()
      ..name = json['name'] as String
      ..space = (json['space'] as num).toDouble()
      ..experience = (json['experience'] as num).toDouble();

Map<String, dynamic> _$UnderBumperIntakeToJson(UnderBumperIntake instance) =>
    <String, dynamic>{
      'name': instance.name,
      'space': instance.space,
      'experience': instance.experience,
    };
