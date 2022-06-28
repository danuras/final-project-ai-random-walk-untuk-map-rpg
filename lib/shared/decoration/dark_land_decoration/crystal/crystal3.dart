import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Crystal3 extends SimpleEnemy with ObjectCollision {
  Crystal3(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimation.load(
              "decoration/dark_land/crystal/crystal3.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(32, 32),
              ),
            ),
            runRight: SpriteAnimation.load(
              "decoration/dark_land/crystal/crystal3.png",
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
            size: Vector2(tileSize * 20 / 32, tileSize * 8 / 32),
            align: Vector2(tileSize * 1 / 8, tileSize * 9 / 16),
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
