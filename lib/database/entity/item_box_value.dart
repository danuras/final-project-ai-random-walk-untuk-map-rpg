const String tableItemBoxValue = 'item_box_value';
const String columnItemBoxId = 'item_box_id';
const String columnItemId = 'item_id';
const String columnAmount = 'amount';

class ItemBoxValue {
  late int itemBoxId, itemId, amount;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnItemBoxId: itemBoxId,
      columnItemId: itemId,
      columnAmount: amount,
    };
    return map;
  }

  ItemBoxValue();

  ItemBoxValue.fromMap(Map<String, Object?> map) {
    itemBoxId = int.parse(map[columnItemBoxId].toString());
    itemId = int.parse(map[columnItemId].toString());
    amount = int.parse(map[columnAmount].toString());
  }
}
