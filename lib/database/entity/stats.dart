const String tableStats = 'stats';
const String columnStr = 'str';
const String columnInt = 'int';
const String columnVit = 'vit';
const String columnAgi = 'agi';
const String columnDex = 'amount';
const String columnPlayerName = 'player_name';

class Stats {
  late int str, intel, vit, agi, dex;
  late String playerName;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnStr: str,
      columnInt: intel,
      columnVit: vit,
      columnAgi: agi,
      columnDex: dex,
      columnPlayerName: playerName,
    };
    return map;
  }

  Stats();

  Stats.fromMap(Map<String, Object?> map) {
    str = int.parse(map[columnStr].toString());
    intel = int.parse(map[columnInt].toString());
    vit = int.parse(map[columnVit].toString());
    agi = int.parse(map[columnAgi].toString());
    dex = int.parse(map[columnDex].toString());
    playerName = map[columnPlayerName].toString();
  }
}
