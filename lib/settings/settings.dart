import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Settings {
  final bool infiniteMode;
  final bool haptics;

  Settings({
    this.infiniteMode = false,
    this.haptics = false,
  });

  Settings copy({
    bool? infiniteMode,
    bool? haptics,
  }) =>
      Settings(
        infiniteMode: infiniteMode ?? this.infiniteMode,
        haptics: haptics ?? this.haptics,
      );
}
