const String tablePlayer = 'player';
const String columnName = 'name';
const String columnLevel = 'level';
const String columnExp = 'exp';
const String columnMoney = 'money';
const String columnSkin = 'skin';
const String columnGem = 'gem';

class Player {
  late String name;
  late int level;
  late int exp;
  late int money;
  late int skin;
  late int gem;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnLevel: level,
      columnExp: exp,
      columnMoney: money,
      columnSkin: skin,
      columnGem: gem,
    };
    if (name.isNotEmpty) {
      map[columnName] = name;
    }
    return map;
  }

  Player();

  Player.fromMap(Map<String, Object?> map) {
    name = map[columnName].toString();
    level = int.parse(map[columnLevel].toString());
    exp = int.parse(map[columnExp].toString());
    money = int.parse(map[columnMoney].toString());
    skin = int.parse(map[columnSkin].toString());
    gem = int.parse(map[columnGem].toString());
  }
}
