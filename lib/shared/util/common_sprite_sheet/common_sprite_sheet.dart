import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class CommonSpriteSheet {
  static Future<SpriteAnimation> get explosionAnimation => SpriteAnimation.load(
        "player/attack/range/explosion_fire.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
        ),
      );

  static Future<SpriteAnimation> get emote => SpriteAnimation.load(
        "player/emote/emote_exclamacao.png",
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
        ),
      );
  static Future<SpriteAnimation> get smokeExplosion => SpriteAnimation.load(
        "smoke_explosin.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get whiteAttackEffectBottom =>
      SpriteAnimation.load(
        "player/attack/melee/atack_effect_bottom.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get whiteAttackEffectLeft =>
      SpriteAnimation.load(
        "player/attack/melee/atack_effect_left.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get whiteAttackEffectRight =>
      SpriteAnimation.load(
        "player/attack/melee/atack_effect_right.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get whiteAttackEffectTop =>
      SpriteAnimation.load(
        "player/attack/melee/atack_effect_top.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get blackAttackEffectBottom =>
      SpriteAnimation.load(
        "enemy/atack_effect_bottom.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get blackAttackEffectLeft =>
      SpriteAnimation.load(
        "enemy/atack_effect_left.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get blackAttackEffectRight =>
      SpriteAnimation.load(
        "enemy/atack_effect_right.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get blackAttackEffectTop =>
      SpriteAnimation.load(
        "enemy/atack_effect_top.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(16, 16),
        ),
      );

  static Future<SpriteAnimation> get fireBallRight => SpriteAnimation.load(
        "player/attack/range/fireball_right.png",
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(23, 23),
        ),
      );

  static Future<SpriteAnimation> get fireBallLeft => SpriteAnimation.load(
        "player/attack/range/fireball_left.png",
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(23, 23),
        ),
      );

  static Future<SpriteAnimation> get fireBallBottom => SpriteAnimation.load(
        "player/attack/range/fireball_bottom.png",
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(23, 23),
        ),
      );

  static Future<SpriteAnimation> get fireBallTop => SpriteAnimation.load(
        "player/attack/range/fireball_top.png",
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(23, 23),
        ),
      );
  static Future<SpriteAnimation> get exitIndicator => SpriteAnimation.load(
        "exit.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.2,
          textureSize: Vector2(32, 32),
        ),
      );
  static Future<SpriteAnimation> get torchAnimated => SpriteAnimation.load(
        "decoration/torch.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
        ),
      );
}
