import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:player_move/constants.dart';
import 'package:player_move/providers/settings/settings_notifier.dart';

class BorderEdge extends BodyComponent with RiverpodComponentMixin {
  BorderEdge({required this.valueKey});
  ValueKey<String> valueKey;
  late Shape shape;
  late FixtureDef fixtureDef;
  late BodyDef borderDef;

  ThemeMode themeMode = ThemeMode.system;
  @override
  void onMount() {
    addToGameWidgetBuild(() {
      // ref.listen(settingsProvider, (settings, setting) {
      //   setting.settings.isDarkMode
      //       ? themeMode = ThemeMode.dark
      //       : themeMode = ThemeMode.light;
      // });
      themeMode = ref.watch(settingsNotifierProvider).themeMode;
    });
    super.onMount();
  }

  void keyBasedDecision(ValueKey<String> key) {
    switch (key.value) {
      case "Right":
        borderDef = BodyDef(
          position: Vector2(kWorldSize.y - 7, -kWorldSize.y / 2),
          type: BodyType.static,
        );
        shape = EdgeShape()..set(Vector2.zero(), Vector2(0, kWorldSize.y));
        break;
      case "Left":
        borderDef = BodyDef(
          position: Vector2(-kWorldSize.y + 7, kWorldSize.y / 2),
          type: BodyType.static,
        );
        shape = EdgeShape()..set(Vector2.zero(), Vector2(0, -kWorldSize.y));
        break;
      case "Top":
        borderDef = BodyDef(
          position: Vector2(-kWorldSize.x / 2, -kWorldSize.y / 2),
          type: BodyType.static,
        );
        shape = EdgeShape()..set(Vector2.zero(), Vector2(kWorldSize.x, 0));
        break;
      case "Bottom":
        borderDef = BodyDef(
          position: Vector2(-kWorldSize.x / 2, kWorldSize.y / 2),
          type: BodyType.static,
        );
        shape = EdgeShape()..set(Vector2.zero(), Vector2(kWorldSize.x, 0));
        break;
    }
  }

  @override
  Body createBody() {
    // ref.watch(settingsProvider).settings.isDarkMode
    //     ? themeMode = ThemeMode.dark
    //     : themeMode = ThemeMode.light;
    keyBasedDecision(valueKey);
    // borderDef = BodyDef(
    //   position: Vector2(kWorldSize.y, -kWorldSize.y / 2),
    //   type: BodyType.static,
    // );
    // shape = EdgeShape()..set(Vector2.zero(), Vector2(0, kWorldSize.y));
    fixtureDef = FixtureDef(shape, friction: 0.9);
    return world.createBody(borderDef)..createFixture(fixtureDef);
  }

  @override
  void render(Canvas canvas) {
    super.paint.color =
        (themeMode == ThemeMode.dark ? Colors.white : Colors.black);
    super.render(canvas);
  }
}
