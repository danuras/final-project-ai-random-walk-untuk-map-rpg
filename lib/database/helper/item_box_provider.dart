import 'package:final_project_ai/database/entity/item_box.dart';
import 'package:sqflite/sqflite.dart';

class ItemBoxProvider {
  late Database db;

  Future open() async {
    db = await openDatabase(
      getDatabasesPath().toString() + '\\game.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table item_box(
            id integer primary key identity not null,
            player_name varchar(20) foreign key references item_box(id) on update cascade on delete cascade not null
          )
     ''');
      },
    );
  }

  Future<int> insert(ItemBox itemBox) async {
    return await db.insert(tableItemBox, itemBox.toMap());
  }

  Future<ItemBox> getItemBox(int id) async {
    List<Map<String, Object?>> maps = await db.query(tableItemBox,
        columns: [
          columnId,
          columnPlayerName,
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length.toInt() > 0) {
      return ItemBox.fromMap(maps.first);
    }
    return ItemBox();
  }

  Future<int> delete(int id) async {
    return await db.delete(
      tableItemBox,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(ItemBox itemBox) async {
    return await db.update(
      tableItemBox,
      itemBox.toMap(),
      where: '$columnId = ?',
      whereArgs: [itemBox.id],
    );
  }

  Future close() async => db.close();
}
