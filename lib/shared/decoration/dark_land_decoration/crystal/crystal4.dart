import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Crystal4 extends GameDecoration {
  Crystal4(Vector2 position)
      : super.withSprite(
          sprite: Sprite.load('decoration/dark_land/crystal/crystal4.png'),
          position: position,
          size: Vector2(tileSize, tileSize),
        );
  @override
  int get priority => LayerPriority.MAP + 1;
}
