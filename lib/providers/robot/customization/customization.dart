import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'customization.freezed.dart';

@unfreezed
abstract class Customization with _$Customization {
  factory Customization({
    required bool underBumperIntake,
  }) = _Customization;
}
