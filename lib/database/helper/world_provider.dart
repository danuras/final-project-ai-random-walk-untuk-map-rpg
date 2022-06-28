import 'package:final_project_ai/database/entity/world.dart';
import 'package:sqflite/sqflite.dart';

class WorldProvider {
  late Database db;

  Future open() async {
    db = await openDatabase(
      getDatabasesPath().toString() + '\\game.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table world(
            id integer primary key identity not null,
            player_name varchar(20) foreign key references player(name) on update cascade on delete cascade not null,
            player_x int not null,
            player_y int not null,
            last_map_id int not null,
            name varchar(20) not null
          )
     ''');
      },
    );
  }

  Future<int> insert(World world) async {
    return await db.insert(tableWorld, world.toMap());
  }

  Future<World> getWorld(int id) async {
    List<Map<String, Object?>> maps = await db.query(tableWorld,
        columns: [
          columnId,
          columnPlayerName,
          columnPlayerX,
          columnPlayerY,
          columnSubMapId,
          columnName,
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length.toInt() > 0) {
      return World.fromMap(maps.first);
    }
    return World();
  }

  Future<int> delete(int id) async {
    return await db.delete(
      tableWorld,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(World world) async {
    return await db.update(
      tableWorld,
      world.toMap(),
      where: '$columnId = ?',
      whereArgs: [world.id],
    );
  }

  Future close() async => db.close();
}
