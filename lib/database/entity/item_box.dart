const String tableItemBox = 'item_box';
const String columnId = 'id';
const String columnPlayerName = 'player_name';

class ItemBox {
  late int id;
  late String playerName;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnId: id,
      columnPlayerName: playerName,
    };
    return map;
  }

  ItemBox();

  ItemBox.fromMap(Map<String, Object?> map) {
    id = int.parse(map[columnId].toString());
    playerName = map[columnPlayerName].toString();
  }
}
