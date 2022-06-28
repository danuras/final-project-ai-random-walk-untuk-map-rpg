import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:final_project_ai/database/entity/player.dart' as plr;
import 'package:final_project_ai/main.dart';
import 'package:final_project_ai/shared/util/player_sprite_sheet/robot_sprite_sheet.dart';
import 'package:provider/provider.dart';

import 'add_character.dart';
import 'list_of_player.dart';

class ListOfWidgetPlayer with ChangeNotifier {
  List<Widget> _value = [];
  List<Widget> get value => _value;

  set value(List<Widget> value) {
    _value = value;
    //notifyListeners();
  }

  late Widget kosong;

  void add(plr.Player player, int last) {
    if (player.skin == 1) {
      _value[last] = Column(
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
            player.name,
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
    }
    notifyListeners();
  }

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
                        _lop.value[i].name,
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
                : kosong
            : kosong,
      );
    }
    return list;
  }
}
