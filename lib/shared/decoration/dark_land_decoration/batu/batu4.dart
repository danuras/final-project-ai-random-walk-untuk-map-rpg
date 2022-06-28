import 'package:bonfire/bonfire.dart';
import 'package:final_project_ai/main.dart';

class Batu4 extends SimpleEnemy with ObjectCollision {
  Batu4(Vector2 position)
      : super(
          position: position,
          animation: SimpleDirectionAnimation(
            idleRight: SpriteAnimation.load(
              "decoration/dark_land/batu/batu4.png",
              SpriteAnimationData.sequenced(
                amount: 1,
                stepTime: 10,
                textureSize: Vector2(32, 32),
              ),
            ),
            runRight: SpriteAnimation.load(
              "decoration/dark_land/batu/batu4.png",
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
            size: Vector2(tileSize * 26 / 32, tileSize * 14 / 32),
            align: Vector2(tileSize * 4 / 32, tileSize * 14 / 32),
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
