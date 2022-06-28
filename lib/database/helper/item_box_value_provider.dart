import 'package:final_project_ai/database/entity/item_box_value.dart';
import 'package:sqflite/sqflite.dart';

class ItemBoxValueProvider {
  late Database db;

  Future open() async {
    db = await openDatabase(
      getDatabasesPath().toString() + '\\game.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table item_box_value(
            item_box_id integer foreign key references item_box(id) on update cascade on delete cascade not null,
            item_id int not null,
            amount integer not null
          )
     ''');
      },
    );
  }

  Future<int> insert(ItemBoxValue itemBoxValue) async {
    return await db.insert(tableItemBoxValue, itemBoxValue.toMap());
  }

  Future<ItemBoxValue> getItemBoxValue(int id) async {
    List<Map<String, Object?>> maps = await db.query(tableItemBoxValue,
        columns: [
          columnItemBoxId,
          columnItemId,
          columnAmount,
        ],
        where: '$columnItemBoxId = ?',
        whereArgs: [id]);
    if (maps.length.toInt() > 0) {
      return ItemBoxValue.fromMap(maps.first);
    }
    return ItemBoxValue();
  }

  Future<int> delete(int id) async {
    return await db.delete(
      tableItemBoxValue,
      where: '$columnItemBoxId = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(ItemBoxValue itemBoxValue) async {
    return await db.update(
      tableItemBoxValue,
      itemBoxValue.toMap(),
      where: '$columnItemBoxId = ?',
      whereArgs: [itemBoxValue.itemBoxId],
    );
  }

  Future close() async => db.close();
}
