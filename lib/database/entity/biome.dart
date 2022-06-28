const String tableBiome = 'biome';
const String columnId = 'id';
const String columnWorldId = 'biome_id';
const String columnName = 'name';
const String columnIsCreated = 'isCreated';
const String columnAmount = 'amount';
const String columnValue = 'value';

class Biome {
  late int id, worldId, amount, value;
  late String name;
  late bool isCreated;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnId: id,
      columnWorldId: worldId,
      columnName: name,
      columnIsCreated: isCreated,
      columnAmount: amount,
      columnValue: value,
    };
    return map;
  }

  Biome();

  Biome.fromMap(Map<String, Object?> map) {
    id = int.parse(map[columnId].toString());
    worldId = int.parse(map[columnWorldId].toString());
    name = map[columnName].toString();
    isCreated = (map[columnIsCreated].toString()).toLowerCase() == 'true';
    amount = int.parse(map[columnAmount].toString());
    value = int.parse(map[columnValue].toString());
  }
}
