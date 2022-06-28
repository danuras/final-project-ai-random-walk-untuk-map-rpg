const String tableSubBiome = 'sub_biome';
const String columnId = 'id';
const String columnBiomeId = 'biome_id';
const String columnIsCreated = 'isCreated';
const String columnCount = 'count';

class SubBiome {
  late int id, biomeId, count;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnId: id,
      columnBiomeId: biomeId,
    };
    return map;
  }

  SubBiome();

  SubBiome.fromMap(Map<String, Object?> map) {
    id = int.parse(map[columnId].toString());
    biomeId = int.parse(map[columnBiomeId].toString());
    count = int.parse(map[columnCount].toString());
  }
}
