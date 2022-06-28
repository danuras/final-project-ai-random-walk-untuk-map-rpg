import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Rumput3 extends GameDecoration {
  Rumput3(Vector2 position)
      : super.withSprite(
          sprite: Sprite.load('decoration/dark_land/rumput/rumput3.png'),
          position: position,
          size: Vector2(tileSize, tileSize),
        );
}
