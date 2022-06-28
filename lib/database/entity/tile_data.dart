const String tableTileData = 'tile_data';
const String columnValue = 'value';
const String columnSubBiomeId = 'sub_biome_id';

class TileData {
  late int value, subBiomeId;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnValue: value,
      columnSubBiomeId: subBiomeId,
    };
    return map;
  }

  TileData();

  TileData.fromMap(Map<String, Object?> map) {
    value = int.parse(map[columnValue].toString());
    subBiomeId = int.parse(map[columnSubBiomeId].toString());
  }
}
