const String tableHPRegenPotion = 'hp_regen_potion';
const String columnHP = 'hp';
const String columnName = 'name';
const String columnPath = 'path';
const String columnDuration = 'duration';
const String columnItemId = 'item_id';

class HPRegenPotion {
  late int hp, duration, itemId;
  late String name, path;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnHP: hp,
      columnDuration: duration,
      columnName: name,
      columnPath: path,
      columnItemId: itemId,
    };
    return map;
  }

  HPRegenPotion();

  HPRegenPotion.fromMap(Map<String, Object?> map) {
    hp = int.parse(map[columnHP].toString());
    duration = int.parse(map[columnDuration].toString());
    name = map[columnName].toString();
    path = map[columnPath].toString();
    itemId = int.parse(map[columnItemId].toString());
  }
}
