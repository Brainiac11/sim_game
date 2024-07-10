// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Customization {
  Drivetrain get drivetrain => throw _privateConstructorUsedError;
  set drivetrain(Drivetrain value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomizationCopyWith<Customization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomizationCopyWith<$Res> {
  factory $CustomizationCopyWith(
          Customization value, $Res Function(Customization) then) =
      _$CustomizationCopyWithImpl<$Res, Customization>;
  @useResult
  $Res call({Drivetrain drivetrain});
}

/// @nodoc
class _$CustomizationCopyWithImpl<$Res, $Val extends Customization>
    implements $CustomizationCopyWith<$Res> {
  _$CustomizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drivetrain = null,
  }) {
    return _then(_value.copyWith(
      drivetrain: null == drivetrain
          ? _value.drivetrain
          : drivetrain // ignore: cast_nullable_to_non_nullable
              as Drivetrain,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomizationImplCopyWith<$Res>
    implements $CustomizationCopyWith<$Res> {
  factory _$$CustomizationImplCopyWith(
          _$CustomizationImpl value, $Res Function(_$CustomizationImpl) then) =
      __$$CustomizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Drivetrain drivetrain});
}

/// @nodoc
class __$$CustomizationImplCopyWithImpl<$Res>
    extends _$CustomizationCopyWithImpl<$Res, _$CustomizationImpl>
    implements _$$CustomizationImplCopyWith<$Res> {
  __$$CustomizationImplCopyWithImpl(
      _$CustomizationImpl _value, $Res Function(_$CustomizationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? drivetrain = null,
  }) {
    return _then(_$CustomizationImpl(
      drivetrain: null == drivetrain
          ? _value.drivetrain
          : drivetrain // ignore: cast_nullable_to_non_nullable
              as Drivetrain,
    ));
  }
}

/// @nodoc

class _$CustomizationImpl implements _Customization {
  _$CustomizationImpl({required this.drivetrain});

  @override
  Drivetrain drivetrain;

  @override
  String toString() {
    return 'Customization(drivetrain: $drivetrain)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomizationImplCopyWith<_$CustomizationImpl> get copyWith =>
      __$$CustomizationImplCopyWithImpl<_$CustomizationImpl>(this, _$identity);
}

abstract class _Customization implements Customization {
  factory _Customization({required Drivetrain drivetrain}) =
      _$CustomizationImpl;

  @override
  Drivetrain get drivetrain;
  set drivetrain(Drivetrain value);
  @override
  @JsonKey(ignore: true)
  _$$CustomizationImplCopyWith<_$CustomizationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
