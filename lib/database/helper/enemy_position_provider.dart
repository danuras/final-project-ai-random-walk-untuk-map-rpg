import 'package:final_project_ai/database/entity/enemy_position.dart';
import 'package:sqflite/sqflite.dart';

class EnemyPositionProvider {
  late Database db;

  Future open() async {
    db = await openDatabase(
      getDatabasesPath().toString() + '\\game.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table enemy_position(
            x int not null,
            y int not null,
            enemy_value int not null,
            sub_biome_id integer foreign key references sub_biome(id) on update cascade on delete cascade not null
          )
     ''');
      },
    );
  }

  Future<int> insert(EnemyPosition enemyPosition) async {
    return await db.insert(tableEnemyPosition, enemyPosition.toMap());
  }

  Future<EnemyPosition> getEnemyPosition(int subBiomeId) async {
    List<Map<String, Object?>> maps = await db.query(tableEnemyPosition,
        columns: [
          columnX,
          columnY,
          columnValue,
          columnSubBiomeId,
        ],
        where: '$columnSubBiomeId = ?',
        whereArgs: [subBiomeId]);
    if (maps.length.toInt() > 0) {
      return EnemyPosition.fromMap(maps.first);
    }
    return EnemyPosition();
  }

  Future<List<EnemyPosition>> getAllEnemy() async {
    List<EnemyPosition> itemList = [];
    int getLength = 0;
    List<Map<String, Object?>> maps = await db.query(
      tableEnemyPosition,
      columns: [
        columnX,
        columnY,
        columnValue,
        columnSubBiomeId,
      ],
    );
    getLength = maps.length.toInt();
    if (getLength > 0) {
      for (int i = 0; i < getLength; i++) {
        itemList.add(EnemyPosition.fromMap(maps[i]));
      }
    }
    return itemList;
  }

  Future<int> delete(int subBiomeId) async {
    return await db.delete(
      tableEnemyPosition,
      where: '$columnSubBiomeId = ?',
      whereArgs: [subBiomeId],
    );
  }

  Future<int> update(EnemyPosition enemyPosition) async {
    return await db.update(
      tableEnemyPosition,
      enemyPosition.toMap(),
      where: '$columnSubBiomeId = ?',
      whereArgs: [enemyPosition.subBiomeId],
    );
  }

  Future close() async => db.close();
}
