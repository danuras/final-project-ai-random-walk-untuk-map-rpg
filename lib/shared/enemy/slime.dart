import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:final_project_ai/shared/item/potion_life.dart';
import 'package:final_project_ai/shared/util/common_sprite_sheet/common_sprite_sheet.dart';
import 'package:final_project_ai/shared/util/enemy_sprite_sheet/slime_sprite_sheet.dart';

import '../../main.dart';
import 'slime_controller.dart';

class Slime extends SimpleEnemy
    with
        ObjectCollision, //untuk dapat mengatur tabrakan/collision
        JoystickListener,
        MovementByJoystick,
        AutomaticRandomMovement,
        UseStateController<SlimeController> {
  Slime(Vector2 position)
      : super(
          animation: SlimeSpriteSheet.simpleDirectionAnimation,
          position: position,
          size: Vector2.all(tileSize * 0.8),
          speed: tileSize * 1.6,
          life: 100,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(
              tileSize * 0.4,
              tileSize * 0.4,
            ),
            align: Vector2(
              tileSize * 0.2,
              tileSize * 0.2,
            ),
          ),
        ],
      ),
    );
  }

  //untuk merender UI seperti lifebar
  @override
  void render(Canvas canvas) {
    super.render(canvas);
    drawDefaultLifeBar(
      canvas,
      borderRadius: BorderRadius.circular(5),
      borderWidth: 2,
    );
  }

  //method untuk memproses kematian
  @override
  void die() {
    super.die();
    gameRef.add(
      AnimatedObjectOnce(
        animation: CommonSpriteSheet.smokeExplosion,
        position: position,
        size: Vector2.all(tileSize),
      ),
    );
    gameRef.add(
      PotionLife(position, 30),
    );
    removeFromParent();
  }

  //memproses mengirim damage attack range
  void execAttackRange(double damage) {
    if (gameRef.player != null && gameRef.player?.isDead == true) return;
    simpleAttackRange(
      animationRight: CommonSpriteSheet.fireBallRight,
      animationLeft: CommonSpriteSheet.fireBallLeft,
      animationUp: CommonSpriteSheet.fireBallTop,
      animationDown: CommonSpriteSheet.fireBallBottom,
      animationDestroy: CommonSpriteSheet.explosionAnimation,
      id: 35,
      size: Vector2.all(width * 0.9),
      damage: damage,
      speed: tileSize * 3,
      collision: CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2.all(width / 2),
            align: Vector2(width * 0.25, width * 0.25),
          ),
        ],
      ),
      lightingConfig: LightingConfig(
        radius: width / 2,
        blurBorder: width,
        color: Colors.orange.withOpacity(0.3),
      ),
    );
  }

  //program untuk memproses memberikan damage dari attack melle
  void execAttack(double damage) {
    if (gameRef.player != null && gameRef.player?.isDead == true) return;
    simpleAttackMelee(
      size: Vector2.all(width),
      damage: damage / 2,
      interval: 400,
      sizePush: tileSize / 2,
      animationDown: CommonSpriteSheet.blackAttackEffectBottom,
      animationLeft: CommonSpriteSheet.blackAttackEffectLeft,
      animationRight: CommonSpriteSheet.blackAttackEffectRight,
      animationUp: CommonSpriteSheet.blackAttackEffectTop,
    );
  }

  //untuk menampilkan damage yang diterima dan memproses penerimaan damage
  @override
  void receiveDamage(AttackFromEnum attacker, double damage, dynamic from) {
    showDamage(
      damage,
      config: TextStyle(
        fontSize: width / 3,
        color: Colors.white,
      ),
    );
    super.receiveDamage(attacker, damage, from);
  }

  @override
  void joystickAction(JoystickActionEvent event) {}

  @override
  void moveTo(Vector2 position) {}
}
