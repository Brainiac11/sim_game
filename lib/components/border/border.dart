import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:player_move/components/border/border_constants.dart';
import 'package:player_move/constants.dart';
import 'package:player_move/providers/settings/settings_notifier.dart';

/// Border Edge can either have a borderKey for the field edges,
/// or a manual position and size for field element obstacles
class BorderEdge extends BodyComponent
    with
        RiverpodComponentMixin,
        CollisionMaskFilters,
        CollisionCategoryFilters {
  BorderEdge({this.borderKey, this.positionOfEdge, this.size});
  ValueKey<String>? borderKey;
  Vector2? positionOfEdge;
  Vector2? size;
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
          position: kRightBorder[0],
          type: BodyType.static,
          allowSleep: false,
        );
        shape = EdgeShape()..set(kRightBorder[1], kRightBorder[2]);
        break;
      case "Left":
        borderDef = BodyDef(
          position: kLeftBorder[0],
          type: BodyType.static,
          allowSleep: false,
        );
        shape = EdgeShape()..set(kLeftBorder[1], kLeftBorder[2]);
        break;
      case "Top":
        borderDef = BodyDef(
          position: kTopBorder[0],
          type: BodyType.static,
          allowSleep: false,
        );
        shape = EdgeShape()..set(kTopBorder[1], kTopBorder[2]);
        break;
      case "Bottom":
        borderDef = BodyDef(
          position: kBottomBorder[0],
          type: BodyType.static,
          allowSleep: false,
        );
        shape = EdgeShape()..set(kBottomBorder[1], kTopBorder[2]);
        break;
    }
  }

  @override
  Body createBody() {
    // ref.watch(settingsProvider).settings.isDarkMode
    //     ? themeMode = ThemeMode.dark
    //     : themeMode = ThemeMode.light;
    if (borderKey != null) {
      keyBasedDecision(borderKey!);
    }
    // borderDef = BodyDef(
    //   position: Vector2(kWorldSize.y, -kWorldSize.y / 2),
    //   type: BodyType.static,
    // );
    // shape = EdgeShape()..set(Vector2.zero(), Vector2(0, kWorldSize.y));
    fixtureDef = FixtureDef(shape,
        friction: 0.9, filter: Filter()..categoryBits = super.everything);
    return world.createBody(borderDef)..createFixture(fixtureDef);
  }

  @override
  void render(Canvas canvas) {
    if (kDebugMode) {
      super.paint.color =
          (themeMode == ThemeMode.dark ? Colors.white : Colors.black);
    }
    super.render(canvas);
  }
}
