import 'package:final_project_ai/database/entity/shorcut_item.dart';
import 'package:sqflite/sqflite.dart';

class ShorcutItemProvider {
  late Database db;

  Future open() async {
    db = await openDatabase(
      getDatabasesPath().toString() + '\\game.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table shortcut_item(
            player_name varchar(20) foreign key references player(id) on update cascade on delete cascade not null,
            item_id int not null,
            amount integer not null
          )
     ''');
      },
    );
  }

  Future<int> insert(ShorcutItem shorcutItem) async {
    return await db.insert(tableShorcutItem, shorcutItem.toMap());
  }

  Future<ShorcutItem> getShorcutItem(int id) async {
    List<Map<String, Object?>> maps = await db.query(tableShorcutItem,
        columns: [
          columnItemId,
          columnPlayerName,
          columnAmount,
        ],
        where: '$columnItemId = ?',
        whereArgs: [id]);
    if (maps.length.toInt() > 0) {
      return ShorcutItem.fromMap(maps.first);
    }
    return ShorcutItem();
  }

  Future<int> delete(int id) async {
    return await db.delete(
      tableShorcutItem,
      where: '$columnItemId = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(ShorcutItem shorcutItem) async {
    return await db.update(
      tableShorcutItem,
      shorcutItem.toMap(),
      where: '$columnItemId = ?',
      whereArgs: [shorcutItem.itemId],
    );
  }

  Future close() async => db.close();
}
