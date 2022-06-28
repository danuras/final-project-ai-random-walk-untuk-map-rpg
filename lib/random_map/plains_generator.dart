import 'dart:developer' as dev;
import 'dart:math';
import 'dart:typed_data';

import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/database/entity/enemy_position.dart';
import 'package:final_project_ai/shared/decoration/green_place/tree/pohon_tumbang.dart';
import 'package:final_project_ai/shared/decoration/green_place/tree/semak.dart';
import 'package:final_project_ai/shared/decoration/green_place/tree/tree1_2x2.dart';
import 'package:final_project_ai/shared/decoration/green_place/tree/tree1_2x3.dart';
import 'package:final_project_ai/shared/decoration/green_place/tree/tree2_2x2.dart';
import 'package:final_project_ai/shared/decoration/green_place/tree/tree2_2x3.dart';
import 'package:final_project_ai/shared/decoration/green_place/tree/tree3_2x2.dart';
import 'package:final_project_ai/shared/decoration/green_place/tree/tree3_2x3.dart';
import 'package:final_project_ai/shared/decoration/green_place/tree/tree4_2x2.dart';
import 'package:final_project_ai/shared/decoration/green_place/tree/tree4_2x3.dart';
import 'package:final_project_ai/shared/decoration/green_place/tree/tree5_2x2.dart';
import 'package:final_project_ai/shared/decoration/green_place/tree/tree5_2x3.dart';
import 'package:final_project_ai/shared/decoration/green_place/tree/tree6_2x3.dart';
import 'package:final_project_ai/shared/decoration/green_place/tree/tree_5x5.dart';
import 'package:final_project_ai/shared/enemy/slime.dart';
import '../database/entity/decoration_position.dart';
import '../main.dart';

class PlainsGenerator {
  static int maxEnemy = 40;
  static int enemyCount = 0;
  static List<double> playerPosition = [0, 0];
  static List<EnemyPosition> enemyPosition = [];
  static List<double> exitPotition = [0.0, 0.0];
  static List<DecorationPosition> decorationPosition = [];
  static const List<String> tembok = [
    'tile/green_place/tembok/tembokibl.png',
    'tile/green_place/tembok/tembokial.png',
    'tile/green_place/tembok/tembokb.png',
    'tile/green_place/tembok/temboka.png',
    'tile/green_place/tembok/tembokibr.png',
    'tile/green_place/tembok/tembokiar.png',
    'tile/green_place/tembok/tembokobl.png',
    'tile/green_place/tembok/tembokoal.png',
    'tile/green_place/tembok/tembokobr.png',
    'tile/green_place/tembok/tembokoar.png',
    //10
    'tile/green_place/tembok/tembokpbl.png',
    'tile/green_place/tembok/tembokpb.png',
    'tile/green_place/tembok/tembokpbr.png',
    'tile/green_place/tembok/tembokl.png',
    'tile/green_place/tembok/tembokr.png',
    'tile/green_place/tembok/tembokpal.png',
    'tile/green_place/tembok/tembokpa.png',
    'tile/green_place/tembok/tembokpar.png',
    //18
    'tile/green_place/tangga/tanggamuda1.png',
    'tile/green_place/tangga/tanggamuda2.png',
    'tile/green_place/tangga/tanggamuda3.png',
    'tile/green_place/tangga/tanggamuda4.png',
    'tile/green_place/tangga/tanggamuda5.png',
    'tile/green_place/tangga/tanggamuda6.png',
    //24
    'tile/green_place/tangga/tanggamudaatas1.png',
    'tile/green_place/tangga/tanggamudaatas2.png',
    'tile/green_place/tangga/tanggamudaatas3.png',
    'tile/green_place/tangga/tanggamudaatas4.png',
  ];
  static int idxDec = 0, idxEnm = 0;

  static TileModel getTile(int i, int j) {
    List<CollisionArea> collisions = [];
    if (i == 0 && j == 0) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize, tileSize * 8 / 32),
          align: Vector2(0, 0),
        ),
        CollisionArea.rectangle(
          size: Vector2(tileSize * 8 / 32, tileSize * 24 / 32),
          align: Vector2(0, tileSize * 8 / 32),
        ),
      ]);
    } else if (i == 0 && j == 118) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize, tileSize * 8 / 32),
          align: Vector2(0, 0),
        ),
        CollisionArea.rectangle(
          size: Vector2(tileSize * 8 / 32, tileSize * 24 / 32),
          align: Vector2(tileSize * 24 / 32, tileSize * 8 / 32),
        ),
      ]);
    } else if (j == 0 && i == 118) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize, tileSize * 8 / 32),
          align: Vector2(tileSize * 0 / 32, tileSize * 24 / 32),
        ),
        CollisionArea.rectangle(
          size: Vector2(tileSize * 8 / 32, tileSize * 24 / 32),
          align: Vector2(tileSize * 0 / 32, tileSize * 0 / 32),
        ),
      ]);
    } else if (j == 118 && i == 118) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize, tileSize * 8 / 32),
          align: Vector2(tileSize * 0 / 32, tileSize * 24 / 32),
        ),
        CollisionArea.rectangle(
          size: Vector2(tileSize * 8 / 32, tileSize * 24 / 32),
          align: Vector2(tileSize * 24 / 32, tileSize * 0 / 32),
        ),
      ]);
    } else if (j == 0) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 8 / 32, tileSize * 32 / 32),
          align: Vector2(tileSize * 0 / 32, tileSize * 0 / 32),
        ),
      ]);
    } else if (i == 0) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 32 / 32, tileSize * 8 / 32),
          align: Vector2(tileSize * 0 / 32, tileSize * 0 / 32),
        ),
      ]);
    } else if (j == 118) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 8 / 32, tileSize * 32 / 32),
          align: Vector2(tileSize * 24 / 32, tileSize * 0 / 32),
        ),
      ]);
    } else if (i == 118) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 32 / 32, tileSize * 8 / 32),
          align: Vector2(tileSize * 0 / 32, tileSize * 24 / 32),
        ),
      ]);
    }
    return TileModel(
      sprite: TileModelSprite(
        path: 'tile/green_place/land/ground-' +
            (1 + Random().nextInt(31)).toString() +
            '.png',
      ),
      x: j.toDouble(),
      y: i.toDouble(),
      width: tileSize,
      height: tileSize,
      collisions: collisions,
    );
  }

  static TileModel getTileWall(int i, int j, int id) {
    List<CollisionArea> collisions = [];
    //tembok in out kiri
    if (id == 0 || id == 1 || id == 6 || id == 7) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 20 / 32, tileSize),
          align: Vector2(12 / 32 * tileSize, 0),
        ),
      ]);
    }
    //tembok in out kanan
    else if (id == 4 || id == 5 || id == 8 || id == 9) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 20 / 32, tileSize),
          align: Vector2(0 / 32 * tileSize, 0),
        ),
      ]);
    }
    //tembok tengah
    else if (id == 2 || id == 3) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 32 / 32, tileSize),
          align: Vector2(0 / 32 * tileSize, 0),
        ),
      ]);
    }
    //tembok pojok atas bawah
    else if (id == 11 || id == 16) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize, tileSize * 8 / 32),
          align: Vector2(0 / 32 * tileSize, 0),
        ),
      ]);
    }
    //tembok pojok atas kiri
    else if (id == 15) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 8 / 32, tileSize),
          align: Vector2(12 / 32 * tileSize, 0),
        ),
      ]);
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 12 / 32, tileSize * 8 / 32),
          align: Vector2(20 / 32 * tileSize, 0),
        ),
      ]);
    }
    //tembok pojok atas kanan
    else if (id == 17) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 8 / 32, tileSize),
          align: Vector2(12 / 32 * tileSize, 0),
        ),
      ]);
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 12 / 32, tileSize * 8 / 32),
          align: Vector2(0 / 32 * tileSize, 0),
        ),
      ]);
    }
    //tembok pojok bawah kiri
    else if (id == 10) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 20 / 32, tileSize * 8 / 32),
          align: Vector2(12 / 32 * tileSize, 0),
        ),
      ]);
    }
    //tembok pojok bawah kanan
    else if (id == 12) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 20 / 32, tileSize * 8 / 32),
          align: Vector2(0 / 32 * tileSize, 0),
        ),
      ]);
    }
    //tembok pojok bawah kanan
    else if (id == 13 || id == 14) {
      collisions.addAll([
        CollisionArea.rectangle(
          size: Vector2(tileSize * 8 / 32, tileSize * 32 / 32),
          align: Vector2(12 / 32 * tileSize, 0),
        ),
      ]);
    }
    return TileModel(
      sprite: TileModelSprite(path: tembok[id]),
      x: j.toDouble(),
      y: i.toDouble(),
      width: tileSize,
      height: tileSize,
      collisions: collisions,
    );
  }

  static void enemy1x1(int i, int j) {
    //semak
    if (2 > Random().nextInt(100) && enemyCount < maxEnemy) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 0;
      idxEnm++;
      enemyCount++;
    }
  }

  static void destroyableTreeObject1x1(int i, int j) {
    //semak
    if (2 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 21;
      idxEnm++;
    }
  }

  static void destroyableTreeObject2x2(int i, int j) {
    //tree12x2
    if (2 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 22;
      idxEnm++;
    }
    //tree22x2
    else if (2 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 23;
      idxEnm++;
    }
    //tree32x2
    else if (2 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 24;
      idxEnm++;
    }
    //tree42x2
    else if (2 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 25;
      idxEnm++;
    }
    //tree52x2
    else if (2 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 26;
      idxEnm++;
    }
  }

  static void destroyableTreeObject2x3(int i, int j) {
    //tree12x3
    if (2 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 27;
      idxEnm++;
    }
    //tree22x3
    else if (2 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 28;
      idxEnm++;
    }
    //tree32x3
    else if (2 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 29;
      idxEnm++;
    }
    //tree42x3
    else if (2 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 30;
      idxEnm++;
    }
    //tree52x3
    else if (2 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 31;
      idxEnm++;
    }
    //tree62x3
    else if (2 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 32;
      idxEnm++;
    }
  }

  static void destroyableTreeObject3x2(int i, int j) {
    //pohon_tumbang
    if (2 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 33;
      idxEnm++;
    }
  }

  static void destroyableTreeObject5x5(int i, int j) {
    //tree5x5
    if (2 > Random().nextInt(100)) {
      enemyPosition.add(EnemyPosition());
      enemyPosition[idxEnm].x = i;
      enemyPosition[idxEnm].y = j;
      enemyPosition[idxEnm].value = 34;
      idxEnm++;
    }
  }

  static MapWorld map() {
    List<Uint8List> protoMap0 = List.generate(20, (index) => Uint8List(20));
    List<Uint8List> protoMap1 = List.generate(120, (index) => Uint8List(120));
    int a = 0, b = 0;
    bool isPps = false;
    Uint8List x = Uint8List(1200);
    enemyCount = 0;
    Uint8List y = Uint8List(1200);
    List<String> arah = ["NORTH", "SOUTH", "EAST", "WEST"];
    List<TileModel> tileList = [];
    String langkah = "", last = "";
    int i = 1, j = 0;
    x[0] = Random().nextInt(20);
    y[0] = Random().nextInt(20);

    decorationPosition = [];
    enemyPosition = [];
    idxEnm = 0;
    idxDec = 0;
    while (i < 1200) {
      langkah = arah[Random().nextInt(4)];
      if (last != langkah) {
        if (langkah == "EAST" && (x[i - 1] < 19)) {
          x[i] = x[i - 1] + 1;
          y[i] = y[i - 1];
          if (protoMap0[y[i]][x[i]] < 2) {
            protoMap0[y[i]][x[i]] += 1;
          } else {
            protoMap0[y[i]][x[i]] = 0;
          }
          last = "WEST";
          i++;
        } else if (langkah == "SOUTH" && (x[i - 1] > 0)) {
          x[i] = x[i - 1] - 1;
          y[i] = y[i - 1];
          if (protoMap0[y[i]][x[i]] < 2) {
            protoMap0[y[i]][x[i]] += 1;
          } else {
            protoMap0[y[i]][x[i]] = 0;
          }
          last = "NORTH";
          i++;
        } else if (langkah == "NORTH" && (y[i - 1] < 19)) {
          x[i] = x[i - 1];
          y[i] = y[i - 1] + 1;
          if (protoMap0[y[i]][x[i]] < 2) {
            protoMap0[y[i]][x[i]] += 1;
          } else {
            protoMap0[y[i]][x[i]] = 0;
          }
          last = "SOUTH";
          i++;
        } else if (langkah == "WEST" && (y[i - 1] > 0)) {
          x[i] = x[i - 1];
          y[i] = y[i - 1] - 1;
          if (protoMap0[y[i]][x[i]] < 2) {
            protoMap0[y[i]][x[i]] += 1;
          } else {
            protoMap0[y[i]][x[i]] = 0;
          }
          last = "EAST";
          i++;
        }
      }
    }
    for (i = 0; i < 19; i++) {
      for (j = 0; j < 20; j++) {
        if (protoMap0[i][j] == 0 && protoMap0[i + 1][j] == 2) {
          protoMap0[i][j] = 1;
        } else if (protoMap0[i][j] == 2 && protoMap0[i + 1][j] == 0) {
          protoMap0[i][j] = 1;
        }
      }
    }
    for (i = 0; i < 20; i++) {
      for (j = 0; j < 19; j++) {
        if (protoMap0[i][j] == 0 && protoMap0[i][j + 1] == 2) {
          protoMap0[i][j] = 1;
        } else if (protoMap0[i][j] == 2 && protoMap0[i][j + 1] == 0) {
          protoMap0[i][j] = 1;
        }
      }
    }
    for (i = 0; i < 20; i++) {
      a = i * 6;
      for (j = 0; j < 20; j++) {
        b = j * 6;
        protoMap1[a][b] = protoMap0[i][j];
        protoMap1[a][b + 1] = protoMap0[i][j];
        protoMap1[a][b + 2] = protoMap0[i][j];
        protoMap1[a][b + 3] = protoMap0[i][j];
        protoMap1[a][b + 4] = protoMap0[i][j];
        protoMap1[a][b + 5] = protoMap0[i][j];
        protoMap1[a + 1][b] = protoMap0[i][j];
        protoMap1[a + 1][b + 1] = protoMap0[i][j];
        protoMap1[a + 1][b + 2] = protoMap0[i][j];
        protoMap1[a + 1][b + 3] = protoMap0[i][j];
        protoMap1[a + 1][b + 4] = protoMap0[i][j];
        protoMap1[a + 1][b + 5] = protoMap0[i][j];
        protoMap1[a + 2][b] = protoMap0[i][j];
        protoMap1[a + 2][b + 1] = protoMap0[i][j];
        protoMap1[a + 2][b + 2] = protoMap0[i][j];
        protoMap1[a + 2][b + 3] = protoMap0[i][j];
        protoMap1[a + 2][b + 4] = protoMap0[i][j];
        protoMap1[a + 2][b + 5] = protoMap0[i][j];
        protoMap1[a + 3][b] = protoMap0[i][j];
        protoMap1[a + 3][b + 1] = protoMap0[i][j];
        protoMap1[a + 3][b + 2] = protoMap0[i][j];
        protoMap1[a + 3][b + 3] = protoMap0[i][j];
        protoMap1[a + 3][b + 4] = protoMap0[i][j];
        protoMap1[a + 3][b + 5] = protoMap0[i][j];
        protoMap1[a + 4][b] = protoMap0[i][j];
        protoMap1[a + 4][b + 1] = protoMap0[i][j];
        protoMap1[a + 4][b + 2] = protoMap0[i][j];
        protoMap1[a + 4][b + 3] = protoMap0[i][j];
        protoMap1[a + 4][b + 4] = protoMap0[i][j];
        protoMap1[a + 4][b + 5] = protoMap0[i][j];
        protoMap1[a + 5][b] = protoMap0[i][j];
        protoMap1[a + 5][b + 1] = protoMap0[i][j];
        protoMap1[a + 5][b + 2] = protoMap0[i][j];
        protoMap1[a + 5][b + 3] = protoMap0[i][j];
        protoMap1[a + 5][b + 4] = protoMap0[i][j];
        protoMap1[a + 5][b + 5] = protoMap0[i][j];
      }
    }

    i = 0;
    j = 0;
    int rowLengthC = protoMap1.length - 1;
    List.generate(rowLengthC, (i) {
      List.generate(119, (j) {
        tileList.add(getTile(i, j));
      });
    });
    int v = 0;
    int idxIndi = 0;

    bool tanggaChecker = false, tanggaChecker2 = false, tanggaChecker3 = false;
    List.generate(rowLengthC, (i) {
      List.generate(119, (j) {
        if (tanggaChecker3) {
          tanggaChecker3 = false;
          return;
        }
        if (i > 0 && j > 0) {
          if (protoMap1[i][j] == 2) {
            //tembok in bawah kiri (atas)
            if (protoMap1[i][j - 1] == 1 &&
                protoMap1[i + 1][j] == 1 &&
                protoMap1[i][j + 1] == 2) {
              protoMap1[i][j] = 3;
              protoMap1[i - 1][j] = 4;
              tileList.add(getTileWall(i, j, 0));
              tileList.add(getTileWall(i - 1, j, 1));

              return;
            }
            //tembok in bawah kanan (atas)
            if (protoMap1[i][j + 1] == 1 &&
                protoMap1[i + 1][j] == 1 &&
                protoMap1[i - 1][j] > 1 &&
                protoMap1[i][j - 1] > 2) {
              protoMap1[i][j] = 7;
              protoMap1[i - 1][j] = 8;
              tileList.add(getTileWall(i, j, 4));
              tileList.add(getTileWall(i - 1, j, 5));

              return;
            }
            //tembok out bawah kiri (atas)
            if (protoMap1[i][j - 1] == 2 &&
                (protoMap1[i + 1][j + 1] == 25 ||
                    protoMap1[i + 1][j + 1] == 1) &&
                protoMap1[i - 1][j] == 2 &&
                protoMap1[i][j + 1] == 2) {
              protoMap1[i][j] = 9;
              protoMap1[i - 1][j] = 10;
              tileList.add(getTileWall(i, j, 6));
              tileList.add(getTileWall(i - 1, j, 7));

              return;
            }
            //tembok out bawah kanan (atas)
            if (protoMap1[i][j + 1] == 2 &&
                (protoMap1[i + 1][j - 1] == 26 ||
                    protoMap1[i + 1][j - 1] == 1) &&
                protoMap1[i - 1][j] == 2 &&
                protoMap1[i + 1][j] == 2 &&
                protoMap1[i][j - 1] > 2) {
              protoMap1[i][j] = 11;
              protoMap1[i - 1][j] = 12;
              tileList.add(getTileWall(i, j, 8));
              tileList.add(getTileWall(i - 1, j, 9));

              return;
            }
            //tembok bawah (atas)
            if (protoMap1[i - 1][j] == 2 &&
                protoMap1[i + 1][j] == 1 &&
                protoMap1[i][j + 1] == 2 &&
                protoMap1[i][j - 1] > 2) {
              if (j > 1) {
                tanggaChecker2 =
                    (protoMap1[i][j - 2] > 2 || protoMap1[i][j - 1] == 2) &&
                        j != 2;
              }
              if (!tanggaChecker2) {
                tanggaChecker = true;
              }
              if (j < 117) {
                if ((j < 116 &&
                        3 < Random().nextInt(10) &&
                        protoMap1[i][j + 3] == 2) ||
                    !tanggaChecker) {
                  protoMap1[i][j] = 5;
                  protoMap1[i - 1][j] = 6;
                  tileList.add(getTileWall(i, j, 2));
                  tileList.add(getTileWall(i - 1, j, 3));
                } else {
                  protoMap1[i - 1][j] = 21;
                  protoMap1[i - 1][j + 1] = 22;
                  protoMap1[i][j] = 23;
                  protoMap1[i][j + 1] = 24;
                  protoMap1[i + 1][j] = 25;
                  protoMap1[i + 1][j + 1] = 26;
                  tileList.add(getTileWall(i - 1, j, 18));
                  tileList.add(getTileWall(i - 1, j + 1, 19));
                  tileList.add(getTileWall(i, j, 20));
                  tileList.add(getTileWall(i, j + 1, 21));
                  tileList.add(getTileWall(i + 1, j, 22));
                  tileList.add(getTileWall(i + 1, j + 1, 23));
                  tanggaChecker = false;
                  tanggaChecker3 = true;
                }
              } else {
                protoMap1[i][j] = 5;
                protoMap1[i - 1][j] = 6;
                tileList.add(getTileWall(i, j, 2));
                tileList.add(getTileWall(i - 1, j, 3));
              }

              return;
            }
            //pojok

            //tembok pojok bawah kiri (atas)
            if (protoMap1[i - 1][j] > 2 &&
                protoMap1[i + 1][j] == 2 &&
                protoMap1[i][j - 1] == 2 &&
                protoMap1[i][j + 1] == 2 &&
                (protoMap1[i - 1][j + 1] == 1 ||
                    protoMap1[i - 1][j + 1] == 29)) {
              protoMap1[i][j] = 13;
              tileList.add(getTileWall(i, j, 10));

              return;
            }
            //tembok pojok bawah kanan (atas)
            if (protoMap1[i - 1][j] > 2 &&
                protoMap1[i + 1][j] == 2 &&
                protoMap1[i][j - 1] > 2 &&
                protoMap1[i][j + 1] == 2 &&
                (protoMap1[i - 1][j - 1] == 1 ||
                    protoMap1[i - 1][j - 1] == 30)) {
              protoMap1[i][j] = 15;
              tileList.add(getTileWall(i, j, 12));

              return;
            }
            //tembok pojok atas kiri (atas)
            if (protoMap1[i - 1][j] == 1 &&
                protoMap1[i][j + 1] == 2 &&
                protoMap1[i][j - 1] == 1) {
              protoMap1[i][j] = 18;
              tileList.add(getTileWall(i, j, 15));

              return;
            }
            //tembok pojok atas kanan (atas)
            if (protoMap1[i - 1][j] == 1 &&
                protoMap1[i + 1][j] == 2 &&
                protoMap1[i][j - 1] > 2 &&
                protoMap1[i][j + 1] == 1) {
              protoMap1[i][j] = 20;
              tileList.add(getTileWall(i, j, 17));

              return;
            }
            //tembok pojok atas (atas)
            if (protoMap1[i - 1][j] == 1 && protoMap1[i + 1][j] == 2) {
              if (j > 1) {
                tanggaChecker2 =
                    (protoMap1[i][j - 2] > 2 || protoMap1[i][j - 1] == 2) &&
                        j != 2;
              }
              if (!tanggaChecker2) {
                tanggaChecker = true;
              }
              if (j < 117) {
                if ((j < 116 &&
                        3 < Random().nextInt(10) &&
                        protoMap1[i][j + 3] == 2) ||
                    !tanggaChecker) {
                  protoMap1[i][j] = 19;
                  tileList.add(getTileWall(i, j, 16));
                } else {
                  protoMap1[i][j] = 27;
                  protoMap1[i][j + 1] = 28;
                  protoMap1[i - 1][j] = 29;
                  protoMap1[i - 1][j + 1] = 30;
                  tileList.add(getTileWall(i, j, 24));
                  tileList.add(getTileWall(i, j + 1, 25));
                  tileList.add(getTileWall(i - 1, j, 26));
                  tileList.add(getTileWall(i - 1, j + 1, 27));
                  tanggaChecker = false;
                  tanggaChecker3 = true;
                }
              } else {
                protoMap1[i][j] = 19;
                tileList.add(getTileWall(i, j, 16));
              }

              return;
            }
            //tembok pojok kiri (atas)
            if ((protoMap1[i][j - 1] == 1 ||
                    protoMap1[i][j - 1] == 30 ||
                    protoMap1[i][j - 1] == 26) &&
                (protoMap1[i][j + 1] == 2)) {
              protoMap1[i][j] = 16;
              tileList.add(getTileWall(i, j, 13));

              return;
            }
            //tembok pojok kanan (atas)
            if ((protoMap1[i][j - 1] == 2) &&
                (protoMap1[i][j + 1] == 1 ||
                    protoMap1[i][j + 1] == 29 ||
                    protoMap1[i][j + 1] == 25)) {
              protoMap1[i][j] = 17;
              tileList.add(getTileWall(i, j, 14));

              return;
            }
          } else if (protoMap1[i][j] == 0) {
            //tembok in bawah kiri (bawah)
            if (protoMap1[i][j - 1] == 0 &&
                protoMap1[i - 1][j] > 2 &&
                protoMap1[i - 1][j + 1] == 1 &&
                protoMap1[i][j + 1] == 0) {
              protoMap1[i + 1][j] = 3;
              protoMap1[i][j] = 4;
              tileList.add(getTileWall(i + 1, j, 0));
              tileList.add(getTileWall(i, j, 1));

              return;
            }
            //tembok in bawah kanan (bawah)
            if (protoMap1[i][j + 1] == 0 &&
                protoMap1[i - 1][j] > 2 &&
                protoMap1[i - 1][j - 1] == 1 &&
                protoMap1[i][j - 1] > 2) {
              protoMap1[i + 1][j] = 7;
              protoMap1[i][j] = 8;
              tileList.add(getTileWall(i + 1, j, 4));
              tileList.add(getTileWall(i, j, 5));

              return;
            }
            //tembok out bawah kiri (bawah)
            if (protoMap1[i][j - 1] == 1 &&
                (protoMap1[i + 1][j + 1] == 23 ||
                    protoMap1[i + 1][j + 1] == 0) &&
                protoMap1[i - 1][j] == 1 &&
                protoMap1[i][j + 1] == 0) {
              protoMap1[i + 1][j] = 9;
              protoMap1[i][j] = 10;
              tileList.add(getTileWall(i + 1, j, 6));
              tileList.add(getTileWall(i, j, 7));

              return;
            }
            //tembok out bawah kanan (bawah)
            if (protoMap1[i][j + 1] == 1 &&
                (protoMap1[i + 1][j - 1] > 2) &&
                protoMap1[i - 1][j] == 1 &&
                protoMap1[i + 1][j] == 0 &&
                protoMap1[i][j - 1] > 2) {
              protoMap1[i + 1][j] = 11;
              protoMap1[i][j] = 12;
              tileList.add(getTileWall(i + 1, j, 8));
              tileList.add(getTileWall(i, j, 9));

              return;
            }
            //tembok bawah (bawah)
            if (protoMap1[i - 1][j] == 1 &&
                protoMap1[i + 1][j] == 0 &&
                protoMap1[i][j + 1] == 0 &&
                protoMap1[i][j - 1] > 2) {
              if (j > 1) {
                tanggaChecker2 =
                    (protoMap1[i][j - 2] > 2 || protoMap1[i][j - 1] == 0) &&
                        j != 2;
              }
              if (!tanggaChecker2) {
                tanggaChecker = true;
              }
              if (j < 117) {
                if ((j < 116 &&
                        3 < Random().nextInt(10) &&
                        protoMap1[i][j + 3] == 0 &&
                        protoMap1[i - 1][j + 3] == 1) ||
                    !tanggaChecker) {
                  protoMap1[i + 1][j] = 5;
                  protoMap1[i][j] = 6;
                  tileList.add(getTileWall(i + 1, j, 2));
                  tileList.add(getTileWall(i, j, 3));
                } else {
                  protoMap1[i][j] = 21;
                  protoMap1[i][j + 1] = 22;
                  protoMap1[i + 1][j] = 23;
                  protoMap1[i + 1][j + 1] = 24;
                  protoMap1[i + 2][j] = 25;
                  protoMap1[i + 2][j + 1] = 26;
                  tileList.add(getTileWall(i, j, 18));
                  tileList.add(getTileWall(i, j + 1, 19));
                  tileList.add(getTileWall(i + 1, j, 20));
                  tileList.add(getTileWall(i + 1, j + 1, 21));
                  tileList.add(getTileWall(i + 2, j, 22));
                  tileList.add(getTileWall(i + 2, j + 1, 23));
                  tanggaChecker = false;
                  tanggaChecker3 = true;
                }
              } else {
                protoMap1[i + 1][j] = 5;
                protoMap1[i][j] = 6;
                tileList.add(getTileWall(i + 1, j, 2));
                tileList.add(getTileWall(i, j, 3));
              }

              return;
            }
            //pojok

            //tembok pojok bawah kiri (bawah)
            if (protoMap1[i - 1][j] > 2 &&
                protoMap1[i + 1][j] == 1 &&
                protoMap1[i][j - 1] == 1 &&
                protoMap1[i][j + 1] == 0 &&
                (protoMap1[i - 1][j + 1] == 0 ||
                    protoMap1[i - 1][j + 1] == 29)) {
              protoMap1[i][j] = 13;
              tileList.add(getTileWall(i, j, 10));

              return;
            }
            //tembok pojok bawah kanan (bawah)
            if (protoMap1[i - 1][j] > 2 &&
                protoMap1[i + 1][j] == 1 &&
                protoMap1[i][j - 1] > 2 &&
                protoMap1[i][j + 1] == 1 &&
                (protoMap1[i - 1][j - 1] == 0 ||
                    protoMap1[i - 1][j - 1] == 30)) {
              protoMap1[i][j] = 15;
              tileList.add(getTileWall(i, j, 12));

              return;
            }
            //tembok pojok atas kiri (bawah)
            if (protoMap1[i + 1][j + 1] == 1 &&
                protoMap1[i][j + 1] == 0 &&
                protoMap1[i + 1][j] == 0) {
              protoMap1[i][j] = 18;
              tileList.add(getTileWall(i, j, 15));

              return;
            }
            //tembok pojok atas kanan (bawah)
            if (protoMap1[i + 1][j - 1] == 1 &&
                protoMap1[i][j - 1] > 2 &&
                protoMap1[i + 1][j] == 0) {
              protoMap1[i][j] = 20;
              tileList.add(getTileWall(i, j, 17));

              return;
            }
            //tembok pojok bawah (bawah)
            if (protoMap1[i - 1][j] == 0 && protoMap1[i + 1][j] == 1) {
              if (j > 1) {
                tanggaChecker2 =
                    (protoMap1[i][j - 2] > 2 || protoMap1[i][j - 1] == 0) &&
                        j != 2;
              }
              if (!tanggaChecker2) {
                tanggaChecker = true;
              }
              if (j < 117) {
                if ((j < 116 &&
                        3 < Random().nextInt(10) &&
                        protoMap1[i][j + 3] == 0 &&
                        protoMap1[i + 1][j + 3] == 1) ||
                    !tanggaChecker) {
                  protoMap1[i][j] = 14;
                  tileList.add(getTileWall(i, j, 11));
                } else {
                  protoMap1[i][j] = 27;
                  protoMap1[i][j + 1] = 28;
                  protoMap1[i - 1][j] = 29;
                  protoMap1[i - 1][j + 1] = 30;
                  tileList.add(getTileWall(i, j, 24));
                  tileList.add(getTileWall(i, j + 1, 25));
                  tileList.add(getTileWall(i - 1, j, 26));
                  tileList.add(getTileWall(i - 1, j + 1, 27));
                  tanggaChecker = false;
                  tanggaChecker3 = true;
                }
              } else {
                protoMap1[i][j] = 14;
                tileList.add(getTileWall(i, j, 11));
              }

              return;
            }
            //tembok pojok kiri (bawah)
            if ((protoMap1[i][j - 1] == 1) &&
                (protoMap1[i][j + 1] == 0 ||
                    protoMap1[i][j + 1] == 29 ||
                    protoMap1[i][j + 1] == 25)) {
              protoMap1[i][j] = 16;
              tileList.add(getTileWall(i, j, 13));

              return;
            }
            //tembok pojok kanan (bawah)
            if ((protoMap1[i][j - 1] == 0 ||
                    protoMap1[i][j - 1] == 30 ||
                    protoMap1[i][j - 1] == 26) &&
                (protoMap1[i][j + 1] == 1)) {
              protoMap1[i][j] = 17;
              tileList.add(getTileWall(i, j, 14));

              return;
            }
          }
        }
        if (i > 0) {
          if (protoMap1[i][j] == 2) {
            //tembok bawah (atas)
            if (protoMap1[i - 1][j] == 2 &&
                protoMap1[i + 1][j] == 1 &&
                protoMap1[i][j + 1] == 2) {
              protoMap1[i][j] = 5;
              protoMap1[i - 1][j] = 6;
              tileList.add(getTileWall(i, j, 2));
              tileList.add(getTileWall(i - 1, j, 3));

              return;
            }
            //tembok pojok atas (atas)
            if (protoMap1[i - 1][j] == 1 && protoMap1[i + 1][j] == 2) {
              protoMap1[i][j] = 19;
              tileList.add(getTileWall(i, j, 16));

              return;
            }
          } else if (protoMap1[i][j] == 0) {
            //tembok bawah (bawah)
            if (protoMap1[i - 1][j] == 1 &&
                protoMap1[i + 1][j] == 0 &&
                protoMap1[i][j + 1] == 0 &&
                j == 0) {
              protoMap1[i + 1][j] = 5;
              protoMap1[i][j] = 6;
              tileList.add(getTileWall(i + 1, j, 2));
              tileList.add(getTileWall(i, j, 3));

              return;
            }
            //tembok pojok bawah (bawah)
            if (protoMap1[i - 1][j] == 0 && protoMap1[i + 1][j] == 1) {
              protoMap1[i][j] = 14;
              tileList.add(getTileWall(i, j, 11));
              return;
            }
          }
        }
        if (j > 0) {
          if (protoMap1[i][j] == 2) {
            //tembok pojok kiri (atas)
            if (protoMap1[i][j - 1] == 1 && protoMap1[i][j + 1] == 2) {
              protoMap1[i][j] = 16;
              tileList.add(getTileWall(i, j, 13));

              return;
            }
            //tembok pojok kanan (atas)
            if (protoMap1[i][j - 1] == 2 && protoMap1[i][j + 1] == 1) {
              protoMap1[i][j] = 17;
              tileList.add(getTileWall(i, j, 14));

              return;
            }
          } else if (protoMap1[i][j] == 0) {
            //tembok pojok kiri (bawah)
            if ((protoMap1[i][j - 1] == 1) &&
                (protoMap1[i][j + 1] == 0) &&
                i == 0) {
              protoMap1[i][j] = 16;
              tileList.add(getTileWall(i, j, 13));

              return;
            }
            //tembok pojok kanan (bawah)
            if ((protoMap1[i][j - 1] == 0) &&
                (protoMap1[i][j + 1] == 1) &&
                i == 0) {
              protoMap1[i][j] = 17;
              tileList.add(getTileWall(i, j, 14));

              return;
            }
          }
        }
      });
    });

    for (i = 0; i < rowLengthC; i++) {
      v = 0;
      for (j = 0; j < 119; j++) {
        if (protoMap1[i][j] < 3) {
          idxIndi = idxEnm;
          if (idxIndi == idxEnm) {
            enemy1x1(i, j);
          }

          if (idxIndi == idxEnm) {
            destroyableTreeObject1x1(i, j);
          }
          if (idxIndi == idxEnm) {
            if (protoMap1[i + 1][j + 1] < 3 && protoMap1[i + 1][j] < 3) {
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
            if (i < 118 && j < 119) {
              if ((protoMap1[i + 2][j + 1] < 3) && (protoMap1[i + 2][j] < 3)) {
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
            if (i < 119 && j < 118) {
              if ((protoMap1[i + 1][j + 2] < 3) &&
                  (protoMap1[i + 1][j + 1] < 3) &&
                  (protoMap1[i + 1][j] < 3)) {
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
            if (i < 116 && j < 116) {
              if ((protoMap1[i + 4][j + 4] < 3) &&
                  (protoMap1[i + 4][j + 3] < 3) &&
                  (protoMap1[i + 4][j + 2] < 3) &&
                  (protoMap1[i + 4][j + 1] < 3) &&
                  (protoMap1[i + 4][j] < 3)) {
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

          if (isPps == false) {
            playerPosition[0] = i.toDouble();
            playerPosition[1] = j.toDouble();
            isPps = true;
          }
          exitPotition[0] = 117;
          exitPotition[1] = 117;
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
        //musuh.add(Crystal1(position));
      } else if (enemyPosition[i].value == 2) {
        //musuh.add(Crystal2(position));
      } else if (enemyPosition[i].value == 3) {
        //musuh.add(Crystal3(position));
      } else if (enemyPosition[i].value == 4) {
        //musuh.add(Crystal7(position));
      } else if (enemyPosition[i].value == 5) {
        //musuh.add(Crystal8(position));
      } else if (enemyPosition[i].value == 6) {
        //musuh.add(Crystal9(position));
      } else if (enemyPosition[i].value == 7) {
        //musuh.add(Crystal11(position));
      } else if (enemyPosition[i].value == 8) {
        //musuh.add(Crystal12(position));
      } else if (enemyPosition[i].value == 9) {
        //musuh.add(Crystal10(position));
      } else if (enemyPosition[i].value == 10) {
        //musuh.add(CrystalNgambang(position));
      } else if (enemyPosition[i].value == 11) {
        // musuh.add(CrystalNgambang2(position));
      } else if (enemyPosition[i].value == 12) {
        //musuh.add(Crystal13(position));
      } else if (enemyPosition[i].value == 13) {
        //musuh.add(Batu1(position));
      } else if (enemyPosition[i].value == 14) {
        //musuh.add(Batu2(position));
      } else if (enemyPosition[i].value == 15) {
        //musuh.add(Batu3(position));
      } else if (enemyPosition[i].value == 16) {
        //musuh.add(Batu4(position));
      } else if (enemyPosition[i].value == 17) {
        //musuh.add(Batu6(position));
      } else if (enemyPosition[i].value == 18) {
        //musuh.add(Batu7(position));
      } else if (enemyPosition[i].value == 19) {
        //musuh.add(Batu5(position));
      } else if (enemyPosition[i].value == 20) {
        //musuh.add(Batu8(position));
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
/* 
  static List<GameDecoration> decorations() {
    List<GameDecoration> decorasi = [];
    Vector2 position = Vector2.zero();
    for (int i = 0; i < idxDec; i++) {
      position = Vector2(
        decorationPosition[i].y * tileSize,
        decorationPosition[i].x * tileSize,
      );
      if (decorationPosition[i].value == 0) {/* 
        decorasi.add(Rambat(position)); */
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
 */
}
