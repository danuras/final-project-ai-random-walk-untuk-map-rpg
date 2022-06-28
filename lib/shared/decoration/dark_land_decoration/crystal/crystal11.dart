import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Crystal11 extends SimpleEnemy with ObjectCollision {
  Crystal11(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimation.load(
              "decoration/dark_land/crystal/crystal11.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(64, 64),
              ),
            ),
            runRight: SpriteAnimation.load(
              "decoration/dark_land/crystal/crystal11.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(64, 64),
              ),
            ),
          ),
          size: Vector2(tileSize * 2, tileSize * 2),
          life: 100,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSize * 48 / 32, tileSize * 18 / 32),
            align: Vector2(tileSize * 6 / 32, tileSize * 34 / 32),
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
