import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:final_project_ai/game/infested_map_1.dart';
import 'package:final_project_ai/shared/enemy/slime.dart';
import 'package:final_project_ai/shared/interface/bar_life_widget.dart';
import 'package:final_project_ai/shared/interface/robot_interface.dart';
import 'package:final_project_ai/shared/player/robot.dart';
import 'package:final_project_ai/shared/util/map_util/extensions.dart';

import '../main.dart';
import '../shared/player/robot_controller.dart';
import '../shared/util/map_util/exit_map_sensor.dart';

class InfestedMap2 extends StatelessWidget {
  final LocationSet locationSet;

  const InfestedMap2({Key? key, this.locationSet = LocationSet.bottom})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    BonfireInjector().put((i) => RobotController());
    return BonfireTiledWidget(
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
            align: JoystickActionAlign.BOTTOM_RIGHT,
          ),
        ],
      ),
      player: Robot(
        _getInitPosition(),
        initDirection: _getDirection(),
      ),
      interface: RobotInterface(),
      map: TiledWorldMap(
        'tiled/infested_map_2.json',
        forceTileSize: Size(tileSize, tileSize),
        objectsBuilder: {
          'slime': (properties) => Slime(properties.position),
        },
      )..registerObject(
          'ext_bottom',
          (properties) => ExitMapSensor(
            'ext_bottom',
            properties.position,
            properties.size,
            (v) => _exitMap(v, context),
          ),
        ),
      background: BackgroundColorGame(Colors.blueGrey[900]!),
      //lightingColorGame: Colors.black.withOpacity(0.7),
      overlayBuilderMap: {
        'barLife': (context, game) => BarLifeWidget(),
      },
      initialActiveOverlays: [
        'barLife',
      ],
      cameraConfig: CameraConfig(
        sizeMovementWindow: Vector2.zero(),
        smoothCameraEnabled: true,
        smoothCameraSpeed: 2,
        moveOnlyMapArea: true,
        zoom: 1,
      ),
      progress: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.black,
      ),
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
        return Vector2(tileSize * 13, tileSize * 47);
      default:
        return Vector2.zero();
    }
  }

  void _exitMap(String value, BuildContext context) {
    if (value == 'ext_bottom') {
      context.goTo(const InfestedMap1(
        locationSet: LocationSet.top,
      ));
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
}
