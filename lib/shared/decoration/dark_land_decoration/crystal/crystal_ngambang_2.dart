import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class CrystalNgambang2 extends SimpleEnemy with ObjectCollision {
  CrystalNgambang2(Vector2 position)
      : super(
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimation.load(
              "decoration/dark_land/crystal/crystal_ngambang_2.png",
              SpriteAnimationData.sequenced(
                amount: 6,
                stepTime: 0.1,
                textureSize: Vector2(32, 48),
              ),
            ),
            runRight: SpriteAnimation.load(
              "decoration/dark_land/crystal/crystal_ngambang_2.png",
              SpriteAnimationData.sequenced(
                amount: 6,
                stepTime: 0.1,
                textureSize: Vector2(32, 48),
              ),
            ),
          ),
          size: Vector2(tileSize, tileSize * 1.5),
          position: position,
          life: 100,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSize * 12 / 32, tileSize * 18 / 32),
            align: Vector2(tileSize * 10 / 32, tileSize * 8 / 32),
          ),
        ],
      ),
    );
  }
  @override
  void receiveDamage(AttackFromEnum attacker, double damage, dynamic from) {
    super.receiveDamage(attacker, damage, from);
  }
}
