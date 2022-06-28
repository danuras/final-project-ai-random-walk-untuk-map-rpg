import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:final_project_ai/main.dart';
import 'package:final_project_ai/shared/util/common_sprite_sheet/common_sprite_sheet.dart';

class InvinsibleTorch extends GameDecoration with Lighting {
  InvinsibleTorch(Vector2 position)
      : super(
          size: Vector2.all(tileSize),
          position: position,
        ) {
    setupLighting(
      LightingConfig(
        radius: width * 5,
        blurBorder: width * 5,
        color: Colors.deepOrangeAccent.withOpacity(0.2),
      ),
    );
  }
}
