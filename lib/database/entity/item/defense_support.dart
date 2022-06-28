const String tableDefenseSupport = 'defense_support';
const String columnDef = 'def';
const String columnDef2 = 'def2';
const String columnMdef = 'mdef';
const String columnMdef2 = 'mdef2';
const String columnName = 'name';
const String columnPath = 'path';
const String columnDuration = 'duration';
const String columnItemId = 'item_id';

class DefenseSupport {
  late int def, def2, mdef, mdef2, duration, itemId;
  late String name, path;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnDef: def,
      columnDef2: def2,
      columnMdef: mdef,
      columnMdef2: mdef2,
      columnDuration: duration,
      columnName: name,
      columnPath: path,
      columnItemId: itemId,
    };
    return map;
  }

  DefenseSupport();

  DefenseSupport.fromMap(Map<String, Object?> map) {
    def = int.parse(map[columnDef].toString());
    mdef = int.parse(map[columnMdef].toString());
    mdef2 = int.parse(map[columnMdef2].toString());
    def2 = int.parse(map[columnDef2].toString());
    duration = int.parse(map[columnDuration].toString());
    name = map[columnName].toString();
    path = map[columnPath].toString();
    itemId = int.parse(map[columnItemId].toString());
  }
}
