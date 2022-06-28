import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:final_project_ai/main.dart';
import 'package:final_project_ai/shared/util/common_sprite_sheet/common_sprite_sheet.dart';

class Torch extends GameDecoration with Lighting {
  Torch(Vector2 position)
      : super.withAnimation(
          animation: SpriteAnimation.load(
            "decoration/dark_castle/torch.png",
            SpriteAnimationData.sequenced(
              amount: 6,
              stepTime: 0.1,
              textureSize: Vector2(32, 32),
            ),
          ),
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
