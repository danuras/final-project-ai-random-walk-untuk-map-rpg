import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class CrystalNgambang extends SimpleEnemy with ObjectCollision {
  CrystalNgambang(Vector2 position)
      : super(
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimation.load(
              "decoration/dark_land/crystal/crystal_ngambang.png",
              SpriteAnimationData.sequenced(
                amount: 6,
                stepTime: 0.2,
                textureSize: Vector2(32, 64),
              ),
            ),
            runRight: SpriteAnimation.load(
              "decoration/dark_land/crystal/crystal_ngambang.png",
              SpriteAnimationData.sequenced(
                amount: 6,
                stepTime: 0.2,
                textureSize: Vector2(32, 64),
              ),
            ),
          ),
          size: Vector2(tileSize, tileSize * 2),
          position: position,
          life: 100,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSize * 20 / 32, tileSize * 34 / 32),
            align: Vector2(tileSize * 6 / 32, tileSize * 8 / 32),
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
