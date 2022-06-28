import 'package:bonfire/bonfire.dart';

class SpriteSheetPotion {
  static Future<void> load() async {
    potion = await _create('item/potion/potion.png');
  }

  static Future<SpriteSheet> _create(String path) async {
    final image = await Flame.images.load(path);
    return SpriteSheet.fromColumnsAndRows(
      image: image,
      columns: 10,
      rows: 10,
    );
  }

  static late SpriteSheet potion;
}
