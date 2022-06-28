import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:final_project_ai/game/dark_land_map.dart';
import 'package:final_project_ai/game/green_place.dart';
import 'package:final_project_ai/game/random_dungeon_dc.dart';
import 'package:final_project_ai/game_UI/button2.dart';
import 'package:final_project_ai/game_UI/first_open.dart';
import 'package:final_project_ai/game_UI/list_of_player.dart';
import 'package:final_project_ai/game_UI/set_character.dart';
import 'package:final_project_ai/main.dart';
import 'package:final_project_ai/random_map/plains_generator.dart';

import 'database/helper/character_helper.dart';
import 'shared/interface/shorcut_player_item.dart';

class MenuFP extends StatelessWidget {
  const MenuFP({Key? key}) : super(key: key);

  void playPlains(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LayoutBuilder(builder: (context, constraints) {
          ShorcutPlayerItem.listOfShorcut =
              []; /* 
          ShorcutPlayerItem.generateShorcutData(); */
          return GreenPlace(constraints.maxHeight);
        }),
      ),
    );
  }

  void playDungeon(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LayoutBuilder(builder: (context, constraints) {
          ShorcutPlayerItem.listOfShorcut =
              []; /* 
          ShorcutPlayerItem.generateShorcutData(); */
          return RandomDungeonDC(constraints.maxHeight);
        }),
      ),
    );
  }

  void playSkyIsland(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LayoutBuilder(builder: (context, constraints) {
          ShorcutPlayerItem.listOfShorcut =
              []; /* 
          ShorcutPlayerItem.generateShorcutData(); */
          return DarkLandMap(constraints.maxHeight);
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
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: maxHeight * 0.03,
                  ),
                  Button2(
                    "Dungeon",
                    () => playDungeon(context),
                  ),
                  SizedBox(
                    height: maxHeight * 0.03,
                  ),
                  Button2(
                    "Sky Island",
                    () => playSkyIsland(context),
                  ),
                  SizedBox(
                    height: maxHeight * 0.03,
                  ),
                  Button2(
                    "Plains",
                    () => playPlains(context),
                  ),
                  SizedBox(
                    height: maxHeight * 0.03,
                  ),
                  Button2(
                    "Exit",
                    () => exit(0),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
