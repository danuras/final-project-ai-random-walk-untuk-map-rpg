import 'package:bonfire/bonfire.dart';
import 'package:flutter/widgets.dart';
import 'package:final_project_ai/shared/util/common_sprite_sheet/common_sprite_sheet.dart';

class ExitMapSensor extends GameDecoration with Sensor {
  final String id;
  bool hasContact = false;
  final ValueChanged<String> exitMap;

  ExitMapSensor(this.id, Vector2 position, Vector2 size, this.exitMap)
      : super.withAnimation(
          animation: CommonSpriteSheet.exitIndicator,
          position: position,
          size: size,
        );

  @override
  void onContact(component) {
    if (!hasContact && component is Player) {
      hasContact = true;
      exitMap(id);
    }
  }
}
