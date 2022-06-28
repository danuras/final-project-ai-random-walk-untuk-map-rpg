import 'package:flutter/material.dart';
import 'package:final_project_ai/main.dart';
import 'package:final_project_ai/shared/iventory/draggable_widget_custom.dart';

class ShorcutPlayerItem {
  static List<Widget> listOfShorcut = [];
  static void generateShorcutData() {
    for (int i = 0; i < 10; i++) {
      listOfShorcut.add(
        DraggableWidgetCustom(
          Container(
            height: tileSize,
            width: tileSize,
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
          ),
        ),
      );
    }
  }
}
