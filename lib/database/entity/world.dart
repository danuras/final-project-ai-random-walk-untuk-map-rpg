const String tableWorld = 'world';
const String columnId = 'id';
const String columnPlayerName = 'player_name';
const String columnPlayerX = 'player_x';
const String columnPlayerY = 'player_y';
const String columnSubMapId = 'sub_map_id';
const String columnName = 'name';

class World {
  late int id;
  late String playerName;
  late int playerX;
  late int playerY;
  late int subMapId;
  late String name;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnPlayerName: playerName,
      columnPlayerX: playerX,
      columnPlayerY: playerY,
      columnSubMapId: subMapId,
      columnName: name,
    };
    if (id.toString().isNotEmpty) {
      map[columnId] = id;
    }
    return map;
  }

  World();

  World.fromMap(Map<String, Object?> map) {
    name = map[columnName].toString();
    playerName = map[columnPlayerName].toString();
    id = int.parse(map[columnId].toString());
    playerX = int.parse(map[columnPlayerX].toString());
    playerY = int.parse(map[columnPlayerY].toString());
    subMapId = int.parse(map[columnSubMapId].toString());
  }
}
