import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Tree22x2 extends SimpleEnemy with ObjectCollision {
  Tree22x2(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimation.load(
              "decoration/green_place/tree/tree2x2b.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(64, 64),
              ),
            ),
            runRight: SpriteAnimation.load(
              "decoration/green_place/tree/tree2x2b.png",
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
            size: Vector2(tileSize * 34 / 32, tileSize * 14 / 32),
            align: Vector2(tileSize * 17 / 32, tileSize * 49 / 32),
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
