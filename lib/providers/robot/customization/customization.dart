import 'package:player_move/components/robot/drivetrain/drivetrain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'customization.freezed.dart';
part 'customization.g.dart';

@unfreezed
class Customization with _$Customization {
  factory Customization({
    required Drivetrain drivetrain,
  }) = _Customization;

  factory Customization.fromJson(Map<String, dynamic> json) =>
      _$CustomizationFromJson(json);
}
