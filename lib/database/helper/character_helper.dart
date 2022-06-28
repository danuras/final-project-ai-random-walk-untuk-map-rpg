import 'package:flutter/material.dart';
import 'package:final_project_ai/shared/util/popup/popup.dart';
import 'package:sqflite/sqflite.dart';

import '../entity/player.dart';

class CharacterProvider {
  late Database db;

  Future open() async {
    db = await openDatabase(
      getDatabasesPath().toString() + '\\game.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
            create table player(
              name varchar(20) primary key not null,
              level int not null,
              exp int not null,
              money int not null,
              skin int not null,
              gem int not null
            )
     ''');
      },
    );
  }

  Future<int> insert(Player player, BuildContext context) async {
    if (player.name == '') {
      popup("Nama harus diisi!", context);
      return 0;
    }
    int result = 0;
    try {
      result = await db.insert(tablePlayer, player.toMap());
    } catch (ex) {
      print(ex);
      popup("Data gagal disimpan!", context);
    }
    return result;
  }

  Future<bool> isPlayerExists() async {
    List<Map<String, Object?>> maps = await db.query(
      tablePlayer,
      columns: [
        columnName,
        columnLevel,
        columnExp,
        columnMoney,
        columnSkin,
        columnGem,
      ],
    );
    return maps.length.toInt() > 0;
  }

  Future<List<Player>> getAllPlayer() async {
    List<Player> listOfPlayer = [];
    int length = 0;
    List<Map<String, Object?>> maps = await db.query(
      tablePlayer,
      columns: [
        columnName,
        columnLevel,
        columnExp,
        columnMoney,
        columnSkin,
        columnGem,
      ],
    );
    length = maps.length.toInt();
    for (int i = 0; i < length; i++) {
      listOfPlayer.add(Player.fromMap(maps[i]));
    }

    return listOfPlayer;
  }

  Future<Player> getPlayer(String name) async {
    List<Map<String, Object?>> maps = await db.query(tablePlayer,
        columns: [
          columnName,
          columnLevel,
          columnExp,
          columnMoney,
          columnSkin,
          columnGem,
        ],
        where: '$columnName = ?',
        whereArgs: [name]);
    if (maps.length.toInt() > 0) {
      return Player.fromMap(maps.first);
    }
    return Player();
  }

  Future<int> delete(String name) async {
    return await db.delete(
      tablePlayer,
      where: '$columnName = ?',
      whereArgs: [name],
    );
  }

  Future<int> update(Player player) async {
    return await db.update(
      tablePlayer,
      player.toMap(),
      where: '$columnName = ?',
      whereArgs: [player.name],
    );
  }

  Future close() async => db.close();
}
