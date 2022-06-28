import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Rumput4 extends GameDecoration {
  Rumput4(Vector2 position)
      : super.withSprite(
          sprite: Sprite.load('decoration/dark_land/rumput/rumput4.png'),
          position: position,
          size: Vector2(tileSize, tileSize),
        );
}
