const String tableBonusCritical = 'bonus_critical';
const String columnCritical = 'critical';
const String columnCritical2 = 'critical2';
const String columnCriticalDamage = 'critical_damage';
const String columnCriticalDamage2 = 'critical_damage2';
const String columnEquipmentId = 'equipment_id';

class BonusCritical {
  late int critical, critical2, criticalDamage, criticalDamage2, equipmentId;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnCritical: critical,
      columnCritical2: critical2,
      columnCriticalDamage: criticalDamage,
      columnCriticalDamage2: criticalDamage2,
      columnEquipmentId: equipmentId,
    };
    return map;
  }

  BonusCritical();

  BonusCritical.fromMap(Map<String, Object?> map) {
    critical = int.parse(map[columnCritical].toString());
    critical2 = int.parse(map[columnCritical2].toString());
    criticalDamage = int.parse(map[columnCriticalDamage].toString());
    criticalDamage2 = int.parse(map[columnCriticalDamage2].toString());
    equipmentId = int.parse(map[columnEquipmentId].toString());
  }
}
