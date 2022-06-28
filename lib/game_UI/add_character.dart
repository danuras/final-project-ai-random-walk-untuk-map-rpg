import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:final_project_ai/database/entity/player.dart';
import 'package:final_project_ai/database/helper/character_helper.dart';
import 'package:final_project_ai/game_UI/button_leftright_character_provider.dart';
import 'package:final_project_ai/game_UI/list_of_player.dart';
import 'package:final_project_ai/game_UI/list_of_widget_player.dart';
import 'package:final_project_ai/main.dart';
import 'package:final_project_ai/shared/util/popup/popup.dart';
import 'package:provider/provider.dart';

class AddCharacter extends StatelessWidget {
  AddCharacter(this._lop, {Key? key}) : super(key: key);
  final TextEditingController _controller = TextEditingController(text: "");
  final ListOfPlayer _lop;

  Future<dynamic> addCharacterOne(BuildContext context, Player player) async {
    CharacterProvider characterProvider = CharacterProvider();
    await characterProvider.open();

    int i = await characterProvider.insert(
      player,
      context,
    );
    print("nilai dari i adalah " + i.toString());
    return i;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromRGBO(0, 0, 0, 0.333),
      child: Center(
        child: Container(
          width: maxHeight * 2019 / 2500,
          height: maxHeight * 2219 / 2500,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/ui/kotak9.png',
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
                "Buat Karakter",
                style: TextStyle(
                  color: const Color(0xffFF80C5),
                  fontSize: maxHeight * 0.04,
                ),
              ),
              SizedBox(
                height: 0.114 * maxHeight,
              ),
              Container(
                width: maxHeight * 2019 / 3800,
                height: maxHeight * 2219 / 3800,
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: maxHeight * 0.01,
                    ),
                    Text(
                      "NAME",
                      style: TextStyle(
                        color: const Color(0xffF40049),
                        fontSize: maxHeight * 0.035,
                      ),
                    ),
                    Container(
                      width: maxHeight * 1306 / 2500,
                      height: maxHeight * 200 / 2500,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/ui/textBox.png',
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 3, 3, 2),
                        child: TextField(
                          keyboardType: TextInputType.name,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(20),
                          ],
                          controller: _controller,
                          style: const TextStyle(
                            color: Color(0xffffffff),
                            decoration: TextDecoration.none,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterStyle: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: Container(
                        width: maxHeight * 308 / 2500,
                        height: maxHeight * 330 / 2500,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/ui/button3.png',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Center(
                          child: Consumer<ListOfWidgetPlayer>(
                            builder: (contexte, _lowp, _) =>
                                Consumer<ButtonLeftRightCharacterProvider>(
                              builder: (contexte, blr, _) => InkWell(
                                onTap: () async {
                                  Player player = Player();
                                  player.name = _controller.text;
                                  player.exp = 0;
                                  player.gem = 10;
                                  player.money = 1000;
                                  player.skin = 1;
                                  player.level = 1;
                                  _lowp.add(
                                    player,
                                    _lop.value.length,
                                  );
                                  int i = await addCharacterOne(
                                    context,
                                    player,
                                  );
                                  if (i != 0) {
                                    blr.ns = (_lop.value.length / 3).truncate();

                                    _lop.value.add(player);

                                    Navigator.pop(context);
                                    popup(
                                      "Data player berhasil disimpan!",
                                      context,
                                    );
                                  }
                                },
                                child: Text(
                                  "OK",
                                  style: TextStyle(
                                    color: const Color(0xffFF80C5),
                                    fontSize: maxHeight * 0.03,
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
