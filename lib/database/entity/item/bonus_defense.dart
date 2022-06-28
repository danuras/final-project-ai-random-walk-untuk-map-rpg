const String tableBonusDefense = 'bonus_defense';
const String columnDef = 'def';
const String columnDef2 = 'def2';
const String columnMdef = 'mdef';
const String columnMdef2 = 'mdef2';
const String columnEquipmentId = 'equipment_id';

class BonusDefense {
  late int def, def2, mdef, mdef2, equipmentId;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnDef: def,
      columnDef2: def2,
      columnMdef: mdef,
      columnMdef2: mdef2,
      columnEquipmentId: equipmentId,
    };
    return map;
  }

  BonusDefense();

  BonusDefense.fromMap(Map<String, Object?> map) {
    def = int.parse(map[columnDef].toString());
    def2 = int.parse(map[columnDef2].toString());
    mdef = int.parse(map[columnMdef].toString());
    mdef2 = int.parse(map[columnMdef2].toString());
    equipmentId = int.parse(map[columnEquipmentId].toString());
  }
}
