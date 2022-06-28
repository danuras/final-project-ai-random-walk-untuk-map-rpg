import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Crystal6 extends GameDecoration {
  Crystal6(Vector2 position)
      : super.withSprite(
          sprite: Sprite.load('decoration/dark_land/crystal/crystal6.png'),
          position: position,
          size: Vector2(tileSize, tileSize),
        );
  @override
  int get priority => LayerPriority.MAP + 1;
}
