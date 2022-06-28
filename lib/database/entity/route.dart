const String tableRoute = 'route';
const String columnX = 'x';
const String columnY = 'y';
const String columnValue = 'value';
const String columnSubBiomeId = 'sub_biome_id';

class Route {
  late int x, y, value, subBiomeId;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnX: x,
      columnY: y,
      columnValue: value,
      columnSubBiomeId: subBiomeId,
    };
    return map;
  }

  Route();

  Route.fromMap(Map<String, Object?> map) {
    x = int.parse(map[columnX].toString());
    y = int.parse(map[columnY].toString());
    value = int.parse(map[columnValue].toString());
    subBiomeId = int.parse(map[columnSubBiomeId].toString());
  }
}
