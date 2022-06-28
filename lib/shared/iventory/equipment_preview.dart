import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:final_project_ai/shared/iventory/draggable_widget_custom.dart';

import '../../main.dart';
import '../util/player_sprite_sheet/robot_sprite_sheet.dart';

class EquipmentPreview extends StatelessWidget {
  EquipmentPreview(this._listOfEquipment, {Key? key}) : super(key: key);
  List<Widget> _listOfEquipment = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: tileSize * 8,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xff6b0015),
            width: 2.0,
          ),
          gradient: RadialGradient(
            colors: [
              const Color(0x77000000),
              const Color(0xff6b0015).withOpacity(0.4),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(tileSize * 0.3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DraggableWidgetCustom(_listOfEquipment[0]),
                  DraggableWidgetCustom(_listOfEquipment[1]),
                  DraggableWidgetCustom(_listOfEquipment[2]),
                ],
              ),
            ),
            Center(
              child: SizedBox(
                height: tileSize * 4,
                width: tileSize * 4,
                child: RobotSpriteSheet.idleRight.asWidget(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(tileSize * 0.3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DraggableWidgetCustom(_listOfEquipment[3]),
                  DraggableWidgetCustom(_listOfEquipment[4]),
                  DraggableWidgetCustom(_listOfEquipment[5]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
