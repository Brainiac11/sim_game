// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomizationImpl _$$CustomizationImplFromJson(Map<String, dynamic> json) =>
    _$CustomizationImpl(
      drivetrain:
          Drivetrain.fromJson(json['drivetrain'] as Map<String, dynamic>),
      intake: Intake.fromJson(json['intake'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomizationImplToJson(_$CustomizationImpl instance) =>
    <String, dynamic>{
      'drivetrain': instance.drivetrain,
      'intake': instance.intake,
    };
