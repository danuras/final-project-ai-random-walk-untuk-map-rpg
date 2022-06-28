import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:final_project_ai/game/dark_land_map.dart';
import 'package:final_project_ai/game/green_place.dart';
import 'package:final_project_ai/game_UI/button2.dart';
import 'package:final_project_ai/game_UI/first_open.dart';
import 'package:final_project_ai/game_UI/list_of_player.dart';
import 'package:final_project_ai/game_UI/set_character.dart';
import 'package:final_project_ai/main.dart';
import 'package:final_project_ai/random_map/plains_generator.dart';

import 'database/helper/character_helper.dart';
import 'shared/interface/shorcut_player_item.dart';

class PlayMenu extends StatelessWidget {
  const PlayMenu({Key? key}) : super(key: key);
/* 
  Widget worldBox = Column(
    children: [
      SizedBox(
        height: maxHeight * 0.2,
        child: Image.asset(
          'assets/images/ui/bg_atas.png',
        ),
      ),
      SizedBox(
        height: maxHeight * 0.2,
        child: Image.asset(
          'assets/images/ui/bg_tengah.png',
          fit: BoxFit.fill,
        ),
      ),
      Image.asset(
        'assets/images/ui/bg_bawah.png',
      ),
    ],
  ); */

  void playGame(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LayoutBuilder(builder: (context, constraints) {
          ShorcutPlayerItem.listOfShorcut = [];
          ShorcutPlayerItem.generateShorcutData();
          return GreenPlace(constraints.maxHeight);
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

  void showListOfWorld() {
    List<Widget> listOfWorld = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: maxHeight * 0.4,
                height: maxHeight * 0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/ui/bundaran.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {},
                ),
              ),
            ),
            Align(
              alignment: const Alignment(-1, 0.95),
              child: Row(
                children: [
                  SizedBox(
                    width: maxHeight * 0.03,
                  ),
                  Button2(
                    "Exit",
                    () {},
                  ),
                  SizedBox(
                    width: maxHeight * 0.03,
                  ),
                  Button2(
                    "Setting",
                    () {},
                  ),
                  SizedBox(
                    width: maxHeight * 0.03,
                  ),
                  Button2(
                    "Play",
                    () => playGame(context),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const Alignment(0.9, 0.9),
              child: SizedBox(
                width: maxHeight * 810 / 2000,
                child: ListView(
                  children: [
                    Container(
                      height: maxHeight * 615 / 2000,
                      width: maxHeight * 810 / 2000,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/ui/worldBox.png",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: maxHeight * 0.02,
                    ),
                    Container(
                      height: maxHeight * 615 / 2000,
                      width: maxHeight * 810 / 2000,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/ui/worldBox.png",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: maxHeight * 0.02,
                    ),
                    Container(
                      height: maxHeight * 615 / 2000,
                      width: maxHeight * 810 / 2000,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/ui/worldBox.png",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: maxHeight * 0.02,
                    ),
                    Container(
                      height: maxHeight * 615 / 2000,
                      width: maxHeight * 810 / 2000,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/ui/worldBox.png",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: maxHeight * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
