const String tableSetEquipment = 'set_equipment';
const String columnWeaponId = 'weapon_id';
const String columnSubWeaponId = 'sub_weapon_id';
const String columnGlovesId = 'gloves_id';
const String columnClothesId = 'clothes_id';
const String columnAccessoriesId = 'accessories_id';
const String columnShoesId = 'shoes_id';
const String columnRingId = 'ring_id';
const String columnPlayerName = 'player_name';

class SetEquipment {
  late int weaponId,
      subWeaponId,
      glovesId,
      clothesId,
      accessoriesId,
      shoesId,
      ringId,
      playerName;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnWeaponId: weaponId,
      columnSubWeaponId: subWeaponId,
      columnGlovesId: glovesId,
      columnClothesId: clothesId,
      columnAccessoriesId: accessoriesId,
      columnShoesId: shoesId,
      columnRingId: ringId,
      columnPlayerName: playerName,
    };
    return map;
  }

  SetEquipment();

  SetEquipment.fromMap(Map<String, Object?> map) {
    weaponId = int.parse(map[columnWeaponId].toString());
    subWeaponId = int.parse(map[columnSubWeaponId].toString());
    glovesId = int.parse(map[columnGlovesId].toString());
    clothesId = int.parse(map[columnClothesId].toString());
    accessoriesId = int.parse(map[columnAccessoriesId].toString());
    shoesId = int.parse(map[columnShoesId].toString());
    ringId = int.parse(map[columnRingId].toString());
    playerName = int.parse(map[columnPlayerName].toString());
  }
}
