import 'package:final_project_ai/database/entity/tile_data.dart';
import 'package:sqflite/sqflite.dart';

class TileDataProvider {
  late Database db;

  Future open() async {
    db = await openDatabase(
      getDatabasesPath().toString() + '\\game.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table tile_data(
            value int not null,
            sub_biome_id integer foreign key references sub_biome(id) on update cascade on delete cascade not null
          )
     ''');
      },
    );
  }

  Future<int> insert(TileData tileData) async {
    return await db.insert(tableTileData, tileData.toMap());
  }

  Future<TileData> getTileData(int id) async {
    List<Map<String, Object?>> maps = await db.query(tableTileData,
        columns: [
          columnValue,
          columnSubBiomeId,
        ],
        where: '$columnSubBiomeId = ?',
        whereArgs: [id]);
    if (maps.length.toInt() > 0) {
      return TileData.fromMap(maps.first);
    }
    return TileData();
  }

  Future<int> delete(int id) async {
    return await db.delete(
      tableTileData,
      where: '$columnSubBiomeId = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(TileData tileData) async {
    return await db.update(
      tableTileData,
      tileData.toMap(),
      where: '$columnSubBiomeId = ?',
      whereArgs: [tileData.subBiomeId],
    );
  }

  Future close() async => db.close();
}
