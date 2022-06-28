import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class BenderaIjo extends GameDecoration with ObjectCollision {
  BenderaIjo(Vector2 position)
      : super.withSprite(
          sprite: Sprite.load('decoration/dark_castle/bendera_ijo.png'),
          position: position,
          size: Vector2(tileSize, tileSize * 2),
        );
}
