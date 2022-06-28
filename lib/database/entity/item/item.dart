const String tableItem = 'item';
const String columnId = 'id';
const String columnCategories = 'categories';

class Item {
  late int id;
  late String categories;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnCategories: categories,
    };
    map[columnId] = id;
    return map;
  }

  Item();

  Item.fromMap(Map<String, Object?> map) {
    id = int.parse(map[columnId].toString());
    categories = [columnCategories].toString();
  }
}
