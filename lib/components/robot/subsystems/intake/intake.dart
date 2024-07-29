import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
abstract class Intake extends SpriteComponent {
  String name;
  Intake({required this.name});

  @mustBeOverridden
  void whenActive();

  @mustBeOverridden
  void whenInactive();

  @override
  @mustBeOverridden
  FutureOr<void> onLoad();

  @override
  @mustBeOverridden
  FutureOr<void> onMount();
}
