import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:final_project_ai/database/helper/character_helper.dart';
import 'package:final_project_ai/game/dark_land_map.dart';
import 'package:final_project_ai/game/random_dungeon_dc.dart';
import 'package:final_project_ai/game_UI/button2.dart';
import 'package:final_project_ai/game_UI/first_open.dart';
import 'package:final_project_ai/game_UI/list_of_player.dart';
import 'package:final_project_ai/main.dart';
import 'package:final_project_ai/play_menu.dart';
import 'package:final_project_ai/profile.dart';
import 'package:final_project_ai/shared/interface/shorcut_player_item.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import 'database/entity/player.dart';
import 'game_UI/set_character.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);
  void playGame(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LayoutBuilder(builder: (context, constraints) {
          ShorcutPlayerItem.listOfShorcut = [];
          ShorcutPlayerItem.generateShorcutData();
          return PlayMenu();
        }),
      ),
    );
  }

  void firstOpen(BuildContext context) async {
    CharacterProvider characterProvider = CharacterProvider();
    await characterProvider.open();
    if (!(await characterProvider.isPlayerExists())) {
      Navigator.of(context).push(
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (_, __, ___) => FirstOpen(),
        ),
      );
    }
  }

  void changeCharacter(BuildContext context) async {
    ListOfPlayer _listOfPlayer = ListOfPlayer();
    CharacterProvider characterProvider = CharacterProvider();
    await characterProvider.open();
    _listOfPlayer.value = await characterProvider.getAllPlayer();
    characterProvider.close();
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, __, ___) => SetCharacter(
          characterProvider,
          _listOfPlayer,
        ),
      ),
    );
  }

  void exitGame() {
    exit(0);
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => firstOpen(context));

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff12202d),
      body: LayoutBuilder(builder: (context, constraints) {
        tileSize = max(constraints.maxHeight, constraints.maxWidth) / 18;
        maxHeight = constraints.maxHeight;
        return Stack(
          children: [
            SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Image.asset(
                'assets/images/ui/night_sky.jpg',
                fit: BoxFit.cover,
              ),
            ),
            /* 
            Column(
              children: [
                Image.asset(
                  'assets/images/ui/bg_atas.png',
                ),
                Expanded(
                  child: Image.asset(
                    'assets/images/ui/bg_tengah.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Image.asset(
                  'assets/images/ui/bg_bawah.png',
                ),
              ],
            ), */
            Row(
              children: [
                SizedBox(
                  width: tileSize * 0.8,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: maxHeight * 0.07,
                    ),
                    Container(
                      width: maxHeight,
                      height: maxHeight * 0.125,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/ui/kotak4.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Interdimensional Heroes',
                          style: TextStyle(
                            fontSize: tileSize * 0.45,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      height: maxHeight * 1450 / 2100,
                      width: maxHeight * 2563 / 2100,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/ui/bg_atas.png',
                          ),
                          Expanded(
                            child: Image.asset(
                              'assets/images/ui/bg_tengah.png',
                              fit: BoxFit.fill,
                            ),
                          ),
                          Image.asset(
                            'assets/images/ui/bg_bawah.png',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: maxHeight * 0.07,
                    ),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  height: maxHeight * 1543 / 2500,
                  width: maxHeight * 1185 / 2500,
                  child: Column(
                    children: [
                      Button2(
                        'Play',
                        () => playGame(context),
                      ),
                      SizedBox(
                        height: tileSize * 0.3,
                      ),
                      Button2(
                        'Character',
                        () => changeCharacter(context),
                      ),
                      SizedBox(
                        height: tileSize * 0.3,
                      ),
                      Button2(
                        'Setting',
                        () => firstOpen(context),
                      ),
                      SizedBox(
                        height: tileSize * 0.3,
                      ),
                      Button2(
                        'Exit',
                        () => exitGame(),
                      ),
                      SizedBox(
                        height: tileSize,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: tileSize * 0.8,
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
