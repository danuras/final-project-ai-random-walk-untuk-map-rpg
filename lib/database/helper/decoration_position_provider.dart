import 'package:final_project_ai/database/entity/decoration_position.dart';
import 'package:sqflite/sqflite.dart';

class DecorationPositionProvider {
  late Database db;

  Future open() async {
    db = await openDatabase(
      getDatabasesPath().toString() + '\\game.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table decoration_position(
            x int not null,
            y int not null,
            decoration_value int not null,
            sub_biome_id integer references sub_biome(id) on update cascade on delete cascade not null
          )
     ''');
      },
    );
  }

  Future<int> insert(DecorationPosition decorationPosition) async {
    return await db.insert(tableDecorationPosition, decorationPosition.toMap());
  }

  Future<DecorationPosition> getDecoration(int subBiomeId) async {
    List<Map<String, Object?>> maps = await db.query(tableDecorationPosition,
        columns: [
          columnX,
          columnY,
          columnValue,
          columnSubBiomeId,
        ],
        where: '$columnSubBiomeId = ?',
        whereArgs: [subBiomeId]);
    if (maps.length.toInt() > 0) {
      return DecorationPosition.fromMap(maps.first);
    }
    return DecorationPosition();
  }

  Future<List<DecorationPosition>> getAllDecoration() async {
    List<DecorationPosition> itemList = [];
    int getLength = 0;
    List<Map<String, Object?>> maps = await db.query(
      tableDecorationPosition,
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
        itemList.add(DecorationPosition.fromMap(maps[i]));
      }
    }
    return itemList;
  }

  Future<int> delete(int subBiomeId) async {
    return await db.delete(
      tableDecorationPosition,
      where: '$columnSubBiomeId = ?',
      whereArgs: [subBiomeId],
    );
  }

  Future<int> update(DecorationPosition decorationPosition) async {
    return await db.update(
      tableDecorationPosition,
      decorationPosition.toMap(),
      where: '$columnSubBiomeId = ?',
      whereArgs: [decorationPosition.subBiomeId],
    );
  }

  Future close() async => db.close();
}
