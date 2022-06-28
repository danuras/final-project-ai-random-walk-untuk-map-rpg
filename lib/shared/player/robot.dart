import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:final_project_ai/shared/enemy/slime.dart';
import 'package:final_project_ai/shared/interface/bar_life_controller.dart';
import 'package:final_project_ai/shared/util/common_sprite_sheet/common_sprite_sheet.dart';
import 'package:final_project_ai/shared/util/enemy_sprite_sheet/slime_sprite_sheet.dart';
import 'package:final_project_ai/shared/util/player_sprite_sheet/robot_sprite_sheet.dart';

import '../../main.dart';
import 'robot_controller.dart';

enum PlayerAttackType { attackMelee, attackRange }

class Robot extends SimplePlayer
    with Lighting, ObjectCollision, UseStateController<RobotController> {
  static final double maxSpeed = tileSize * 3;
  Paint _paintFocus = Paint()..blendMode = BlendMode.clear;

  double angleRadAttack = 0.0;
  Rect? rectDirectionAttack;
  Sprite? spriteDirectionAttack;
  bool showBgRangeAttack = false;
  Slime? enemyControlled;
  bool isWater = false;

  BarLifeController? barLifeController;

  Robot(Vector2 position, {Direction initDirection = Direction.right})
      : super(
          animation: RobotSpriteSheet.simpleDirectionAnimation,
          size: Vector2.all(tileSize),
          position: position,
          life: 20000,
          speed: maxSpeed,
          initDirection: initDirection,
        ) {
    setupLighting(
      LightingConfig(
        radius: width * 1.5,
        blurBorder: width * 1.5,
        color: Colors.transparent,
      ),
    );
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(
              tileSize / 2,
              tileSize,
            ),
            align: Vector2(
              tileSize / 3.5,
              tileSize / 3.5,
            ),
          )
        ],
      ),
    );
  }

  @override
  void joystickChangeDirectional(JoystickDirectionalEvent event) {
    if (event.directional != JoystickMoveDirectional.IDLE) {
      speed = (maxSpeed * (isWater ? 0.5 : 1)) * event.intensity;
    }
    super.joystickChangeDirectional(event);
    isWater = tileIsWater();
  }

  bool tileIsWater() => TiledWorldMap.ABOVE_TYPE == 'water';

  @override
  void joystickAction(JoystickActionEvent event) {
    controller.handleJoystickAction(event);
    super.joystickAction(event);
  }

  @override
  void die() {
    removeFromParent();
    gameRef.add(
      GameDecoration.withSprite(
        sprite: Sprite.load('player/death/crypt.png'),
        position: position,
        size: Vector2.all(tileSize),
      ),
    );
    super.die();
  }

  void execMeleeAttack(double attack) {
    simpleAttackMelee(
      damage: attack,
      animationDown: CommonSpriteSheet.whiteAttackEffectBottom,
      animationLeft: CommonSpriteSheet.whiteAttackEffectLeft,
      animationRight: CommonSpriteSheet.whiteAttackEffectRight,
      animationUp: CommonSpriteSheet.whiteAttackEffectTop,
      size: Vector2.all(tileSize),
    );
  }

  void execRangeAttack(double angle, double damage) {
    simpleAttackRangeByAngle(
      animation: CommonSpriteSheet.fireBallRight,
      animationDestroy: CommonSpriteSheet.explosionAnimation,
      angle: angle,
      size: Vector2.all(width * 0.7),
      damage: damage,
      speed: maxSpeed * 2,
      collision: CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(width / 3, width / 3),
            align: Vector2(width * 0.1, 0),
          ),
        ],
      ),
      marginFromOrigin: 20,
      lightingConfig: LightingConfig(
        radius: width / 2,
        blurBorder: width,
        color: Colors.orange.withOpacity(0.3),
      ),
      attackFrom: AttackFromEnum.PLAYER_OR_ALLY,
    );
  }

  @override
  void update(double dt) {
    barLifeController?.life = life;
    super.update(dt);
  }

  @override
  void render(Canvas c) {
    if (isWater) {
      c.saveLayer(toRect(), Paint());
    }
    super.render(c);
    _drawDirectionAttack(c);
    if (isWater) {
      c.drawRect(
        Rect.fromLTWH(
          left,
          top + height * 0.62,
          width,
          height * 0.38,
        ),
        _paintFocus,
      );
      c.restore();
    }
  }

  @override
  void receiveDamage(AttackFromEnum attacker, double damage, dynamic from) {
    super.receiveDamage(attacker, damage, from);
    if (hasController) {
      controller.onReceiveDamage(damage);
    }
  }

  void execShowEmote() {
    if (hasGameRef) {
      gameRef.add(
        AnimatedFollowerObject(
          animation: CommonSpriteSheet.emote,
          target: this,
          size: Vector2.all(width / 2),
          positionFromTarget: Vector2(
            18,
            -6,
          ),
        ),
      );
    }
  }

  void changeControllerToVisibleEnemy() {
    if (hasGameRef && !gameRef.camera.isMoving) {
      if (enemyControlled == null) {
        final v = gameRef.visibleEnemies().whereType<Slime>().cast<Slime>();
        if (v.isNotEmpty) {
          enemyControlled = v.first;
          enemyControlled?.controller.enableBehaviors = false;
          gameRef.addJoystickObserver(
            enemyControlled!,
            cleanObservers: true,
            moveCameraToTarget: true,
          );
        }
      } else {
        gameRef.addJoystickObserver(
          this,
          cleanObservers: true,
          moveCameraToTarget: true,
        );
        enemyControlled?.controller.enableBehaviors = true;
        enemyControlled = null;
      }
    }
  }

  void execShowTalk(GameComponent first) {
    gameRef.camera.moveToTargetAnimated(
      first,
      zoom: 1,
      finish: () {
        TalkDialog.show(
          gameRef.context,
          [
            Say(
              text: [
                const TextSpan(
                  text: 'Look at this! It seems that',
                ),
                const TextSpan(
                  text: ' I\'m not alone ',
                  style: TextStyle(color: Colors.red),
                ),
                const TextSpan(
                  text: 'here...',
                ),
              ],
              person: SizedBox(
                width: 100,
                height: 100,
                child: RobotSpriteSheet.idleRight.asWidget(),
              ),
            ),
            Say(
              text: [
                const TextSpan(
                  text: 'Lok Tar Ogr!',
                ),
                const TextSpan(
                  text: ' Lok Tar Ogr! ',
                  style: TextStyle(color: Colors.green),
                ),
                const TextSpan(
                  text: ' Lok Tar Ogr! ',
                ),
                const TextSpan(
                  text: 'Lok Tar Ogr!',
                  style: TextStyle(color: Colors.green),
                ),
              ],
              person: Container(
                width: 100,
                height: 100,
                child: SlimeSpriteSheet.idleRight.asWidget(),
              ),
              personSayDirection: PersonSayDirection.RIGHT,
            ),
          ],
          onClose: () {
            print('close talk');
            if (!this.isDead) {
              gameRef.camera.moveToPlayerAnimated(zoom: 1);
            }
          },
          onFinish: () {
            print('finish talk');
          },
          logicalKeyboardKeysToNext: [
            LogicalKeyboardKey.space,
            LogicalKeyboardKey.enter
          ],
        );
      },
    );
  }

  void _drawDirectionAttack(Canvas c) {
    if (showBgRangeAttack) {
      double radius = height;
      rectDirectionAttack = Rect.fromLTWH(
        rectCollision.center.dx - radius * 2 / 7,
        rectCollision.center.dy - radius * 2 / 7,
        radius * 0.6,
        radius * 0.6,
      );

      if (rectDirectionAttack != null && spriteDirectionAttack != null) {
        renderSpriteByRadAngle(
          c,
          angleRadAttack,
          rectDirectionAttack!,
          spriteDirectionAttack!,
        );
      }
    }
  }

  @override
  Future<void> onLoad() async {
    spriteDirectionAttack = await Sprite.load('equipment/staff/staff_03b.png');
    return super.onLoad();
  }

  @override
  void onMount() {
    barLifeController = BonfireInjector().get<BarLifeController>();
    barLifeController?.configure(maxLife: maxLife, maxStamina: 100);
    super.onMount();
  }

  void execEnableBGRangeAttack(bool enabled, double angle) {
    showBgRangeAttack = enabled;
    angleRadAttack = angle + 0.75;
  }

  void execShowDamage(double damage) {
    showDamage(
      damage,
      config: TextStyle(
        fontSize: width / 3,
        color: Colors.red,
      ),
    );
  }

  void updateStamina(double stamina) {
    barLifeController?.stamina = stamina;
  }
}
