const String tableMaxHPPotion = 'maxhp_potion';
const String columnHP = 'hp';
const String columnName = 'name';
const String columnPath = 'path';
const String columnItemId = 'item_id';

class MaxHPPotion {
  late int hp, itemId;
  late String name, path;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnHP: hp,
      columnName: name,
      columnPath: path,
      columnItemId: itemId,
    };
    return map;
  }

  MaxHPPotion();

  MaxHPPotion.fromMap(Map<String, Object?> map) {
    hp = int.parse(map[columnHP].toString());
    name = map[columnName].toString();
    path = map[columnPath].toString();
    itemId = int.parse(map[columnItemId].toString());
  }
}
