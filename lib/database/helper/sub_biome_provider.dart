import 'package:final_project_ai/database/entity/sub_biome.dart';
import 'package:sqflite/sqflite.dart';

class SubBiomeProvider {
  late Database db;

  Future open() async {
    db = await openDatabase(
      getDatabasesPath().toString() + '\\game.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table sub_biome(
            id integer primary key identity not null,
            biome_id integer foreign key references biome(id) on update cascade on delete cascade not null,
            isCreated bit not null,
            count int not null
          )
     ''');
      },
    );
  }

  Future<int> insert(SubBiome subBiome) async {
    return await db.insert(tableSubBiome, subBiome.toMap());
  }

  Future<SubBiome> getSubBiome(int id) async {
    List<Map<String, Object?>> maps = await db.query(tableSubBiome,
        columns: [
          columnId,
          columnBiomeId,
          columnIsCreated,
          columnCount,
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length.toInt() > 0) {
      return SubBiome.fromMap(maps.first);
    }
    return SubBiome();
  }

  Future<int> delete(int id) async {
    return await db.delete(
      tableSubBiome,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(SubBiome subBiome) async {
    return await db.update(
      tableSubBiome,
      subBiome.toMap(),
      where: '$columnId = ?',
      whereArgs: [subBiome.id],
    );
  }

  Future close() async => db.close();
}
