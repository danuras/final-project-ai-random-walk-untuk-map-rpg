import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Shield extends GameDecoration with ObjectCollision {
  Shield(Vector2 position)
      : super.withSprite(
          sprite: Sprite.load('decoration/dark_castle/shield.png'),
          position: position,
          size: Vector2(tileSize, tileSize * 2),
        );
}
