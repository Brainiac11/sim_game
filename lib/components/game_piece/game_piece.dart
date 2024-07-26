import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_riverpod/flame_riverpod.dart';
import 'package:player_move/components/game_piece/game_piece.config.dart';

class GamePiece extends BodyComponent with RiverpodComponentMixin {
  final Vector2 size = gamePieceSize;
  @override
  Vector2 position;

  GamePiece({
      required this.position,
  })
  @override
  Future<void> onMount() {
    // TODO: implement onLoad
    return super.onLoad();
  }
  @override
  Future<void> onLoad() {
    // TODO: implement onLoad
    return super.onLoad();
  }

  @override
  Body createBody() {
    // TODO: implement createBody
    return super.createBody();
  }
}
