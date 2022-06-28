import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class SwordWF extends GameDecoration with ObjectCollision {
  SwordWF(Vector2 position)
      : super.withSprite(
          sprite: Sprite.load('decoration/dark_castle/sword_wf.png'),
          position: position,
          size: Vector2(tileSize, tileSize),
        );
}
