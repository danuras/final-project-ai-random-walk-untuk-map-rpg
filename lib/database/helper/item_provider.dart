import 'package:final_project_ai/database/entity/item/item.dart';
import 'package:sqflite/sqflite.dart';

class ItemProvider {
  late Database db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1);
  }

  Future<int> insert(Item item) async {
    return await db.insert(tableItem, item.toMap());
  }

  Future<Item> getItem(int id) async {
    List<Map<String, Object?>> maps = await db.query(tableItem,
        columns: [
          columnId,
          columnCategories,
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length.toInt() > 0) {
      return Item.fromMap(maps.first);
    }
    return Item();
  }

  Future<List<Item>> getAllItem() async {
    List<Item> itemList = [];
    int getLength = 0;
    List<Map<String, Object?>> maps = await db.query(
      tableItem,
      columns: [
        columnId,
        columnCategories,
      ],
    );
    getLength = maps.length.toInt();
    if (getLength > 0) {
      for (int i = 0; i < getLength; i++) {
        itemList.add(Item.fromMap(maps[i]));
      }
    }
    return itemList;
  }

  Future<int> delete(int id) async {
    return await db.delete(
      tableItem,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(Item item) async {
    return await db.update(
      tableItem,
      item.toMap(),
      where: '$columnId = ?',
      whereArgs: [item.id],
    );
  }

  Future close() async => db.close();
}
