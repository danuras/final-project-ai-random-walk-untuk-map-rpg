const String tableMaxHPPotion = 'hpmp_potion';
const String columnHP = 'hp';
const String columnMP = 'mp';
const String columnName = 'name';
const String columnPath = 'path';
const String columnItemId = 'item_id';

class HPMPPotion {
  late int hp, mp, itemId;
  late String name, path;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnHP: hp,
      columnMP: mp,
      columnName: name,
      columnPath: path,
      columnItemId: itemId,
    };
    return map;
  }

  HPMPPotion();

  HPMPPotion.fromMap(Map<String, Object?> map) {
    hp = int.parse(map[columnHP].toString());
    mp = int.parse(map[columnMP].toString());
    name = map[columnName].toString();
    path = map[columnPath].toString();
    itemId = int.parse(map[columnItemId].toString());
  }
}
