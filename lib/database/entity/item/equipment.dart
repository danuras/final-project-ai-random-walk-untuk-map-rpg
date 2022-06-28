const String tableEquipment = 'equipment';
const String columnId = 'id';
const String columnCategories = 'categories';
const String columnName = 'name';
const String columnPath = 'path';
const String columnItemId = 'item_id';

class Equipment {
  late int id, itemId;
  late String categories, name, path;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnCategories: categories,
      columnName: name,
      columnPath: path,
      columnItemId: itemId,
    };
    map[columnId] = id;
    return map;
  }

  Equipment();

  Equipment.fromMap(Map<String, Object?> map) {
    id = int.parse(map[columnId].toString());
    itemId = int.parse(map[columnItemId].toString());
    categories = [columnCategories].toString();
    path = [columnPath].toString();
    name = [columnName].toString();
  }
}
