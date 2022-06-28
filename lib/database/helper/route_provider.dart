import 'package:final_project_ai/database/entity/route.dart';
import 'package:sqflite/sqflite.dart';

class RouteProvider {
  late Database db;

  Future open() async {
    db = await openDatabase(
      getDatabasesPath().toString() + '\\game.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table route(
            x int,
            y int,
            sub_biome_id integer foreign key references sub_biome(id) on update cascade on delete cascade not null,
            value int not null
          )
     ''');
      },
    );
  }

  Future<int> insert(Route route) async {
    return await db.insert(tableRoute, route.toMap());
  }

  Future<Route> getTileData(int id) async {
    List<Map<String, Object?>> maps = await db.query(tableRoute,
        columns: [
          columnX,
          columnY,
          columnValue,
          columnSubBiomeId,
        ],
        where: '$columnSubBiomeId = ?',
        whereArgs: [id]);
    if (maps.length.toInt() > 0) {
      return Route.fromMap(maps.first);
    }
    return Route();
  }

  Future<int> delete(int id) async {
    return await db.delete(
      tableRoute,
      where: '$columnSubBiomeId = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(Route route) async {
    return await db.update(
      tableRoute,
      route.toMap(),
      where: '$columnSubBiomeId = ?',
      whereArgs: [route.subBiomeId],
    );
  }

  Future close() async => db.close();
}
