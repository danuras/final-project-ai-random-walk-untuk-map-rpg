import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Batu7 extends SimpleEnemy with ObjectCollision {
  Batu7(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimation.load(
              "decoration/dark_land/batu/batu7.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(32, 32),
              ),
            ),
            runRight: SpriteAnimation.load(
              "decoration/dark_land/batu/batu7.png",
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
            size: Vector2(tileSize * 25 / 32, tileSize * 10 / 32),
            align: Vector2(tileSize * 5 / 32, tileSize * 10 / 32),
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
