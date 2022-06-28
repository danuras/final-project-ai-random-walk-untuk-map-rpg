const String tableShorcutItem = 'shorcut_item';
const String columnItemId = 'item_id';
const String columnAmount = 'amount';
const String columnPlayerName = 'player_name';

class ShorcutItem {
  late int itemId, amount;
  late String playerName;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnItemId: itemId,
      columnAmount: amount,
      columnPlayerName: playerName,
    };
    return map;
  }

  ShorcutItem();

  ShorcutItem.fromMap(Map<String, Object?> map) {
    itemId = int.parse(map[columnItemId].toString());
    amount = int.parse(map[columnAmount].toString());
    playerName = map[columnPlayerName].toString();
  }
}
