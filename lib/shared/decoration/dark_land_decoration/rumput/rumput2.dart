import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Rumput2 extends GameDecoration {
  Rumput2(Vector2 position)
      : super.withSprite(
          sprite: Sprite.load('decoration/dark_land/rumput/rumput2.png'),
          position: position,
          size: Vector2(tileSize, tileSize),
        );
}
