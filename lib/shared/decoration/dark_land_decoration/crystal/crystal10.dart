import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Crystal10 extends SimpleEnemy with ObjectCollision {
  Crystal10(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimation.load(
              "decoration/dark_land/crystal/crystal10.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(32, 64),
              ),
            ),
            runRight: SpriteAnimation.load(
              "decoration/dark_land/crystal/crystal10.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(tileSize, tileSize * 2),
              ),
            ),
          ),
          size: Vector2(32, 64),
          life: 100,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSize * 23 / 32, tileSize * 12 / 32),
            align: Vector2(0, tileSize * 36 / 32),
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
