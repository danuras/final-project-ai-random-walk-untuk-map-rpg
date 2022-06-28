import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Tree52x2 extends SimpleEnemy with ObjectCollision {
  Tree52x2(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimation.load(
              "decoration/dark_land/tree/2x2-tree5.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(64, 64),
              ),
            ),
            runRight: SpriteAnimation.load(
              "decoration/dark_land/tree/2x2-tree5.png",
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
            size: Vector2(tileSize * 40 / 32, tileSize * 15 / 32),
            align: Vector2(tileSize * 13 / 32, tileSize * 49 / 32),
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
