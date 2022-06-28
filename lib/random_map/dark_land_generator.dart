import 'dart:developer' as dev;
import 'dart:math';
import 'dart:typed_data';

import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/database/entity/enemy_position.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/batu/batu1.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/batu/batu2.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/batu/batu3.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/batu/batu4.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/batu/batu5.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/batu/batu6.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/batu/batu7.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/batu/batu8.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/crystal/crystal1.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/crystal/crystal10.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/crystal/crystal11.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/crystal/crystal12.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/crystal/crystal13.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/crystal/crystal2.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/crystal/crystal3.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/crystal/crystal4.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/crystal/crystal5.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/crystal/crystal6.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/crystal/crystal7.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/crystal/crystal8.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/crystal/crystal9.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/crystal/crystal_ngambang.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/crystal/crystal_ngambang_2.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/rumput/rumput1.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/rumput/rumput2.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/rumput/rumput3.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/rumput/rumput4.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/tree/pohon_tumbang.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/tree/rambat.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/tree/semak.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/tree/tree1_2x2.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/tree/tree1_2x3.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/tree/tree2_2x2.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/tree/tree2_2x3.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/tree/tree3_2x2.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/tree/tree3_2x3.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/tree/tree4_2x2.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/tree/tree4_2x3.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/tree/tree5_2x2.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/tree/tree5_2x3.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/tree/tree6_2x3.dart';
import 'package:final_project_ai/shared/decoration/dark_land_decoration/tree/tree_5x5.dart';
import 'package:final_project_ai/shared/enemy/slime.dart';
import '../database/entity/decoration_position.dart';
import '../main.dart';

class DarkLandGenerator {
  static int maxEnemy = 40;
  static int enemyCount = 0;
  static List<double> playerPosition = [0, 0];
  static List<EnemyPosition> enemyPosition = [];
  static List<double> exitPotition = [0.0, 0.0];
  static List<DecorationPosition> decorationPosition = [];
  static const List<String> floor = [
    'tile/dark_land/lantai/uallantai.png',
    'tile/dark_land/lantai/ualantai.png',
    'tile/dark_land/lantai/uarlantai.png',
    'tile/dark_land/lantai/ullantai.png',
    //4
    'tile/dark_land/lantai/lantai-1.png',
    'tile/dark_land/lantai/urlantai.png',
    'tile/dark_land/lantai/ubllantai.png',
    'tile/dark_land/lantai/ublantai.png',
    //8
    'tile/dark_land/lantai/ubrlantai.png',
    'tile/dark_land/lantai/tallantai.png',
    'tile/dark_land/lantai/tarlantai.png',
    'tile/dark_land/lantai/tbllantai.png',
    //12
    'tile/dark_land/lantai/tbrlantai.png',
  ];

  static const List<String> rfloor = [
    'tile/dark_land/lantai/lantai-1.png',
    'tile/dark_land/lantai/lantai-2.png',
    'tile/dark_land/lantai/lantai-3.png',
    'tile/dark_land/lantai/lantai-4.png',
    'tile/dark_land/lantai/lantai-5.png',
    'tile/dark_land/lantai/lantai-6.png',
    'tile/dark_land/lantai/lantai-7.png',
    'tile/dark_land/lantai/lantai-8.png',
  ];

  static const List<String> tebing = [
    'tile/dark_land/tebing/tebingtl.png',
    'tile/dark_land/tebing/tebingt.png',
    'tile/dark_land/tebing/tebingtr.png',
    'tile/dark_land/tebing/tebingbl.png',
    'tile/dark_land/tebing/tebingb.png',
    'tile/dark_land/tebing/tebingbr.png',
  ];
  static int idxDec = 0, idxEnm = 0;

  static TileModel getTile(int i, int j, int id) {
    return TileModel(
      sprite: TileModelSprite(
        path: rfloor[Random().nextInt(8)],
      ),
      x: j.toDouble(),
      y: i.toDouble(),
      width: tileSize,
      height: tileSize,
    );
  }

  static TileModel getTileTebing(int i, int j, int id) {
    return TileModel(
      sprite: TileModelSprite(path: tebing[id]),
      x: j.toDouble(),
      y: i.toDouble(),
      width: tileSize,
      height: tileSize,
    );
  }

  static TileModel getTilePinggir(int i, int j, int id) {
    List<CollisionArea> collisions = [];
    if (id == 0) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 0.3, tileSize * 0.3),
          align: Vector2(0.5 * tileSize, 0),
        ),
        CollisionArea.rectangle(
          size: Vector2(tileSize * 0.3, tileSize * 0.3),
          align: Vector2(0.25 * tileSize, 0.25 * tileSize),
        ),
        CollisionArea.rectangle(
          size: Vector2(tileSize * 0.3, tileSize * 0.3),
          align: Vector2(0, 0.5 * tileSize),
        ),
      ]);
    } else if (id == 1) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize, tileSize * 0.2),
          align: Vector2.zero(),
        ),
      ]);
    } else if (id == 2) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 0.3, tileSize * 0.3),
          align: Vector2.zero(),
        ),
        CollisionArea.rectangle(
          size: Vector2(tileSize * 0.3, tileSize * 0.3),
          align: Vector2(0.5 * tileSize, 0.5 * tileSize),
        ),
        CollisionArea.rectangle(
          size: Vector2(tileSize * 0.3, tileSize * 0.3),
          align: Vector2(0.25 * tileSize, 0.25 * tileSize),
        ),
      ]);
    } else if (id == 3) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 0.2, tileSize),
          align: Vector2.zero(),
        ),
      ]);
    } else if (id == 5) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 0.2, tileSize),
          align: Vector2(tileSize * 0.8, 0),
        ),
      ]);
    } else if (id == 6) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 0.3, tileSize * 0.3),
          align: Vector2.zero(),
        ),
        CollisionArea.rectangle(
          size: Vector2(tileSize * 0.3, tileSize * 0.3),
          align: Vector2(0.5 * tileSize, 0.5 * tileSize),
        ),
        CollisionArea.rectangle(
          size: Vector2(tileSize * 0.3, tileSize * 0.3),
          align: Vector2(0.25 * tileSize, 0.25 * tileSize),
        ),
      ]);
    } else if (id == 7) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize, tileSize * 0.2),
          align: Vector2(0, tileSize * 0.8),
        ),
      ]);
    } else if (id == 8) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 0.3, tileSize * 0.3),
          align: Vector2(0.5 * tileSize, 0),
        ),
        CollisionArea.rectangle(
          size: Vector2(tileSize * 0.3, tileSize * 0.3),
          align: Vector2(0.25 * tileSize, 0.25 * tileSize),
        ),
        CollisionArea.rectangle(
          size: Vector2(tileSize * 0.3, tileSize * 0.3),
          align: Vector2(0, 0.5 * tileSize),
        ),
      ]);
    } else if (id == 9) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 0.2, tileSize * 0.2),
          align: Vector2.zero(),
        ),
      ]);
    } else if (id == 10) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 0.2, tileSize * 0.2),
          align: Vector2(tileSize * 0.8, 0),
        ),
      ]);
    } else if (id == 11) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 0.2, tileSize * 0.2),
          align: Vector2(0, tileSize * 0.8),
        ),
      ]);
    } else if (id == 12) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 0.2, tileSize * 0.2),
          align: Vector2(tileSize * 0.8, tileSize * 0.8),
        ),
      ]);
    }
    return TileModel(
      sprite: TileModelSprite(path: floor[id]),
      x: j.toDouble(),
      y: i.toDouble(),
      width: tileSize,
      height: tileSize,
      collisions: collisions,
    );
  }

  static void decorasiLantai(int i, int j) {
    if (Random().nextInt(100) < 1) {
      //rumput1
      decorationPosition.add(DecorationPosition());
      decorationPosition[idxDec].x = i;
      decorationPosition[idxDec].y = j;
      decorationPosition[idxDec].value = 1;
      idxDec++;
    } else if (Random().nextInt(100) < 1) {
      //rumput2
      decorationPosition.add(DecorationPosition());
      decorationPosition[idxDec].x = i;
      decorationPosition[idxDec].y = j;
      decorationPosition[idxDec].value = 2;
      idxDec++;
    } else if (Random().nextInt(100) < 1) {
      //rumput3
      decorationPosition.add(DecorationPosition());
      decorationPosition[idxDec].x = i;
      decorationPosition[idxDec].y = j;
      decorationPosition[idxDec].value = 3;
      idxDec++;
    } else if (Random().nextInt(100) < 1) {
      //rumput4
      decorationPosition.add(DecorationPosition());
      decorationPosition[idxDec].x = i;
      decorationPosition[idxDec].y = j;
      decorationPosition[idxDec].value = 4;
      idxDec++;
    } else if (Random().nextInt(100) < 1) {
      //crystal4
      decorationPosition.add(DecorationPosition());
      decorationPosition[idxDec].x = i;
      decorationPosition[idxDec].y = j;
      decorationPosition[idxDec].value = 5;
      idxDec++;
    } else if (Random().nextInt(100) < 1) {
      //crystal5
      decorationPosition.add(DecorationPosition());
      decorationPosition[idxDec].x = i;
      decorationPosition[idxDec].y = j;
      decorationPosition[idxDec].value = 6;
      idxDec++;
    } else if (Random().nextInt(100) < 1) {
      //crystal6
      decorationPosition.add(DecorationPosition());
      decorationPosition[idxDec].x = i;
      decorationPosition[idxDec].y = j;
      decorationPosition[idxDec].value = 6;
      idxDec++;
    }
  }

  static void destroyableCrystalObject1x1(int i, int j) {
    //crystal1
    if (1 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 1;
      idxEnm++;
    }
    //crystal2
    else if (1 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 2;
      idxEnm++;
    }
    //crystal3
    else if (1 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i - 1;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 3;
      idxEnm++;
    }
    //crystal7
    else if (1 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i - 1;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 4;
      idxEnm++;
    }
    //crystal8
    else if (1 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i - 1;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 5;
      idxEnm++;
    }
    //crystal9
    else if (1 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i - 1;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 6;
      idxEnm++;
    }
  }

  static void destroyableCrystalObject2x2(int i, int j) {
    //crystal11
    if (1 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 7;
      idxEnm++;
    }
    //crystal12
    else if (1 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 8;
      idxEnm++;
    }
  }

  static void destroyableCrystalObject1x2(int i, int j) {
    //crystal10
    if (1 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 9;
      idxEnm++;
    }
    //crystal_ngambang
    else if (1 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 10;
      idxEnm++;
    }
    //crystal_ngambang_2
    else if (1 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 11;
      idxEnm++;
    }
  }

  static void destroyableCrystalObject2x1(int i, int j) {
    //crystal13
    if (1 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 12;
      idxEnm++;
    }
  }

  static void destroyableRockObject1x1(int i, int j) {
    //batu1
    if (1 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 13;
      idxEnm++;
    }
    //batu2
    else if (1 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 14;
      idxEnm++;
    }
    //batu3
    else if (1 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 15;
      idxEnm++;
    }
    //batu4
    else if (1 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 16;
      idxEnm++;
    }
    //batu6
    else if (1 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 17;
      idxEnm++;
    }
    //batu7
    else if (1 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 18;
      idxEnm++;
    }
  }

  static void destroyableRockObject2x1(int i, int j) {
    //batu5
    if (1 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 19;
      idxEnm++;
    }
  }

  static void destroyableRockObject2x2(int i, int j) {
    //batu8
    if (1 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 20;
      idxEnm++;
    }
  }

  static void destroyableTreeObject1x1(int i, int j) {
    //semak
    if (5 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 21;
      idxEnm++;
    }
  }

  static void destroyableTreeObject2x2(int i, int j) {
    //tree12x2
    if (5 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 22;
      idxEnm++;
    }
    //tree22x2
    else if (5 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 23;
      idxEnm++;
    }
    //tree32x2
    else if (5 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 24;
      idxEnm++;
    }
    //tree42x2
    else if (5 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 25;
      idxEnm++;
    }
    //tree52x2
    else if (5 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 26;
      idxEnm++;
    }
  }

  static void destroyableTreeObject2x3(int i, int j) {
    //tree12x3
    if (5 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 27;
      idxEnm++;
    }
    //tree22x3
    else if (5 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 28;
      idxEnm++;
    }
    //tree32x3
    else if (5 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 29;
      idxEnm++;
    }
    //tree42x3
    else if (5 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 30;
      idxEnm++;
    }
    //tree52x3
    else if (5 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 31;
      idxEnm++;
    }
    //tree62x3
    else if (5 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 32;
      idxEnm++;
    }
  }

  static void destroyableTreeObject3x2(int i, int j) {
    //pohon_tumbang
    if (5 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 33;
      idxEnm++;
    }
  }

  static void destroyableTreeObject5x5(int i, int j) {
    //tree5x5
    if (5 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 34;
      idxEnm++;
    }
  }

  static MapWorld map() {
    List<Uint8List> protoMap1 = List.generate(80, (index) => Uint8List(80));
    bool isPps = false;
    Uint8List x = Uint8List(1000);
    enemyCount = 0;
    Uint8List y = Uint8List(1000);
    List<String> arah = ["NORTH", "SOUTH", "EAST", "WEST"];
    List<TileModel> tileList = [];
    String langkah = "";
    int i = 1, j = 0;
    x[0] = Random().nextInt(69) + 6;
    y[0] = Random().nextInt(69) + 6;
    decorationPosition = [];
    enemyPosition = [];
    idxEnm = 0;
    idxDec = 0;
    while (i < 1000) {
      langkah = arah[Random().nextInt(4)];
      if (langkah == "EAST" &&
          (x[i - 1] < 75) &&
          (y[i - 1] > 3) &&
          (x[i - 1] > 1) &&
          (y[i - 1] < 77)) {
        x[i] = x[i - 1] + 2;
        y[i] = y[i - 1];
        protoMap1[y[i]][x[i]] = 5;
        protoMap1[y[i] + 1][x[i]] = 5;
        protoMap1[y[i]][x[i] + 1] = 5;
        protoMap1[y[i] + 1][x[i] + 1] = 5;
        i++;
      } else if (langkah == "SOUTH" &&
          (x[i - 1] > 5) &&
          (y[i - 1] > 3) &&
          (x[i - 1] < 79) &&
          (y[i - 1] < 77)) {
        x[i] = x[i - 1] - 2;
        y[i] = y[i - 1];
        protoMap1[y[i]][x[i]] = 5;
        protoMap1[y[i] + 1][x[i]] = 5;
        protoMap1[y[i]][x[i] + 1] = 5;
        protoMap1[y[i] + 1][x[i] + 1] = 5;
        i++;
      } else if (langkah == "NORTH" &&
          (y[i - 1] < 75) &&
          (x[i - 1] < 77) &&
          (x[i - 1] > 3) &&
          (y[i - 1] > 1)) {
        x[i] = x[i - 1];
        y[i] = y[i - 1] + 2;
        protoMap1[y[i]][x[i]] = 5;
        protoMap1[y[i] + 1][x[i]] = 5;
        protoMap1[y[i]][x[i] + 1] = 5;
        protoMap1[y[i] + 1][x[i] + 1] = 5;
        i++;
      } else if (langkah == "WEST" &&
          (y[i - 1] > 5) &&
          (x[i - 1] < 77) &&
          (y[i - 1] < 79) &&
          (x[i - 1] > 3)) {
        x[i] = x[i - 1];
        y[i] = y[i - 1] - 2;
        protoMap1[y[i]][x[i]] = 5;
        protoMap1[y[i] + 1][x[i]] = 5;
        protoMap1[y[i]][x[i] + 1] = 5;
        protoMap1[y[i] + 1][x[i] + 1] = 5;
        i++;
      }
    }
    i = 0;
    j = 0;
    List<Uint8List> protoMap2 = [];
    i = 0;
    j = 0;
    for (i = 0; i < 80; i++) {
      protoMap2.add(protoMap1[i]);
    }
    int rowLengthC = protoMap2.length - 1;
    List.generate(rowLengthC, (i) {
      List.generate(79, (j) {
        if (i > 0 && j > 0) {
          //lantai bawah kiri
          if (protoMap2[i][j] != 0) {
            if (protoMap2[i][j - 1] == 0 &&
                protoMap2[i + 1][j] == 0 &&
                protoMap2[i - 1][j + 1] != 0) {
              protoMap2[i][j] = 7;
              tileList.add(getTilePinggir(i, j, protoMap2[i][j] - 1));
              if (protoMap2[i + 2][j] == 0) {
                tileList.add(getTileTebing(i + 1, j, 0));
                tileList.add(getTileTebing(i + 2, j, 3));
              } else {
                tileList.add(getTileTebing(i + 2, j, 3));
              }
              decorasiLantai(i, j);
              if (Random().nextInt(20) < 3) {
                decorationPosition.add(DecorationPosition());
                decorationPosition[idxDec].x = i + 1;
                decorationPosition[idxDec].y = j;
                decorationPosition[idxDec].value = 0;
                idxDec++;
              }
              if (isPps == false) {
                playerPosition[0] = i - 0.5;
                playerPosition[1] = j + 0.5;
                isPps = true;
              }
              exitPotition[0] = i - 0.5;
              exitPotition[1] = j + 0.5;
              return;
            }
            //lantai bawah kanan
            if (protoMap2[i][j + 1] == 0 &&
                protoMap2[i + 1][j] == 0 &&
                protoMap2[i - 1][j - 1] != 0) {
              protoMap2[i][j] = 9;
              tileList.add(getTilePinggir(i, j, protoMap2[i][j] - 1));
              if (protoMap2[i + 2][j] == 0) {
                tileList.add(getTileTebing(i + 1, j, 2));
                tileList.add(getTileTebing(i + 2, j, 5));
              } else {
                tileList.add(getTileTebing(i + 2, j, 5));
              }
              decorasiLantai(i, j);
              if (Random().nextInt(20) < 3) {
                decorationPosition.add(DecorationPosition());
                decorationPosition[idxDec].x = i + 1;
                decorationPosition[idxDec].y = j;
                decorationPosition[idxDec].value = 0;
                idxDec++;
              }
              if (isPps == false) {
                playerPosition[0] = i - 0.5;
                playerPosition[1] = j - 0.5;
                isPps = true;
              }
              exitPotition[0] = i - 0.5;
              exitPotition[1] = j - 0.5;

              return;
            }
            //lantai atas kanan
            if (protoMap2[i][j + 1] == 0 &&
                protoMap2[i - 1][j] == 0 &&
                protoMap2[i + 1][j - 1] != 0) {
              protoMap2[i][j] = 3;
              tileList.add(getTilePinggir(i, j, protoMap2[i][j] - 1));
              decorasiLantai(i, j);
              if (isPps == false) {
                playerPosition[0] = i + 0.5;
                playerPosition[1] = j - 0.5;
                isPps = true;
              }
              exitPotition[0] = i + 0.5;
              exitPotition[1] = j - 0.5;
              return;
            }
            //lantai atas kiri
            if (protoMap2[i][j - 1] == 0 &&
                protoMap2[i - 1][j] == 0 &&
                protoMap2[i + 1][j + 1] != 0) {
              protoMap2[i][j] = 1;
              tileList.add(getTilePinggir(i, j, protoMap2[i][j] - 1));
              decorasiLantai(i, j);
              if (isPps == false) {
                playerPosition[0] = i + 0.5;
                playerPosition[1] = j + 0.5;
                isPps = true;
              }
              exitPotition[0] = i + 0.5;
              exitPotition[1] = j + 0.5;
              return;
            }

            //lantai ujung atas kanan
            if (protoMap2[i - 1][j + 1] == 0 &&
                protoMap2[i][j + 1] != 0 &&
                protoMap2[i - 1][j] != 0) {
              protoMap2[i][j] = 11;
              tileList.add(getTilePinggir(i, j, protoMap2[i][j] - 1));
              decorasiLantai(i, j);
              return;
            }
            //lantai ujung atas kiri
            if (protoMap2[i - 1][j - 1] == 0 &&
                protoMap2[i][j - 1] != 0 &&
                protoMap2[i - 1][j] != 0) {
              protoMap2[i][j] = 10;
              tileList.add(getTilePinggir(i, j, protoMap2[i][j] - 1));
              decorasiLantai(i, j);
              return;
            }
            //lantai ujung bawah kiri
            if (protoMap2[i + 1][j - 1] == 0 &&
                protoMap2[i][j - 1] != 0 &&
                protoMap2[i + 1][j] != 0) {
              protoMap2[i][j] = 12;
              tileList.add(getTilePinggir(i, j, protoMap2[i][j] - 1));
              decorasiLantai(i, j);
              return;
            }
            //lantai ujung bawah kanan
            if (protoMap2[i + 1][j + 1] == 0 &&
                protoMap2[i][j + 1] != 0 &&
                protoMap2[i + 1][j] != 0) {
              protoMap2[i][j] = 13;
              tileList.add(getTilePinggir(i, j, protoMap2[i][j] - 1));
              decorasiLantai(i, j);
              return;
            }

            //lantai atas
            if (protoMap2[i - 1][j] == 0 && protoMap2[i + 1][j] != 0) {
              protoMap2[i][j] = 2;
              tileList.add(getTilePinggir(i, j, protoMap2[i][j] - 1));
              decorasiLantai(i, j);
              return;
            }
            //lantai bawah
            if (protoMap2[i - 1][j] != 0 && protoMap2[i + 1][j] == 0) {
              protoMap2[i][j] = 8;
              tileList.add(getTilePinggir(i, j, protoMap2[i][j] - 1));
              decorasiLantai(i, j);
              if (protoMap2[i + 2][j] == 0) {
                tileList.add(getTileTebing(i + 1, j, 1));
                tileList.add(getTileTebing(i + 2, j, 4));
              } else {
                tileList.add(getTileTebing(i + 2, j, 4));
              }
              if (Random().nextInt(20) < 3) {
                decorationPosition.add(DecorationPosition());
                decorationPosition[idxDec].x = i + 1;
                decorationPosition[idxDec].y = j;
                decorationPosition[idxDec].value = 0;
                idxDec++;
              }
              return;
            }
            //lantai kanan
            if (protoMap2[i][j + 1] == 0 && protoMap2[i][j - 1] != 0) {
              protoMap2[i][j] = 6;
              tileList.add(getTilePinggir(i, j, protoMap2[i][j] - 1));
              decorasiLantai(i, j);
              return;
            }
            //lantai kiri
            if (protoMap2[i][j - 1] == 0 && protoMap2[i][j + 1] != 0) {
              protoMap2[i][j] = 4;
              tileList.add(getTilePinggir(i, j, protoMap2[i][j] - 1));
              decorasiLantai(i, j);
              return;
            }
            if (protoMap2[i][j] != 0) {
              tileList.add(getTile(i, j, 4));
              decorasiLantai(i, j);
              if ((3 > Random().nextInt(100)) && (enemyCount < maxEnemy)) {
                enemyPosition.add(EnemyPosition());
                enemyPosition[idxEnm].x = i;
                enemyPosition[idxEnm].y = j;
                enemyPosition[idxEnm].value = 0;
                idxEnm++;
                enemyCount++;
              }
              return;
            }
          }
        }
      });
    });

    int v = 0;
    int idxIndi = 0;

    for (i = 0; i < rowLengthC; i++) {
      v = 0;
      for (j = 0; j < 79; j++) {
        if (protoMap2[i][j] == 5) {
          idxIndi = idxEnm;
          if (idxIndi == idxEnm) {
            destroyableCrystalObject1x1(i, j);
          }
          if (idxIndi == idxEnm) {
            if (protoMap2[i][j + 1] == 5) {
              destroyableCrystalObject2x1(i, j);
              if (idxIndi != idxEnm) {
                j++;
              }
            }
          }
          if (idxIndi == idxEnm) {
            if (protoMap2[i + 1][j + 1] == 5) {
              destroyableCrystalObject2x2(i, j);
              if (idxIndi != idxEnm) {
                j++;
              }
              if (v < 1) {
                v = 1;
              }
            }
          }
          if (idxIndi == idxEnm) {
            if (protoMap2[i + 1][j] == 5) {
              destroyableCrystalObject1x2(i, j);
              if (v < 1) {
                v = 1;
              }
            }
          }
          if (idxIndi == idxEnm) {
            destroyableRockObject1x1(i, j);
          }
          if (idxIndi == idxEnm) {
            if (protoMap2[i + 1][j + 1] == 5) {
              destroyableRockObject2x2(i, j);
              if (idxIndi != idxEnm) {
                j++;
              }
              if (v < 1) {
                v = 1;
              }
            }
          }
          if (idxIndi == idxEnm) {
            if (protoMap2[i][j + 1] == 5) {
              destroyableRockObject2x1(i, j);
              if (idxIndi != idxEnm) {
                j++;
              }
            }
          }
          if (idxIndi == idxEnm) {
            destroyableTreeObject1x1(i, j);
          }
          if (idxIndi == idxEnm) {
            if (protoMap2[i + 1][j + 1] == 5) {
              destroyableTreeObject2x2(i, j);
              if (idxIndi != idxEnm) {
                j++;
              }
              if (v < 1) {
                v = 1;
              }
            }
          }
          if (idxIndi == idxEnm) {
            if (i < 78 && j < 79) {
              if ((protoMap2[i + 2][j + 1] == 5) &&
                  (protoMap2[i + 2][j] == 5)) {
                destroyableTreeObject2x3(i, j);
                if (idxIndi != idxEnm) {
                  j++;
                }
                if (v < 2) {
                  v = 2;
                }
              }
            }
          }
          if (idxIndi == idxEnm) {
            if (i < 79 && j < 78) {
              if ((protoMap2[i + 1][j + 2] == 5) &&
                  (protoMap2[i + 1][j + 1] == 5) &&
                  (protoMap2[i + 1][j] == 5)) {
                destroyableTreeObject3x2(i, j);
                if (idxIndi != idxEnm) {
                  j += 2;
                }
                if (v < 1) {
                  v = 1;
                }
              }
            }
          }
          if (idxIndi == idxEnm) {
            if (i < 76 && j < 76) {
              if ((protoMap2[i + 4][j + 4] == 5) &&
                  (protoMap2[i + 4][j + 3] == 5) &&
                  (protoMap2[i + 4][j + 2] == 5) &&
                  (protoMap2[i + 4][j + 1] == 5) &&
                  (protoMap2[i + 4][j] == 5)) {
                destroyableTreeObject5x5(i, j);
                if (idxIndi != idxEnm) {
                  j += 4;
                }
                if (v < 4) {
                  v = 4;
                }
              }
            }
          }
        }
      }
      i += v;
    }

    return MapWorld(tileList);
  }

  static List<Enemy> enemies() {
    List<Enemy> musuh = [];
    Vector2 position = Vector2.zero();
    for (int i = 0; i < idxEnm; i++) {
      position = getRelativeTilePosition(
        enemyPosition[i].y,
        enemyPosition[i].x,
      );
      if (enemyPosition[i].value == 0) {
        musuh.add(Slime(position));
      } else if (enemyPosition[i].value == 1) {
        musuh.add(Crystal1(position));
      } else if (enemyPosition[i].value == 2) {
        musuh.add(Crystal2(position));
      } else if (enemyPosition[i].value == 3) {
        musuh.add(Crystal3(position));
      } else if (enemyPosition[i].value == 4) {
        musuh.add(Crystal7(position));
      } else if (enemyPosition[i].value == 5) {
        musuh.add(Crystal8(position));
      } else if (enemyPosition[i].value == 6) {
        musuh.add(Crystal9(position));
      } else if (enemyPosition[i].value == 7) {
        musuh.add(Crystal11(position));
      } else if (enemyPosition[i].value == 8) {
        musuh.add(Crystal12(position));
      } else if (enemyPosition[i].value == 9) {
        musuh.add(Crystal10(position));
      } else if (enemyPosition[i].value == 10) {
        musuh.add(CrystalNgambang(position));
      } else if (enemyPosition[i].value == 11) {
        musuh.add(CrystalNgambang2(position));
      } else if (enemyPosition[i].value == 12) {
        musuh.add(Crystal13(position));
      } else if (enemyPosition[i].value == 13) {
        musuh.add(Batu1(position));
      } else if (enemyPosition[i].value == 14) {
        musuh.add(Batu2(position));
      } else if (enemyPosition[i].value == 15) {
        musuh.add(Batu3(position));
      } else if (enemyPosition[i].value == 16) {
        musuh.add(Batu4(position));
      } else if (enemyPosition[i].value == 17) {
        musuh.add(Batu6(position));
      } else if (enemyPosition[i].value == 18) {
        musuh.add(Batu7(position));
      } else if (enemyPosition[i].value == 19) {
        musuh.add(Batu5(position));
      } else if (enemyPosition[i].value == 20) {
        musuh.add(Batu8(position));
      } else if (enemyPosition[i].value == 21) {
        musuh.add(Semak(position));
      } else if (enemyPosition[i].value == 22) {
        musuh.add(Tree12x2(position));
      } else if (enemyPosition[i].value == 23) {
        musuh.add(Tree22x2(position));
      } else if (enemyPosition[i].value == 24) {
        musuh.add(Tree32x2(position));
      } else if (enemyPosition[i].value == 25) {
        musuh.add(Tree42x2(position));
      } else if (enemyPosition[i].value == 26) {
        musuh.add(Tree52x2(position));
      } else if (enemyPosition[i].value == 27) {
        musuh.add(Tree12x3(position));
      } else if (enemyPosition[i].value == 28) {
        musuh.add(Tree22x3(position));
      } else if (enemyPosition[i].value == 29) {
        musuh.add(Tree32x3(position));
      } else if (enemyPosition[i].value == 30) {
        musuh.add(Tree42x3(position));
      } else if (enemyPosition[i].value == 31) {
        musuh.add(Tree52x3(position));
      } else if (enemyPosition[i].value == 32) {
        musuh.add(Tree62x3(position));
      } else if (enemyPosition[i].value == 33) {
        musuh.add(PohonTumbang(position));
      } else if (enemyPosition[i].value == 34) {
        musuh.add(Tree5x5(position));
      }
    }
    return musuh;
  }

  static Vector2 getRelativeTilePosition(int x, int y) {
    return Vector2(
      (x * tileSize).toDouble(),
      (y * tileSize).toDouble(),
    );
  }

  static List<GameDecoration> decorations() {
    List<GameDecoration> decorasi = [];
    Vector2 position = Vector2.zero();
    for (int i = 0; i < idxDec; i++) {
      position = Vector2(
        decorationPosition[i].y * tileSize,
        decorationPosition[i].x * tileSize,
      );
      if (decorationPosition[i].value == 0) {
        decorasi.add(Rambat(position));
      } else if (decorationPosition[i].value == 1) {
        decorasi.add(Rumput1(position));
      } else if (decorationPosition[i].value == 2) {
        decorasi.add(Rumput2(position));
      } else if (decorationPosition[i].value == 3) {
        decorasi.add(Rumput3(position));
      } else if (decorationPosition[i].value == 4) {
        decorasi.add(Rumput4(position));
      } else if (decorationPosition[i].value == 5) {
        decorasi.add(Crystal4(position));
      } else if (decorationPosition[i].value == 6) {
        decorasi.add(Crystal5(position));
      } else if (decorationPosition[i].value == 7) {
        decorasi.add(Crystal6(position));
      }
    }
    return decorasi;
  }
}
