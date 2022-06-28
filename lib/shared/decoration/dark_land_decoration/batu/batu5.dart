import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Batu5 extends SimpleEnemy with ObjectCollision {
  Batu5(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimation.load(
              "decoration/dark_land/batu/batu5.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(64, 32),
              ),
            ),
            runRight: SpriteAnimation.load(
              "decoration/dark_land/batu/batu5.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(64, 32),
              ),
            ),
          ),
          size: Vector2(tileSize * 2, tileSize),
          life: 80,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(tileSize * 56 / 32, tileSize * 16 / 32),
            align: Vector2(tileSize * 5 / 32, tileSize * 14 / 32),
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
