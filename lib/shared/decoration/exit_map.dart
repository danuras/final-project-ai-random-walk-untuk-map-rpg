import 'package:bonfire/bonfire.dart';
import 'package:flutter/widgets.dart';
import 'package:final_project_ai/shared/util/common_sprite_sheet/common_sprite_sheet.dart';

class ExitIndicator extends GameDecoration with Sensor {
  final String id;
  bool hasContact = false;
  final ValueChanged<String> exitMap;
  double dt = 0;

  ExitIndicator(this.id, Vector2 position, this.exitMap)
      : super.withAnimation(
          animation: CommonSpriteSheet.exitIndicator,
          position: position,
          size: Vector2.all(32),
        );

  @override
  void update(double dt) {
    this.dt = dt;
    super.update(dt);
  }

  @override
  void onContact(component) {
    if (!hasContact && component is Player) {
      hasContact = true;
      exitMap(id);
    }
  }
}
