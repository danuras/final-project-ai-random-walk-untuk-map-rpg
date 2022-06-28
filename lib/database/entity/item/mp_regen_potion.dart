const String tableMPRegenPotion = 'mp_regen_potion';
const String columnMP = 'mp';
const String columnName = 'name';
const String columnPath = 'path';
const String columnDuration = 'duration';
const String columnItemId = 'item_id';

class MPRegenPotion {
  late int mp, duration, itemId;
  late String name, path;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnMP: mp,
      columnDuration: duration,
      columnName: name,
      columnPath: path,
      columnItemId: itemId,
    };
    return map;
  }

  MPRegenPotion();

  MPRegenPotion.fromMap(Map<String, Object?> map) {
    mp = int.parse(map[columnMP].toString());
    duration = int.parse(map[columnDuration].toString());
    name = map[columnName].toString();
    path = map[columnPath].toString();
    itemId = int.parse(map[columnItemId].toString());
  }
}
