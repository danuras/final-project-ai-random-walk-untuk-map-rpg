const String tableMaxMPPotion = 'maxmp_potion';
const String columnMP = 'mp';
const String columnName = 'name';
const String columnPath = 'path';
const String columnItemId = 'item_id';

class MaxMPPotion {
  late int mp, itemId;
  late String name, path;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnMP: mp,
      columnName: name,
      columnPath: path,
      columnItemId: itemId,
    };
    return map;
  }

  MaxMPPotion();

  MaxMPPotion.fromMap(Map<String, Object?> map) {
    mp = int.parse(map[columnMP].toString());
    name = map[columnName].toString();
    path = map[columnPath].toString();
    itemId = int.parse(map[columnItemId].toString());
  }
}
