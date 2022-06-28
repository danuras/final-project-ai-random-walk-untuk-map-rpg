import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Crystal1 extends SimpleEnemy with ObjectCollision {
  Crystal1(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimation.load(
              "decoration/dark_land/crystal/crystal1.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(32, 32),
              ),
            ),
            runRight: SpriteAnimation.load(
              "decoration/dark_land/crystal/crystal1.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(32, 32),
              ),
            ),
          ),
          size: Vector2.all(tileSize),
          life: 40,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSize * 5 / 8, tileSize * 5 / 32),
            align: Vector2(tileSize * 3 / 16, tileSize * 9 / 16),
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
