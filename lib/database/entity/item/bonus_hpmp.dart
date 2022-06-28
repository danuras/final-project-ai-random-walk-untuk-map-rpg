const String tableBonusHPMP = 'bonus_hpmp';
const String columnRegenHP = 'regen_hp';
const String columnRegenHP2 = 'regen_hp2';
const String columnRegenMP = 'regen_mp';
const String columnRegenMP2 = 'regen_mp2';
const String columnMaxHP = 'maxhp';
const String columnMaxHP2 = 'maxhp2';
const String columnMaxMP = 'maxmp';
const String columnEquipmentId = 'equipment_id';

class BonusHPMP {
  late int regenHP,
      regenHP2,
      regenMP,
      regenMP2,
      maxHP,
      maxHP2,
      maxMP,
      equipmentId;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnRegenHP: regenHP,
      columnRegenHP2: regenHP2,
      columnRegenMP: regenMP,
      columnRegenMP2: regenMP2,
      columnMaxHP: maxHP,
      columnMaxHP2: maxHP2,
      columnMaxMP: maxMP,
      columnEquipmentId: equipmentId,
    };
    return map;
  }

  BonusHPMP();

  BonusHPMP.fromMap(Map<String, Object?> map) {
    regenHP = int.parse(map[columnRegenHP].toString());
    regenHP2 = int.parse(map[columnRegenHP2].toString());
    regenMP = int.parse(map[columnRegenMP].toString());
    regenMP2 = int.parse(map[columnRegenMP2].toString());
    maxHP = int.parse(map[columnMaxHP].toString());
    maxHP2 = int.parse(map[columnMaxHP2].toString());
    maxMP = int.parse(map[columnMaxMP].toString());
    equipmentId = int.parse(map[columnEquipmentId].toString());
  }
}
