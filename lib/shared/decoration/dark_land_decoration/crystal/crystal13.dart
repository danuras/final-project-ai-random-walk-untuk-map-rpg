import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Crystal13 extends SimpleEnemy with ObjectCollision {
  Crystal13(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimation.load(
              "decoration/dark_land/crystal/crystal13.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(64, 32),
              ),
            ),
            runRight: SpriteAnimation.load(
              "decoration/dark_land/crystal/crystal13.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(64, 32),
              ),
            ),
          ),
          size: Vector2(2 * tileSize, tileSize),
          life: 100,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSize * 58 / 32, tileSize * 17 / 32),
            align: Vector2(tileSize * 4 / 32, tileSize * 13 / 32),
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
