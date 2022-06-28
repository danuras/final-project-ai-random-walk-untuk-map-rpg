const String tableInventory = 'iventory';
const String columnItemId = 'item_id';
const String columnAmount = 'amount';
const String columnPlayerName = 'player_name';

class Inventory {
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

  Inventory();

  Inventory.fromMap(Map<String, Object?> map) {
    itemId = int.parse(map[columnItemId].toString());
    amount = int.parse(map[columnAmount].toString());
    playerName = map[columnPlayerName].toString();
  }
}
