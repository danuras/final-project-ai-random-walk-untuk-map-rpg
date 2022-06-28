import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Tree32x3 extends SimpleEnemy with ObjectCollision {
  Tree32x3(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimation.load(
              "decoration/green_place/tree/tree2x3c.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(64, 96),
              ),
            ),
            runRight: SpriteAnimation.load(
              "decoration/green_place/tree/tree2x3c.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(64, 96),
              ),
            ),
          ),
          size: Vector2(tileSize * 2, tileSize * 3),
          life: 40,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSize * 55 / 32, tileSize * 16 / 32),
            align: Vector2(tileSize * 6 / 32, tileSize * 80 / 32),
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
