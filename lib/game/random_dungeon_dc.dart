import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:final_project_ai/random_map/dungeon_dark_castle.dart';
import 'package:final_project_ai/shared/interface/bar_life_widget.dart';
import 'package:final_project_ai/shared/interface/robot_interface.dart';
import 'package:final_project_ai/shared/player/robot.dart';
import 'package:final_project_ai/shared/util/map_util/extensions.dart';

import '../main.dart';
import '../shared/interface/shorcut_player_item.dart';
import '../shared/player/robot_controller.dart';
import '../shared/util/map_util/exit_map_sensor.dart';

class RandomDungeonDC extends StatelessWidget implements GameListener {
  final LocationSet locationSet;
  final GameController _controller = GameController();
  final double maxHeight;

  RandomDungeonDC(this.maxHeight,
      {Key? key, this.locationSet = LocationSet.bottom})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    BonfireInjector().put((i) => RobotController());
    return Stack(
      children: [
        BonfireWidget(
          joystick: Joystick(
            keyboardConfig: KeyboardConfig(
              keyboardDirectionalType: KeyboardDirectionalType.wasdAndArrows,
              acceptedKeys: [
                LogicalKeyboardKey.space,
              ],
            ),
            directional: JoystickDirectional(
              spriteBackgroundDirectional: Sprite.load(
                'joystick_background.png',
              ),
              spriteKnobDirectional: Sprite.load('joystick_knob.png'),
              size: 100,
              isFixed: false,
            ),
            actions: [
              JoystickAction(
                actionId: PlayerAttackType.attackMelee,
                sprite: Sprite.load('joystick_atack.png'),
                align: JoystickActionAlign.BOTTOM_RIGHT,
                size: 80,
                margin: const EdgeInsets.only(bottom: 50, right: 50),
              ),
              JoystickAction(
                actionId: PlayerAttackType.attackRange,
                sprite: Sprite.load('joystick_atack_range.png'),
                spriteBackgroundDirection: Sprite.load(
                  'joystick_background.png',
                ),
                enableDirection: true,
                size: 50,
                margin: const EdgeInsets.only(bottom: 50, right: 160),
              )
            ],
          ),
          map: DungeonDarkCastleMap.map(),
          player: Robot(
            Vector2(
              DungeonDarkCastleMap.playerPosition[0][1] * tileSize,
              DungeonDarkCastleMap.playerPosition[0][0] * tileSize,
            ),
            initDirection: _getDirection(),
          ),
          interface: RobotInterface(),
          background: BackgroundColorGame(Colors.black),
          gameController: _controller..addListener(this),
          enemies: DungeonDarkCastleMap.enemies(),
          decorations: DungeonDarkCastleMap.decorations() +
              [
                ExitMapSensor(
                  'ext_bottom',
                  Vector2(
                    DungeonDarkCastleMap.exitPotition[0][1] * tileSize,
                    DungeonDarkCastleMap.exitPotition[0][0] * tileSize,
                  ),
                  Vector2(tileSize, tileSize),
                  (v) => _exitMap(v, context),
                ),
              ],
          lightingColorGame: Colors.black.withOpacity(0.7),
          overlayBuilderMap: {
            'barLife': (context, game) => const BarLifeWidget(),
            'miniMap': (context, game) => MiniMap(
                  game: game,
                  margin: const EdgeInsets.all(20),
                  borderRadius: BorderRadius.circular(maxHeight / 6),
                  decorationColor: Colors.blue,
                  size: Vector2.all(maxHeight / 3),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
          },
          initialActiveOverlays: const [
            'barLife',
            'miniMap',
          ],
          cameraConfig: CameraConfig(
            sizeMovementWindow: Vector2.zero(),
            smoothCameraEnabled: false,
            smoothCameraSpeed: 2,
            moveOnlyMapArea: false,
            zoom: 1,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: ShorcutPlayerItem.listOfShorcut,
          ),
        )
      ],
    );
  }

  Vector2 _getInitPosition() {
    switch (locationSet) {
      case LocationSet.left:
        return Vector2(tileSize * 2, tileSize * 10);
      case LocationSet.right:
        return Vector2(tileSize * 27, tileSize * 12);
      case LocationSet.top:
        return Vector2(tileSize * 1, tileSize * 13);
      case LocationSet.bottom:
        return Vector2(tileSize * 5, tileSize * 5);
      default:
        return Vector2.zero();
    }
  }

  void _exitMap(String value, BuildContext context) {
    if (value == 'ext_bottom') {
      Navigator.pop(context);
      context.goTo(RandomDungeonDC(maxHeight));
    }
  }

  Direction _getDirection() {
    switch (locationSet) {
      case LocationSet.left:
        return Direction.right;
      case LocationSet.right:
        return Direction.left;
      case LocationSet.top:
        return Direction.right;
      case LocationSet.bottom:
        return Direction.right;
      default:
        return Direction.right;
    }
  }

  @override
  void changeCountLiveEnemies(int count) {
    // TODO: implement changeCountLiveEnemies
  }

  @override
  void updateGame() {
    // TODO: implement updateGame
  }
}
