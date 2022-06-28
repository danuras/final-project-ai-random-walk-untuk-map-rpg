import 'package:final_project_ai/database/entity/biome.dart';
import 'package:sqflite/sqflite.dart';

class BiomeProvider {
  late Database db;

  Future open() async {
    db = await openDatabase(
      getDatabasesPath().toString() + '\\game.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table biome(
            id integer primary key identity not null,
            world_id integer foreign key references world(id) on update cascade on delete cascade not null,
            name varchar(20) not null,
            amount integer not null,
            value int not null
          )
     ''');
      },
    );
  }

  Future<int> insert(Biome biome) async {
    return await db.insert(tableBiome, biome.toMap());
  }

  Future<Biome> getBiome(int id) async {
    List<Map<String, Object?>> maps = await db.query(tableBiome,
        columns: [
          columnId,
          columnWorldId,
          columnName,
          columnAmount,
          columnValue,
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length.toInt() > 0) {
      return Biome.fromMap(maps.first);
    }
    return Biome();
  }

  Future<int> delete(int id) async {
    return await db.delete(
      tableBiome,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(Biome biome) async {
    return await db.update(
      tableBiome,
      biome.toMap(),
      where: '$columnId = ?',
      whereArgs: [biome.id],
    );
  }

  Future close() async => db.close();
}
