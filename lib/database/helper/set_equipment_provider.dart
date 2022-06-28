import 'package:final_project_ai/database/entity/set_equipment.dart';
import 'package:sqflite/sqflite.dart';

class SetEquipmentProvider {
  late Database db;

  Future open() async {
    db = await openDatabase(
      getDatabasesPath().toString() + '\\game.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          create table set_equipment(
            player_name varchar(20) foreign key references player(id) on update cascade on delete cascade not null,
            weapon_id int not null,
            sub_weapon_id int not null,
            gloves_id int not null,
            clothes_id int not null,
            accessories_id int not null,
            shoes_id int not null,
            ring_id int not null
          )
     ''');
      },
    );
  }

  Future<int> insert(SetEquipment setEquipment) async {
    return await db.insert(tableSetEquipment, setEquipment.toMap());
  }

  Future<SetEquipment> getSetEquipment(String name) async {
    List<Map<String, Object?>> maps = await db.query(tableSetEquipment,
        columns: [
          columnPlayerName,
          columnWeaponId,
          columnSubWeaponId,
          columnGlovesId,
          columnClothesId,
          columnAccessoriesId,
          columnShoesId,
          columnRingId,
        ],
        where: '$columnPlayerName = ?',
        whereArgs: [name]);
    if (maps.length.toInt() > 0) {
      return SetEquipment.fromMap(maps.first);
    }
    return SetEquipment();
  }

  Future<int> delete(String name) async {
    return await db.delete(
      tableSetEquipment,
      where: '$columnPlayerName = ?',
      whereArgs: [name],
    );
  }

  Future<int> update(SetEquipment setEquipment) async {
    return await db.update(
      tableSetEquipment,
      setEquipment.toMap(),
      where: '$columnPlayerName = ?',
      whereArgs: [setEquipment.playerName],
    );
  }

  Future close() async => db.close();
}
