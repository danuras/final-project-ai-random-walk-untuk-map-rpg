import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:final_project_ai/database/entity/player.dart' as plr;
import 'package:final_project_ai/database/helper/character_helper.dart';
import 'package:final_project_ai/game_UI/add_character.dart';
import 'package:final_project_ai/game_UI/button_leftright_character_provider.dart';
import 'package:final_project_ai/game_UI/button_ok_setcharacter_provider.dart';
import 'package:final_project_ai/game_UI/list_of_player.dart';
import 'package:final_project_ai/game_UI/list_of_widget_player.dart';
import 'package:final_project_ai/game_UI/selected_character_provider.dart';
import 'package:final_project_ai/main.dart';
import 'package:final_project_ai/shared/util/player_sprite_sheet/robot_sprite_sheet.dart';
import 'package:provider/provider.dart';

class SetCharacter extends StatelessWidget {
  SetCharacter(this._characterProvider, this._listOfPlayer, {Key? key})
      : super(key: key);
  final CharacterProvider _characterProvider;
  int ns = 0, lengthOfList = 0;
  final ListOfPlayer _listOfPlayer;

  List<Widget> characterSkin(ListOfPlayer _lop, BuildContext context) {
    List<Widget> list = [];
    int length = _lop.value.length;
    for (int i = 0; i < 15; i++) {
      list.add(
        (i < length)
            ? (_lop.value[i].skin == 1)
                ? Column(
                    children: [
                      SizedBox(
                        height: maxHeight * 0.06,
                      ),
                      SizedBox(
                        height: maxHeight * 0.29,
                        width: maxHeight * 0.29,
                        child: RobotSpriteSheet.idleRight.asWidget(),
                      ),
                      const Spacer(),
                      Text(
                        _listOfPlayer.value[i].name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: maxHeight * 0.05,
                        ),
                      ),
                      SizedBox(
                        height: maxHeight * 0.01,
                      ),
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: maxHeight * 0.12,
                      ),
                      Container(
                        height: maxHeight * 0.2,
                        width: maxHeight * 0.2,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/ui/button3.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (_, __, ___) => AddCharacter(
                                  _listOfPlayer,
                                ),
                              ),
                            );
                          },
                          child: Center(
                            child: Text(
                              "+",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: maxHeight * 0.12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "Tambah",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: maxHeight * 0.05,
                        ),
                      ),
                      SizedBox(
                        height: maxHeight * 0.01,
                      ),
                    ],
                  )
            : Column(
                children: [
                  SizedBox(
                    height: maxHeight * 0.12,
                  ),
                  Container(
                    height: maxHeight * 0.2,
                    width: maxHeight * 0.2,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/ui/button3.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (_, __, ___) =>
                                AddCharacter(_listOfPlayer),
                          ),
                        );
                      },
                      child: Center(
                        child: Text(
                          "+",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: maxHeight * 0.12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Tambah",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: maxHeight * 0.05,
                    ),
                  ),
                  SizedBox(
                    height: maxHeight * 0.01,
                  ),
                ],
              ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ListOfWidgetPlayer>(
      context,
      listen: false,
    ).kosong = Column(
      children: [
        SizedBox(
          height: maxHeight * 0.12,
        ),
        Container(
          height: maxHeight * 0.2,
          width: maxHeight * 0.2,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/ui/button3.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (_, __, ___) => AddCharacter(_listOfPlayer),
                ),
              );
            },
            child: Center(
              child: Text(
                "+",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: maxHeight * 0.12,
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        Text(
          "Tambah",
          style: TextStyle(
            color: Colors.white,
            fontSize: maxHeight * 0.05,
          ),
        ),
        SizedBox(
          height: maxHeight * 0.01,
        ),
      ],
    );

    Provider.of<ListOfWidgetPlayer>(
      context,
      listen: false,
    ).value = characterSkin(_listOfPlayer, context);

    return Material(
      color: const Color.fromRGBO(0, 0, 0, 0.333),
      child: Center(
        child: Container(
          width: maxHeight * 4 / 3,
          height: maxHeight * 11 / 12,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/ui/character_page.png',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 0.013 * maxHeight,
              ),
              Text(
                "Character",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: maxHeight * 0.04,
                ),
              ),
              SizedBox(
                height: 0.084 * maxHeight,
              ),
              SizedBox(
                height: 0.62 * maxHeight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: maxHeight * 0.534,
                      child: Consumer<ButtonLeftRightCharacterProvider>(
                        builder: (context, blr, _) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            (blr.ns != 0)
                                ? SizedBox(
                                    width: maxHeight * 0.1,
                                    child: IconButton(
                                      onPressed: () {
                                        blr.ns--;
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back_ios_sharp,
                                        color: Color(0xffF4006F),
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    width: maxHeight * 0.1,
                                  ),
                            Consumer<SelectedCharacterProvider>(
                              builder:
                                  (context, selectedCharacterProvider, _) =>
                                      InkWell(
                                onTap: () {
                                  selectedCharacterProvider.selected =
                                      blr.ns * 3;
                                },
                                child: Container(
                                  width: maxHeight * 0.312,
                                  height: maxHeight * 0.534,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        selectedCharacterProvider.selected ==
                                                blr.ns * 3
                                            ? 'assets/images/ui/selected_character_background.png'
                                            : 'assets/images/ui/character_background.png',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Consumer<ListOfWidgetPlayer>(
                                    builder: (context, _lowp, _) => Align(
                                      alignment: const Alignment(0, -0.3),
                                      child: _lowp.value[blr.ns * 3],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: maxHeight * 0.03,
                            ),
                            Consumer<SelectedCharacterProvider>(
                              builder:
                                  (context, selectedCharacterProvider, _) =>
                                      InkWell(
                                onTap: () {
                                  selectedCharacterProvider.selected =
                                      blr.ns * 3 + 1;
                                },
                                child: Container(
                                  width: maxHeight * 0.312,
                                  height: maxHeight * 0.534,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        selectedCharacterProvider.selected ==
                                                blr.ns * 3 + 1
                                            ? 'assets/images/ui/selected_character_background.png'
                                            : 'assets/images/ui/character_background.png',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Consumer<ListOfWidgetPlayer>(
                                    builder: (context, _lowp, _) => Align(
                                      alignment: const Alignment(0, -0.3),
                                      child: _lowp.value[blr.ns * 3 + 1],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: maxHeight * 0.03,
                            ),
                            Consumer<SelectedCharacterProvider>(
                              builder:
                                  (context, selectedCharacterProvider, _) =>
                                      InkWell(
                                onTap: () {
                                  selectedCharacterProvider.selected =
                                      blr.ns * 3 + 2;
                                },
                                child: Container(
                                  width: maxHeight * 0.312,
                                  height: maxHeight * 0.534,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        selectedCharacterProvider.selected ==
                                                blr.ns * 3 + 2
                                            ? 'assets/images/ui/selected_character_background.png'
                                            : 'assets/images/ui/character_background.png',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Consumer<ListOfWidgetPlayer>(
                                    builder: (context, _lowp, _) => Align(
                                      alignment: const Alignment(0, -0.3),
                                      child: _lowp.value[blr.ns * 3 + 2],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            (blr.ns != 4)
                                ? SizedBox(
                                    width: maxHeight * 0.1,
                                    child: IconButton(
                                      onPressed: () {
                                        blr.ns++;
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: Color(0xffF4006F),
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    width: maxHeight * 0.1,
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.041 * maxHeight,
              ),
              Consumer<ButtonOkSetCharacterProvider>(
                builder: (context, buttonOkSetCharacterProvider, _) =>
                    Container(
                  height: maxHeight * 492 / 4550,
                  width: maxHeight * 1562 / 4550,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                        'assets/images/ui/clicked_button2.png',
                      ),
                      opacity: buttonOkSetCharacterProvider.clicked ? 1.00 : 0,
                    ),
                  ),
                  child: SizedBox(
                    height: maxHeight * 492 / 4550,
                    width: maxHeight * 1562 / 4550,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTapDown: (tap) {
                        buttonOkSetCharacterProvider.clicked = true;
                      },
                      onTapUp: (tap) {
                        buttonOkSetCharacterProvider.clicked = false;
                      },
                      onTapCancel: () {
                        buttonOkSetCharacterProvider.clicked = false;
                      },
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Text(
                          "OK",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: maxHeight * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
