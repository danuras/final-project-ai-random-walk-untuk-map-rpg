import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class BenderaUngu extends GameDecoration with ObjectCollision {
  BenderaUngu(Vector2 position)
      : super.withSprite(
          sprite: Sprite.load('decoration/dark_castle/bendera_ungu.png'),
          position: position,
          size: Vector2(tileSize, tileSize * 2),
        );
}
