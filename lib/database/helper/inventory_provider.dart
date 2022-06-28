import 'package:final_project_ai/database/entity/inventory.dart';
import 'package:sqflite/sqflite.dart';

class InventoryProvider {
  late Database db;

  Future open() async {
    db = await openDatabase(
      getDatabasesPath().toString() + '\\game.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table inventory(
            player_name varchar(20) foreign key references player(id) on update cascade on delete cascade not null,
            item_id int not null,
            amount integer not null
          )
     ''');
      },
    );
  }

  Future<int> insert(Inventory inventory) async {
    return await db.insert(tableInventory, inventory.toMap());
  }

  Future<Inventory> getInventory(int id) async {
    List<Map<String, Object?>> maps = await db.query(tableInventory,
        columns: [
          columnItemId,
          columnPlayerName,
          columnAmount,
        ],
        where: '$columnItemId = ?',
        whereArgs: [id]);
    if (maps.length.toInt() > 0) {
      return Inventory.fromMap(maps.first);
    }
    return Inventory();
  }

  Future<int> delete(int id) async {
    return await db.delete(
      tableInventory,
      where: '$columnItemId = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(Inventory inventory) async {
    return await db.update(
      tableInventory,
      inventory.toMap(),
      where: '$columnItemId = ?',
      whereArgs: [inventory.itemId],
    );
  }

  Future close() async => db.close();
}
