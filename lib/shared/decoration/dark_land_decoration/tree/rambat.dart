import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Rambat extends GameDecoration {
  Rambat(Vector2 position)
      : super.withSprite(
          sprite: Sprite.load(
            "decoration/dark_land/tree/rambat.png",
          ),
          position: position,
          size: Vector2(tileSize, tileSize * 2),
        );
}
