import 'package:final_project_ai/database/entity/stats.dart';
import 'package:sqflite/sqflite.dart';

class StatsProvider {
  late Database db;

  Future open() async {
    db = await openDatabase(
      getDatabasesPath().toString() + '\\game.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table stats(
            player_name varchar(20) foreign key references player(id) on update cascade on delete cascade not null,
            str int not null,
            intel int not null,
            vit int not null,
            agi int not null,
            dex int not null
          )
     ''');
      },
    );
  }

  Future<int> insert(Stats stats) async {
    return await db.insert(tableStats, stats.toMap());
  }

  Future<Stats> getStats(int id) async {
    List<Map<String, Object?>> maps = await db.query(tableStats,
        columns: [
          columnPlayerName,
          columnStr,
          columnInt,
          columnVit,
          columnAgi,
          columnDex,
        ],
        where: '$columnPlayerName = ?',
        whereArgs: [id]);
    if (maps.length.toInt() > 0) {
      return Stats.fromMap(maps.first);
    }
    return Stats();
  }

  Future<int> delete(int id) async {
    return await db.delete(
      tableStats,
      where: '$columnPlayerName = ?',
      whereArgs: [id],
    );
  }

  Future<int> update(Stats stats) async {
    return await db.update(
      tableStats,
      stats.toMap(),
      where: '$columnPlayerName = ?',
      whereArgs: [stats.playerName],
    );
  }

  Future close() async => db.close();
}
