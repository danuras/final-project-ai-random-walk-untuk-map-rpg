import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Rumput1 extends GameDecoration {
  Rumput1(Vector2 position)
      : super.withSprite(
          sprite: Sprite.load('decoration/dark_land/rumput/rumput1.png'),
          position: position,
          size: Vector2(tileSize, tileSize),
        );
}
