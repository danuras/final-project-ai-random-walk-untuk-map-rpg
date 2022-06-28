import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Tree5x5 extends SimpleEnemy with ObjectCollision {
  Tree5x5(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimation.load(
              "decoration/dark_land/tree/5x5-tree.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(160, 160),
              ),
            ),
            runRight: SpriteAnimation.load(
              "decoration/dark_land/tree/5x5-tree.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(160, 160),
              ),
            ),
          ),
          size: Vector2(tileSize * 5, tileSize * 5),
          life: 40,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSize * 10 / 32, tileSize * 24 / 32),
            align: Vector2(tileSize * 34 / 32, tileSize * 125 / 32),
          ),
          CollisionArea.rectangle(
            size: Vector2(tileSize * 57 / 32, tileSize * 31 / 32),
            align: Vector2(tileSize * 44 / 32, tileSize * 124 / 32),
          ),
          CollisionArea.rectangle(
            size: Vector2(tileSize * 21 / 32, tileSize * 30 / 32),
            align: Vector2(tileSize * 101 / 32, tileSize * 121 / 32),
          ),
          CollisionArea.rectangle(
            size: Vector2(tileSize * 6 / 32, tileSize * 12 / 32),
            align: Vector2(tileSize * 122 / 32, tileSize * 134 / 32),
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
