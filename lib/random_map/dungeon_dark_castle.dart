import 'dart:developer' as dev;
import 'dart:math';
import 'dart:typed_data';

import 'package:bonfire/bonfire.dart';
import 'package:flutter/foundation.dart';
import 'package:final_project_ai/database/entity/enemy_position.dart';
import 'package:final_project_ai/shared/decoration/dark_castle/bendera_ijo.dart';
import 'package:final_project_ai/shared/decoration/dark_castle/bendera_ungu.dart';
import 'package:final_project_ai/shared/decoration/dark_castle/box.dart';
import 'package:final_project_ai/shared/decoration/dark_castle/box_2.dart';
import 'package:final_project_ai/shared/decoration/dark_castle/box_3.dart';
import 'package:final_project_ai/shared/decoration/dark_castle/gentong.dart';
import 'package:final_project_ai/shared/decoration/dark_castle/shield.dart';
import 'package:final_project_ai/shared/decoration/dark_castle/sword.dart';
import 'package:final_project_ai/shared/decoration/dark_castle/sword_wf.dart';
import 'package:final_project_ai/shared/decoration/dark_castle/torch.dart';
import 'package:final_project_ai/shared/enemy/slime.dart';
import 'package:final_project_ai/shared/util/map_util/exit_map_sensor.dart';

import '../database/entity/decoration_position.dart';
import '../main.dart';
import '../shared/decoration/dark_castle/invinsible_torch.dart';

class DungeonDarkCastleMap {
  static int maxEnemy = 40;
  static int enemyCount = 0;
  static List<Uint8List> playerPosition =
      List.generate(1, (index) => Uint8List(2));
  static List<EnemyPosition> enemyPosition = [];
  static List<Uint8List> exitPotition =
      List.generate(2, (index) => Uint8List(2));
  static List<DecorationPosition> decorationPosition = [];
  static const List<String> floor1 = [
    'tile/dark_castle/lantai1/uallantai1.png',
    'tile/dark_castle/lantai1/ualantai1.png',
    'tile/dark_castle/lantai1/uarlantai1.png',
    'tile/dark_castle/lantai1/ullantai1.png',
    'tile/dark_castle/lantai1/lantai1.png',
    'tile/dark_castle/lantai1/urlantai1.png',
    'tile/dark_castle/lantai1/ulblantai1.png',
    'tile/dark_castle/lantai1/ublantai1.png',
    'tile/dark_castle/lantai1/urblantai1.png',
    'tile/dark_castle/lantai1/tallantai1.png',
    'tile/dark_castle/lantai1/tarlantai1.png',
    'tile/dark_castle/lantai1/tbllantai1.png',
    'tile/dark_castle/lantai1/tbrlantai1.png',
  ];

  static const List<String> tembok1 = [
    'tile/dark_castle/tembok1/tembokbl.png',
    'tile/dark_castle/tembok1/tembokb.png',
    'tile/dark_castle/tembok1/tembokbr.png',
    'tile/dark_castle/tembok1/jendelab.png',
    'tile/dark_castle/tembok1/tembokal.png',
    'tile/dark_castle/tembok1/temboka.png',
    'tile/dark_castle/tembok1/tembokar.png',
    'tile/dark_castle/tembok1/jendelaa.png',
    //8
    'tile/dark_castle/tembok1/ualbtembok.png',
    'tile/dark_castle/tembok1/uabtembok.png',
    'tile/dark_castle/tembok1/uarbtembok.png',
    'tile/dark_castle/tembok1/ulbtembok.png',
    //12
    'tile/dark_castle/tembok1/urbtembok.png',
    'tile/dark_castle/tembok1/ublbtembok.png',
    'tile/dark_castle/tembok1/ubbtembok.png',
    'tile/dark_castle/tembok1/ubrbtembok.png',
    //16
    'tile/dark_castle/tembok1/ualtembok.png',
    'tile/dark_castle/tembok1/uartembok.png',
    'tile/dark_castle/tembok1/ubltembok.png',
    'tile/dark_castle/tembok1/ubrtembok.png',
  ];
  static int idxDec = 0, idxEnm = 0;

  static TileModel getTile(int i, int j, int id) {
    return TileModel(
      sprite: TileModelSprite(path: floor1[id]),
      x: j.toDouble(),
      y: i.toDouble(),
      width: tileSize,
      height: tileSize,
    );
  }

  static TileModel getTileWall(int i, int j, int id) {
    return TileModel(
      sprite: TileModelSprite(path: tembok1[id]),
      x: j.toDouble(),
      y: i.toDouble(),
      width: tileSize,
      height: tileSize,
      collisions: [
        CollisionArea.rectangle(
          size: Vector2(tileSize, tileSize),
        ),
      ],
    );
  }

  static void decorasiDinding(int i, int j) {
    if (Random().nextInt(10) < 1) {
      //obor
      decorationPosition.add(DecorationPosition());
      decorationPosition[idxDec].x = i - 2;
      decorationPosition[idxDec].y = j;
      decorationPosition[idxDec].value = 0;
      idxDec++;
    } else if (Random().nextInt(10) < 1) {
      //shield
      decorationPosition.add(DecorationPosition());
      decorationPosition[idxDec].x = i - 2;
      decorationPosition[idxDec].y = j;
      decorationPosition[idxDec].value = 2;
      idxDec++;
    } else if (Random().nextInt(10) < 1) {
      //pedang
      decorationPosition.add(DecorationPosition());
      decorationPosition[idxDec].x = i - 2;
      decorationPosition[idxDec].y = j;
      decorationPosition[idxDec].value = 3;
      idxDec++;
    } else if (Random().nextInt(10) < 1) {
      //pedang dengan background
      decorationPosition.add(DecorationPosition());
      decorationPosition[idxDec].x = i - 2;
      decorationPosition[idxDec].y = j;
      decorationPosition[idxDec].value = 4;
      idxDec++;
    } else if (Random().nextInt(10) < 1) {
      //bendera ungu
      decorationPosition.add(DecorationPosition());
      decorationPosition[idxDec].x = i - 2;
      decorationPosition[idxDec].y = j;
      decorationPosition[idxDec].value = 5;
      idxDec++;
    } else if (Random().nextInt(10) < 1) {
      //bendera ijo
      decorationPosition.add(DecorationPosition());
      decorationPosition[idxDec].x = i - 2;
      decorationPosition[idxDec].y = j;
      decorationPosition[idxDec].value = 6;
      idxDec++;
    }
  }

  static MapWorld map() {
    List<Uint8List> protoMap1 = List.generate(80, (index) => Uint8List(80));
    bool isPps = false;
    Uint8List x = Uint8List(600);
    enemyCount = 0;
    Uint8List y = Uint8List(600);
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

    while (i < 600) {
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
    bool wallChecker = false;
    i = 0;
    j = 0;
    for (i = 0; i < 80; i++) {
      for (j = 0; j < 80; j++) {
        if (i > 0 && i < 76) {
          if ((protoMap1[i][j] == 0) &&
              (protoMap1[i - 1][j] != 0) &&
              ((protoMap1[i + 1][j] != 0) ||
                  (protoMap1[i + 2][j] != 0) ||
                  (protoMap1[i + 3][j] != 0) ||
                  (protoMap1[i + 4][j] != 0))) {
            wallChecker = true;
            j = 80;
          }
        }
      }
      if (wallChecker) {
        protoMap2.add(protoMap1[i]);
        protoMap2.add(protoMap1[i]);
        protoMap2.add(protoMap1[i]);
        protoMap2.add(protoMap1[i]);
        wallChecker = false;
      } else {
        protoMap2.add(protoMap1[i]);
      }
    }
    int rowLengthC = protoMap2.length - 1;
    List.generate(rowLengthC, (i) {
      List.generate(79, (j) {
        //lantai bawah kiri
        if (i > 0 && j > 0) {
          if (protoMap2[i][j] != 0) {
            if (protoMap2[i][j - 1] == 0 &&
                protoMap2[i + 1][j] == 0 &&
                protoMap2[i - 1][j + 1] != 0) {
              protoMap2[i][j] = 7;
              tileList.add(getTile(i, j, protoMap2[i][j] - 1));
              tileList.add(getTileWall(i, j - 1, 12));
              tileList.add(getTileWall(i + 1, j, 9));
              tileList.add(getTileWall(i + 1, j - 1, 17));
              if (isPps == false) {
                playerPosition[0][0] = i;
                playerPosition[0][1] = j;
                isPps = true;
              } else if (3 > Random().nextInt(100)) {
                enemyPosition.add(EnemyPosition());
                enemyPosition[idxEnm].x = i;
                enemyPosition[idxEnm].y = j;
                enemyPosition[idxEnm].value = 1;
                idxEnm++;
              } else if (3 > Random().nextInt(100)) {
                enemyPosition.add(EnemyPosition());
                enemyPosition[idxEnm].x = i;
                enemyPosition[idxEnm].y = j;
                enemyPosition[idxEnm].value = 2;
                idxEnm++;
              } else if (3 > Random().nextInt(100)) {
                enemyPosition.add(EnemyPosition());
                enemyPosition[idxEnm].x = i - 1;
                enemyPosition[idxEnm].y = j;
                enemyPosition[idxEnm].value = 3;
                idxEnm++;
              } else if (3 > Random().nextInt(100)) {
                enemyPosition.add(EnemyPosition());
                enemyPosition[idxEnm].x = i;
                enemyPosition[idxEnm].y = j;
                enemyPosition[idxEnm].value = 4;
                idxEnm++;
              }
              exitPotition[0][0] = i;
              exitPotition[0][1] = j;
              return;
            }
            //lantai bawah kanan
            if (protoMap2[i][j + 1] == 0 &&
                protoMap2[i + 1][j] == 0 &&
                protoMap2[i - 1][j - 1] != 0) {
              protoMap2[i][j] = 9;
              tileList.add(getTile(i, j, protoMap2[i][j] - 1));
              tileList.add(getTileWall(i, j + 1, 11));
              tileList.add(getTileWall(i + 1, j, 9));
              tileList.add(getTileWall(i + 1, j + 1, 16));
              if (isPps == false) {
                playerPosition[0][0] = i;
                playerPosition[0][1] = j;
                isPps = true;
              } else if (3 > Random().nextInt(100)) {
                enemyPosition.add(EnemyPosition());
                enemyPosition[idxEnm].x = i;
                enemyPosition[idxEnm].y = j;
                enemyPosition[idxEnm].value = 1;
                idxEnm++;
              } else if (3 > Random().nextInt(100)) {
                enemyPosition.add(EnemyPosition());
                enemyPosition[idxEnm].x = i - 1;
                enemyPosition[idxEnm].y = j - 1;
                enemyPosition[idxEnm].value = 2;
                idxEnm++;
              } else if (3 > Random().nextInt(100)) {
                enemyPosition.add(EnemyPosition());
                enemyPosition[idxEnm].x = i - 1;
                enemyPosition[idxEnm].y = j;
                enemyPosition[idxEnm].value = 3;
                idxEnm++;
              } else if (3 > Random().nextInt(100)) {
                enemyPosition.add(EnemyPosition());
                enemyPosition[idxEnm].x = i;
                enemyPosition[idxEnm].y = j;
                enemyPosition[idxEnm].value = 4;
                idxEnm++;
              }
              exitPotition[0][0] = i;
              exitPotition[0][1] = j;

              return;
            }
            //lantai atas kanan
            if (protoMap2[i][j + 1] == 0 &&
                protoMap2[i - 1][j] == 0 &&
                protoMap2[i + 1][j - 1] != 0) {
              protoMap2[i][j] = 3;
              tileList.add(getTile(i, j, protoMap2[i][j] - 1));
              tileList.add(getTileWall(i - 1, j, 2));
              tileList.add(getTileWall(i - 2, j, 6));
              tileList.add(getTileWall(i - 3, j, 14));
              tileList.add(getTileWall(i, j + 1, 11));
              tileList.add(getTileWall(i - 1, j + 1, 11));
              tileList.add(getTileWall(i - 2, j + 1, 11));
              tileList.add(getTileWall(i - 3, j + 1, 18));
              decorasiDinding(i, j);
              if (isPps == false) {
                playerPosition[0][0] = i;
                playerPosition[0][1] = j;
                isPps = true;
              } else if (3 > Random().nextInt(100)) {
                enemyPosition.add(EnemyPosition());
                enemyPosition[idxEnm].x = i;
                enemyPosition[idxEnm].y = j;
                enemyPosition[idxEnm].value = 1;
                idxEnm++;
              } else if (3 > Random().nextInt(100)) {
                enemyPosition.add(EnemyPosition());
                enemyPosition[idxEnm].x = i;
                enemyPosition[idxEnm].y = j - 1;
                enemyPosition[idxEnm].value = 2;
                idxEnm++;
              } else if (3 > Random().nextInt(100)) {
                enemyPosition.add(EnemyPosition());
                enemyPosition[idxEnm].x = i - 1;
                enemyPosition[idxEnm].y = j;
                enemyPosition[idxEnm].value = 3;
                idxEnm++;
              } else if (3 > Random().nextInt(100)) {
                enemyPosition.add(EnemyPosition());
                enemyPosition[idxEnm].x = i;
                enemyPosition[idxEnm].y = j;
                enemyPosition[idxEnm].value = 4;
                idxEnm++;
              }
              exitPotition[0][0] = i;
              exitPotition[0][1] = j;
              return;
            }
            //lantai atas kiri
            if (protoMap2[i][j - 1] == 0 &&
                protoMap2[i - 1][j] == 0 &&
                protoMap2[i + 1][j + 1] != 0) {
              protoMap2[i][j] = 1;
              tileList.add(getTile(i, j, protoMap2[i][j] - 1));
              tileList.add(getTileWall(i - 1, j, 0));
              tileList.add(getTileWall(i - 2, j, 4));
              tileList.add(getTileWall(i - 3, j, 14));
              tileList.add(getTileWall(i, j - 1, 12));
              tileList.add(getTileWall(i - 1, j - 1, 12));
              tileList.add(getTileWall(i - 2, j - 1, 12));
              tileList.add(getTileWall(i - 3, j - 1, 19));
              decorasiDinding(i, j);
              if (isPps == false) {
                playerPosition[0][0] = i;
                playerPosition[0][1] = j;
                isPps = true;
              } else if (3 > Random().nextInt(100)) {
                enemyPosition.add(EnemyPosition());
                enemyPosition[idxEnm].x = i;
                enemyPosition[idxEnm].y = j;
                enemyPosition[idxEnm].value = 1;
                idxEnm++;
              } else if (3 > Random().nextInt(100)) {
                enemyPosition.add(EnemyPosition());
                enemyPosition[idxEnm].x = i;
                enemyPosition[idxEnm].y = j;
                enemyPosition[idxEnm].value = 2;
                idxEnm++;
              } else if (3 > Random().nextInt(100)) {
                enemyPosition.add(EnemyPosition());
                enemyPosition[idxEnm].x = i - 1;
                enemyPosition[idxEnm].y = j;
                enemyPosition[idxEnm].value = 3;
                idxEnm++;
              } else if (3 > Random().nextInt(100)) {
                enemyPosition.add(EnemyPosition());
                enemyPosition[idxEnm].x = i;
                enemyPosition[idxEnm].y = j;
                enemyPosition[idxEnm].value = 4;
                idxEnm++;
              }
              exitPotition[0][0] = i;
              exitPotition[0][1] = j;
              return;
            }

            //lantai ujung atas kanan
            if (protoMap2[i - 1][j + 1] == 0 &&
                protoMap2[i][j + 1] != 0 &&
                protoMap2[i - 1][j] != 0) {
              protoMap2[i][j] = 11;
              tileList.add(getTile(i, j, protoMap2[i][j] - 1));
              return;
            }
            //lantai ujung atas kiri
            if (protoMap2[i - 1][j - 1] == 0 &&
                protoMap2[i][j - 1] != 0 &&
                protoMap2[i - 1][j] != 0) {
              protoMap2[i][j] = 10;
              tileList.add(getTile(i, j, protoMap2[i][j] - 1));
              return;
            }
            //lantai ujung bawah kiri
            if (protoMap2[i + 1][j - 1] == 0 &&
                protoMap2[i][j - 1] != 0 &&
                protoMap2[i + 1][j] != 0) {
              protoMap2[i][j] = 12;
              tileList.add(getTile(i, j, protoMap2[i][j] - 1));
              return;
            }
            //lantai ujung bawah kanan
            if (protoMap2[i + 1][j + 1] == 0 &&
                protoMap2[i][j + 1] != 0 &&
                protoMap2[i + 1][j] != 0) {
              protoMap2[i][j] = 13;
              tileList.add(getTile(i, j, protoMap2[i][j] - 1));
              return;
            }

            //lantai atas
            if (protoMap2[i - 1][j] == 0 && protoMap2[i + 1][j] != 0) {
              protoMap2[i][j] = 2;
              tileList.add(getTile(i, j, protoMap2[i][j] - 1));
              //lantai atas tanpa ujung
              if (protoMap2[i - 1][j - 1] == 0 &&
                  protoMap2[i - 1][j + 1] == 0) {
                if (Random().nextInt(10) < 2) {
                  //tembok dengan jendela
                  tileList.add(getTileWall(i - 1, j, 3));
                  tileList.add(getTileWall(i - 2, j, 7));
                  tileList.add(getTileWall(i - 3, j, 14));
                } else {
                  tileList.add(getTileWall(i - 1, j, 1));
                  tileList.add(getTileWall(i - 2, j, 5));
                  tileList.add(getTileWall(i - 3, j, 14));
                  decorasiDinding(i, j);
                  if (3 > Random().nextInt(100)) {
                    enemyPosition.add(EnemyPosition());
                    enemyPosition[idxEnm].x = i;
                    enemyPosition[idxEnm].y = j;
                    enemyPosition[idxEnm].value = 1;
                    idxEnm++;
                  } else if (3 > Random().nextInt(100)) {
                    enemyPosition.add(EnemyPosition());
                    enemyPosition[idxEnm].x = i;
                    enemyPosition[idxEnm].y = j;
                    enemyPosition[idxEnm].value = 2;
                    idxEnm++;
                  } else if (3 > Random().nextInt(100)) {
                    enemyPosition.add(EnemyPosition());
                    enemyPosition[idxEnm].x = i - 1;
                    enemyPosition[idxEnm].y = j;
                    enemyPosition[idxEnm].value = 3;
                    idxEnm++;
                  } else if (3 > Random().nextInt(100)) {
                    enemyPosition.add(EnemyPosition());
                    enemyPosition[idxEnm].x = i;
                    enemyPosition[idxEnm].y = j;
                    enemyPosition[idxEnm].value = 4;
                    idxEnm++;
                  }
                }
              }
              //lantai atas dengan ujung atas kanan
              else if (protoMap2[i - 1][j - 1] != 0) {
                tileList.add(getTileWall(i - 1, j, 0));
                tileList.add(getTileWall(i - 2, j, 4));
                tileList.add(getTileWall(i - 3, j, 13));
                decorasiDinding(i, j);
                if (3 > Random().nextInt(100)) {
                  enemyPosition.add(EnemyPosition());
                  enemyPosition[idxEnm].x = i;
                  enemyPosition[idxEnm].y = j;
                  enemyPosition[idxEnm].value = 1;
                  idxEnm++;
                } else if (3 > Random().nextInt(100)) {
                  enemyPosition.add(EnemyPosition());
                  enemyPosition[idxEnm].x = i;
                  enemyPosition[idxEnm].y = j;
                  enemyPosition[idxEnm].value = 2;
                  idxEnm++;
                } else if (3 > Random().nextInt(100)) {
                  enemyPosition.add(EnemyPosition());
                  enemyPosition[idxEnm].x = i - 1;
                  enemyPosition[idxEnm].y = j;
                  enemyPosition[idxEnm].value = 3;
                  idxEnm++;
                } else if (3 > Random().nextInt(100)) {
                  enemyPosition.add(EnemyPosition());
                  enemyPosition[idxEnm].x = i;
                  enemyPosition[idxEnm].y = j;
                  enemyPosition[idxEnm].value = 4;
                  idxEnm++;
                }
              }
              //lantai atas dengan ujung atas kiri
              else if (protoMap2[i - 1][j + 1] != 0) {
                tileList.add(getTileWall(i - 1, j, 2));
                tileList.add(getTileWall(i - 2, j, 6));
                tileList.add(getTileWall(i - 3, j, 15));
                decorasiDinding(i, j);
                if (3 > Random().nextInt(100)) {
                  enemyPosition.add(EnemyPosition());
                  enemyPosition[idxEnm].x = i;
                  enemyPosition[idxEnm].y = j;
                  enemyPosition[idxEnm].value = 1;
                  idxEnm++;
                } else if (3 > Random().nextInt(100)) {
                  enemyPosition.add(EnemyPosition());
                  enemyPosition[idxEnm].x = i;
                  enemyPosition[idxEnm].y = j;
                  enemyPosition[idxEnm].value = 2;
                  idxEnm++;
                } else if (3 > Random().nextInt(100)) {
                  enemyPosition.add(EnemyPosition());
                  enemyPosition[idxEnm].x = i - 1;
                  enemyPosition[idxEnm].y = j;
                  enemyPosition[idxEnm].value = 3;
                  idxEnm++;
                } else if (3 > Random().nextInt(100)) {
                  enemyPosition.add(EnemyPosition());
                  enemyPosition[idxEnm].x = i;
                  enemyPosition[idxEnm].y = j;
                  enemyPosition[idxEnm].value = 4;
                  idxEnm++;
                }
              }
              return;
            }
            //lantai bawah
            if (protoMap2[i - 1][j] != 0 && protoMap2[i + 1][j] == 0) {
              protoMap2[i][j] = 8;
              tileList.add(getTile(i, j, protoMap2[i][j] - 1));
              if (protoMap2[i + 1][j + 1] != 0) {
                tileList.add(getTileWall(i + 1, j, 10));
              } else if (protoMap2[i + 1][j - 1] != 0) {
                tileList.add(getTileWall(i + 1, j, 8));
              } else {
                tileList.add(getTileWall(i + 1, j, 9));
                if (Random().nextInt(100) < 9) {
                  //obor
                  decorationPosition.add(DecorationPosition());
                  decorationPosition[idxDec].x = i + 1;
                  decorationPosition[idxDec].y = j;
                  decorationPosition[idxDec].value = 1;
                  idxDec++;
                }
                if (3 > Random().nextInt(100)) {
                  enemyPosition.add(EnemyPosition());
                  enemyPosition[idxEnm].x = i;
                  enemyPosition[idxEnm].y = j;
                  enemyPosition[idxEnm].value = 1;
                  idxEnm++;
                } else if (3 > Random().nextInt(100)) {
                  enemyPosition.add(EnemyPosition());
                  enemyPosition[idxEnm].x = i - 2;
                  enemyPosition[idxEnm].y = j;
                  enemyPosition[idxEnm].value = 2;
                  idxEnm++;
                } else if (3 > Random().nextInt(100)) {
                  enemyPosition.add(EnemyPosition());
                  enemyPosition[idxEnm].x = i - 1;
                  enemyPosition[idxEnm].y = j;
                  enemyPosition[idxEnm].value = 3;
                  idxEnm++;
                } else if (3 > Random().nextInt(100)) {
                  enemyPosition.add(EnemyPosition());
                  enemyPosition[idxEnm].x = i;
                  enemyPosition[idxEnm].y = j;
                  enemyPosition[idxEnm].value = 4;
                  idxEnm++;
                }
              }
              return;
            }
            //lantai kanan
            if (protoMap2[i][j + 1] == 0 && protoMap2[i][j - 1] != 0) {
              protoMap2[i][j] = 6;
              tileList.add(getTile(i, j, protoMap2[i][j] - 1));
              if ((protoMap2[i + 1][j + 1] == 0 ||
                      protoMap2[i + 2][j + 1] == 0 ||
                      protoMap2[i + 3][j + 1] == 0) &&
                  (protoMap2[i - 1][j + 1] == 0)) {
                tileList.add(getTileWall(i, j + 1, 11));
                if (Random().nextInt(100) < 9) {
                  //obor
                  decorationPosition.add(DecorationPosition());
                  decorationPosition[idxDec].x = i;
                  decorationPosition[idxDec].y = j + 1;
                  decorationPosition[idxDec].value = 1;
                  idxDec++;
                }
                if (3 > Random().nextInt(100)) {
                  enemyPosition.add(EnemyPosition());
                  enemyPosition[idxEnm].x = i;
                  enemyPosition[idxEnm].y = j;
                  enemyPosition[idxEnm].value = 1;
                  idxEnm++;
                } else if (3 > Random().nextInt(100)) {
                  enemyPosition.add(EnemyPosition());
                  enemyPosition[idxEnm].x = i;
                  enemyPosition[idxEnm].y = j - 1;
                  enemyPosition[idxEnm].value = 2;
                  idxEnm++;
                } else if (3 > Random().nextInt(100)) {
                  enemyPosition.add(EnemyPosition());
                  enemyPosition[idxEnm].x = i - 1;
                  enemyPosition[idxEnm].y = j;
                  enemyPosition[idxEnm].value = 3;
                  idxEnm++;
                } else if (3 > Random().nextInt(100)) {
                  enemyPosition.add(EnemyPosition());
                  enemyPosition[idxEnm].x = i;
                  enemyPosition[idxEnm].y = j;
                  enemyPosition[idxEnm].value = 4;
                  idxEnm++;
                }
              }
              return;
            }
            //lantai kiri
            if (protoMap2[i][j - 1] == 0 && protoMap2[i][j + 1] != 0) {
              protoMap2[i][j] = 4;
              tileList.add(getTile(i, j, protoMap2[i][j] - 1));
              if ((protoMap2[i + 1][j - 1] == 0 ||
                      protoMap2[i + 2][j - 1] == 0 ||
                      protoMap2[i + 3][j - 1] == 0) &&
                  (protoMap2[i - 1][j - 1] == 0)) {
                tileList.add(getTileWall(i, j - 1, 12));
                if (Random().nextInt(100) < 9) {
                  //obor
                  decorationPosition.add(DecorationPosition());
                  decorationPosition[idxDec].x = i;
                  decorationPosition[idxDec].y = j - 1;
                  decorationPosition[idxDec].value = 1;
                  idxDec++;
                }
                if (3 > Random().nextInt(100)) {
                  enemyPosition.add(EnemyPosition());
                  enemyPosition[idxEnm].x = i;
                  enemyPosition[idxEnm].y = j;
                  enemyPosition[idxEnm].value = 1;
                  idxEnm++;
                } else if (3 > Random().nextInt(100)) {
                  enemyPosition.add(EnemyPosition());
                  enemyPosition[idxEnm].x = i;
                  enemyPosition[idxEnm].y = j;
                  enemyPosition[idxEnm].value = 2;
                  idxEnm++;
                } else if (3 > Random().nextInt(100)) {
                  enemyPosition.add(EnemyPosition());
                  enemyPosition[idxEnm].x = i - 1;
                  enemyPosition[idxEnm].y = j;
                  enemyPosition[idxEnm].value = 3;
                  idxEnm++;
                } else if (3 > Random().nextInt(100)) {
                  enemyPosition.add(EnemyPosition());
                  enemyPosition[idxEnm].x = i;
                  enemyPosition[idxEnm].y = j;
                  enemyPosition[idxEnm].value = 4;
                  idxEnm++;
                }
              }
              return;
            }
            if (protoMap2[i][j] != 0) {
              tileList.add(getTile(i, j, 4));
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
        musuh.add(
          Slime(
            position,
          ),
        );
      } else if (enemyPosition[i].value == 1) {
        musuh.add(Box(position));
      } else if (enemyPosition[i].value == 2) {
        musuh.add(Box2(position));
      } else if (enemyPosition[i].value == 3) {
        musuh.add(Box3(position));
      } else if (enemyPosition[i].value == 4) {
        musuh.add(Gentong(position));
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
        decorasi.add(
          Torch(
            position,
          ),
        );
      } else if (decorationPosition[i].value == 1) {
        decorasi.add(
          InvinsibleTorch(
            position,
          ),
        );
      } else if (decorationPosition[i].value == 2) {
        decorasi.add(
          Shield(
            position,
          ),
        );
      } else if (decorationPosition[i].value == 3) {
        decorasi.add(
          Sword(
            position,
          ),
        );
      } else if (decorationPosition[i].value == 4) {
        decorasi.add(
          SwordWF(
            position,
          ),
        );
      } else if (decorationPosition[i].value == 5) {
        decorasi.add(
          BenderaUngu(
            position,
          ),
        );
      } else if (decorationPosition[i].value == 6) {
        decorasi.add(
          BenderaIjo(
            position,
          ),
        );
      }
    }
    return decorasi;
  }
}
