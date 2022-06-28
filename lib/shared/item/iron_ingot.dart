import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/database/entity/item/item.dart';
import 'package:final_project_ai/database/helper/item_provider.dart';
import 'package:final_project_ai/shared/util/common_sprite_sheet/potion_sprite_sheet.dart';

import '../../main.dart';

class IronIngot extends GameDecoration with Sensor {
  final double life;
  double _lifeDistributed = 0;

  IronIngot(Vector2 position, this.life)
      : super.withSprite(
          sprite: Sprite.load("item/bijih/iron_ingot.png"),
          position: position,
          size: Vector2.all(tileSize * 0.5),
        );

  @override
  void onContact(GameComponent collision) async {
    if (collision is Player) {
      /* 
      gameRef.getValueGenerator(const Duration(seconds: 1), onChange: (value) {
        if (_lifeDistributed < life) {
          double newLife = life * value - _lifeDistributed;
          _lifeDistributed += newLife;
          collision.addLife(newLife);
        }
      }).start(); */
      Item item = Item();
      ItemProvider itemProvider = ItemProvider();
      await itemProvider.open('database/game.db');
      await itemProvider.insert(item);

      removeFromParent();
    }
  }
}
