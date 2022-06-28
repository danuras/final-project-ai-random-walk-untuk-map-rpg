import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Sword extends GameDecoration with ObjectCollision {
  Sword(Vector2 position)
      : super.withSprite(
          sprite: Sprite.load('decoration/dark_castle/sword_w.png'),
          position: position,
          size: Vector2(tileSize, tileSize),
        );
}
