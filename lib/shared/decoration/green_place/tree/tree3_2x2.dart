import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Tree32x2 extends SimpleEnemy with ObjectCollision {
  Tree32x2(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimation.load(
              "decoration/green_place/tree/tree2x2c.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(64, 64),
              ),
            ),
            runRight: SpriteAnimation.load(
              "decoration/green_place/tree/tree2x2c.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(64, 64),
              ),
            ),
          ),
          size: Vector2.all(tileSize * 2),
          life: 40,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSize * 56 / 32, tileSize * 16 / 32),
            align: Vector2(tileSize * 3 / 32, tileSize * 48 / 32),
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
