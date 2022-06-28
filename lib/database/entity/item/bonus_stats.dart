const String tableBonusStats = 'bonus_stats';
const String columnStr = 'str';
const String columnStr2 = 'str2';
const String columnInt = 'int';
const String columnInt2 = 'int2';
const String columnVit = 'vit';
const String columnVit2 = 'vit2';
const String columnAgi = 'agi';
const String columnAgi2 = 'agi2';
const String columnDex = 'dex';
const String columnDex2 = 'dex2';
const String columnEquipmentId = 'equipment_id';

class BonusStats {
  late int str,
      str2,
      intel,
      intel2,
      vit,
      vit2,
      agi,
      agi2,
      dex,
      dex2,
      equipmentId;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnStr: str,
      columnStr2: str2,
      columnInt: intel,
      columnInt2: intel2,
      columnVit: vit,
      columnVit2: vit2,
      columnAgi: agi,
      columnAgi2: agi2,
      columnDex: dex,
      columnDex2: dex2,
      columnEquipmentId: equipmentId,
    };
    return map;
  }

  BonusStats();

  BonusStats.fromMap(Map<String, Object?> map) {
    str = int.parse(map[columnStr].toString());
    str2 = int.parse(map[columnStr2].toString());
    intel = int.parse(map[columnInt].toString());
    intel2 = int.parse(map[columnInt2].toString());
    vit = int.parse(map[columnVit].toString());
    vit2 = int.parse(map[columnVit2].toString());
    agi = int.parse(map[columnAgi].toString());
    agi2 = int.parse(map[columnAgi2].toString());
    dex = int.parse(map[columnDex].toString());
    dex2 = int.parse(map[columnDex2].toString());
    equipmentId = int.parse(map[columnEquipmentId].toString());
  }
}
