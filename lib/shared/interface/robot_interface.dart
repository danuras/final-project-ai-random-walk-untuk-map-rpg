import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:final_project_ai/menu_fp.dart';
import 'package:final_project_ai/shared/interface/shorcut_player_item.dart';
import 'package:final_project_ai/shared/iventory/shorcut_item.dart';
import 'package:final_project_ai/shared/player/robot.dart';

import '../iventory/inventory.dart';
import 'bar_life_component.dart';

class RobotInterface extends GameInterface {
  static const followerWidgetTestId = 'BUTTON';

  @override
  void onMount() {
    add(BarLifeComponent());
    add(InterfaceComponent(
      spriteUnselected: Sprite.load('button_menu_nc.png'),
      spriteSelected: Sprite.load('button_menu_c.png'),
      size: Vector2(40, 40),
      id: 5,
      position: Vector2(150, 20),
      onTapComponent: (selected) {
        Navigator.pop(context);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MenuFP()));
      },
    )); /*
    add(InterfaceComponent(
      spriteUnselected: Sprite.load('blue_button1.png'),
      spriteSelected: Sprite.load('blue_button2.png'),
      size: Vector2(40, 40),
      id: 5,
      position: Vector2(200, 20),
      selectable: true,
      onTapComponent: (selected) {
        Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false,
            pageBuilder: (_, __, ___) {
              return const Inventory();
            },
          ),
        );
      },
    )); /* 
    add(InterfaceComponent(
      spriteUnselected: Sprite.load('blue_button1.png'),
      spriteSelected: Sprite.load('blue_button2.png'),
      size: Vector2(40, 40),
      id: 5,
      position: Vector2(200, 20),
      selectable: true,
      onTapComponent: (selected) {
        if (gameRef.player != null) {
          (gameRef.player as Robot).changeControllerToVisibleEnemy();
        }
      },
    )); */
    add(InterfaceComponent(
      spriteUnselected: Sprite.load('blue_button1.png'),
      spriteSelected: Sprite.load('blue_button2.png'),
      size: Vector2(40, 40),
      id: 5,
      position: Vector2(250, 20),
      selectable: true,
      onTapComponent: (selected) {
        if (!selected && FollowerWidget.isVisible(followerWidgetTestId)) {
          FollowerWidget.remove(followerWidgetTestId);
          return;
        }
        gameRef.player?.let((player) {
          FollowerWidget.show(
            identify: followerWidgetTestId,
            context: context,
            target: player,
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  print('Tapped');
                },
                child: Text('Tap here'),
              ),
            ),
            align: Offset(0, -55),
          );
        });
      },
    ));
    add(InterfaceComponent(
      spriteUnselected: Sprite.load('blue_button1.png'),
      spriteSelected: Sprite.load('blue_button2.png'),
      size: Vector2(40, 40),
      id: 5,
      position: Vector2(300, 20),
      selectable: false,
      onTapComponent: (selected) {
        if (gameRef.colorFilter?.config.color == null) {
          gameRef.colorFilter?.animateTo(
            Colors.red.withOpacity(0.5),
          );
        } else {
          gameRef.colorFilter?.animateTo(Colors.transparent, onFinish: () {
            gameRef.colorFilter?.config.color = null;
          });
        }
      },
    ));
    add(TextInterfaceComponent(
      text: 'Text example',
      textConfig: TextStyle(
        color: Colors.white,
      ),
      id: 5,
      position: Vector2(350, 20),
      onTapComponent: (selected) {
        if (gameRef.player != null) {
          (gameRef.player as Robot).execShowEmote();
        }
      },
    ));*/
    super.onMount();
  }
}
