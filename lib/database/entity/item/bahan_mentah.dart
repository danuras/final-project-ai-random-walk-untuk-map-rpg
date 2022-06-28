const String tableBahanMentah = 'bahan_mentah';
const String columnName = 'name';
const String columnPath = 'path';
const String columnItemId = 'item_id';

class BahanMentah {
  late int itemId;
  late String name, path;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnName: name,
      columnPath: path,
      columnItemId: itemId,
    };
    return map;
  }

  BahanMentah();

  BahanMentah.fromMap(Map<String, Object?> map) {
    name = map[columnName].toString();
    path = map[columnPath].toString();
    itemId = int.parse(map[columnItemId].toString());
  }
}
