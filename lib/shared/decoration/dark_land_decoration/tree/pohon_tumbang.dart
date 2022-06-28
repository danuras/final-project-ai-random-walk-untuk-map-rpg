import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class PohonTumbang extends SimpleEnemy with ObjectCollision {
  PohonTumbang(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimation.load(
              "decoration/dark_land/tree/pohon_tumbang.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(96, 64),
              ),
            ),
            runRight: SpriteAnimation.load(
              "decoration/dark_land/tree/pohon_tumbang.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(96, 64),
              ),
            ),
          ),
          size: Vector2(tileSize * 3, tileSize * 2),
          life: 40,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSize * 14 / 32, tileSize * 37 / 32),
            align: Vector2(tileSize * 0, tileSize * 25 / 32),
          ),
          CollisionArea.rectangle(
            size: Vector2(tileSize * 15 / 32, tileSize * 44 / 32),
            align: Vector2(tileSize * 14 / 32, tileSize * 16 / 32),
          ),
          CollisionArea.rectangle(
            size: Vector2(tileSize * 5 / 32, tileSize * 36 / 32),
            align: Vector2(tileSize * 29 / 32, tileSize * 20 / 32),
          ),
          CollisionArea.rectangle(
            size: Vector2(tileSize * 15 / 32, tileSize * 49 / 32),
            align: Vector2(tileSize * 34 / 32, tileSize * 12 / 32),
          ),
          CollisionArea.rectangle(
            size: Vector2(tileSize * 6 / 32, tileSize * 43 / 32),
            align: Vector2(tileSize * 49 / 32, tileSize * 15 / 32),
          ),
          CollisionArea.rectangle(
            size: Vector2(tileSize * 40 / 32, tileSize * 55 / 32),
            align: Vector2(tileSize * 55 / 32, tileSize * 7 / 32),
          ),
        ],
      ),
    );
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }
}
