import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Crystal12 extends SimpleEnemy with ObjectCollision {
  Crystal12(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimation.load(
              "decoration/dark_land/crystal/crystal12.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(64, 64),
              ),
            ),
            runRight: SpriteAnimation.load(
              "decoration/dark_land/crystal/crystal12.png",
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
            size: Vector2(tileSize * 42 / 32, tileSize * 25 / 32),
            align: Vector2(tileSize * 10 / 32, tileSize * 27 / 32),
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
