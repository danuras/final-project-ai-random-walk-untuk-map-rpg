const String tableAttackSupport = 'attack_support';
const String columnAtk = 'atk';
const String columnAtk2 = 'atk2';
const String columnMatk = 'matk';
const String columnMatk2 = 'matk2';
const String columnName = 'name';
const String columnPath = 'path';
const String columnDuration = 'duration';
const String columnItemId = 'item_id';

class AttackSupport {
  late int atk, atk2, matk, matk2, duration, itemId;
  late String name, path;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnAtk: atk,
      columnAtk2: atk2,
      columnMatk: matk,
      columnMatk2: matk2,
      columnDuration: duration,
      columnName: name,
      columnPath: path,
      columnItemId: itemId,
    };
    return map;
  }

  AttackSupport();

  AttackSupport.fromMap(Map<String, Object?> map) {
    atk = int.parse(map[columnAtk].toString());
    matk = int.parse(map[columnMatk].toString());
    matk2 = int.parse(map[columnMatk2].toString());
    atk2 = int.parse(map[columnAtk2].toString());
    duration = int.parse(map[columnDuration].toString());
    name = map[columnName].toString();
    path = map[columnPath].toString();
    itemId = int.parse(map[columnItemId].toString());
  }
}
